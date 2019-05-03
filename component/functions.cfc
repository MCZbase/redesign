<cfcomponent>
<cfinclude template = "../includes/functionLib.cfm">
<!------------------------------------------------------------------->
<cffunction name="getExternalStatus" access="remote">
	<cfargument name="uri" type="string" required="yes">
	<cfhttp url="#uri#" method="head"></cfhttp>
	<cfreturn left(cfhttp.statuscode,3)>
</cffunction>

<cffunction name="getShipmentsByTrans" returntype="query" access="remote">
	<cfargument name="transaction_id" type="string" required="yes">
	<cfset r=1>
	<cftry>
	    <cfquery name="theResult" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
			select 1 as status, shipment_id, packed_by_agent_id, shipped_carrier_method, shipped_date, package_weight, no_of_packages,
                   hazmat_fg, insured_for_insured_value, shipment_remarks, contents, foreign_shipment_fg, shipped_to_addr_id,
                   shipped_from_addr_id, fromaddr.formatted_addr, toaddr.formatted_addr,
 	           shipment.print_flag
             from shipment
                  left join addr fromaddr on shipment.shipped_from_addr_id = fromaddr.addr_id
                  left join addr toaddr on shipment.shipped_from_addr_id = toaddr.addr_id
             where shipment.transaction_id =<cfqueryparam cfsqltype="CF_SQL_DECIMAL" value="#transaction_id#">
		</cfquery>
		<cfif theResult.recordcount eq 0>
	  	  <cfset theResult=queryNew("status, message")>
		  <cfset t = queryaddrow(theResult,1)>
		  <cfset t = QuerySetCell(theResult, "status", "0", 1)>
		  <cfset t = QuerySetCell(theResult, "message", "No shipments found.", 1)>
		</cfif>
	<cfcatch>
	  <cfset theResult=queryNew("status, message")>
		<cfset t = queryaddrow(theResult,1)>
		<cfset t = QuerySetCell(theResult, "status", "-1", 1)>
		<cfset t = QuerySetCell(theResult, "message", "#cfcatch.type# #cfcatch.message# #cfcatch.detail#", 1)>
	  </cfcatch>
	</cftry>
    <cfif isDefined("asTable") AND asTable eq "true">
	    <cfreturn resulthtml>
    <cfelse>
   	    <cfreturn theResult>
    </cfif>
</cffunction>
<!----------------------------------------------------------------------------------------------------------------->

<!---  Obtain the list of shipments and their permits for a transaction formatted in html for display on a transaction page --->
<!---  @param transaction_id  the transaction for which to obtain a list of shipments and their permits.  --->
<!---  @return html list of shipments and permits, including editing controls for adding/editing/removing shipments and permits. --->
<cffunction name="getShipmentsByTransHtml" returntype="string" access="remote" returnformat="plain">
   <cfargument name="transaction_id" type="string" required="yes">
   <cfset r=1>
   <cfthread name="getSBTHtmlThread">
   <cftry>
       <cfquery name="theResult" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
         select 1 as status, shipment_id, packed_by_agent_id, shipped_carrier_method, shipped_date, package_weight, no_of_packages,
                   hazmat_fg, insured_for_insured_value, shipment_remarks, contents, foreign_shipment_fg, shipped_to_addr_id, carriers_tracking_number,
                   shipped_from_addr_id, fromaddr.formatted_addr, toaddr.formatted_addr,
                   toaddr.country_cde tocountry, toaddr.institution toinst, toaddr.formatted_addr tofaddr,
                   fromaddr.country_cde fromcountry, fromaddr.institution frominst, fromaddr.formatted_addr fromfaddr,
 	           shipment.print_flag
             from shipment
                  left join addr fromaddr on shipment.shipped_from_addr_id = fromaddr.addr_id
                  left join addr toaddr on shipment.shipped_to_addr_id = toaddr.addr_id
             where shipment.transaction_id =<cfqueryparam cfsqltype="CF_SQL_DECIMAL" value="#transaction_id#">
             order by shipped_date
      </cfquery>
      <cfset resulthtml = "<div id='shipments'> ">

      <cfloop query="theResult">
         <cfif print_flag eq "1">
            <cfset printedOnInvoice = "&##9745; Printed on invoice">
         <cfelse>
            <cfset printedOnInvoice = "<span class='infoLink' onClick=' setShipmentToPrint(#shipment_id#,#transaction_id#); ' >&##9744; Not Printed</span>">
         </cfif>
         <cfquery name="shippermit" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
                 select permit.permit_id,
                   issuedBy.agent_name as IssuedByAgent,
                   issued_Date,
                   renewed_Date,
                   exp_Date,
                   permit_Num,
                   permit_Type
                 from
                   permit_shipment left join permit on permit_shipment.permit_id = permit.permit_id
                   left join preferred_agent_name issuedBy on permit.issued_by_agent_id = issuedBy.agent_id
                 where
                   permit_shipment.shipment_id = <cfqueryparam cfsqltype="CF_SQL_DECIMAL" value="#shipment_id#">
         </cfquery>
         <cfset resulthtml = resulthtml & "<div class='shipment'>" >
            <cfset resulthtml = resulthtml & "<ul class='shipheaders'><li>Ship Date:</li><li>Method:</li><li>Packages:</li><li>Tracking Number:</li></ul>">
            <cfset resulthtml = resulthtml & " <ul class='shipdata'>" >
                <cfset resulthtml = resulthtml & "<li>#dateformat(shipped_date,'yyyy-mm-dd')#&nbsp;</li> " >
                <cfset resulthtml = resulthtml & " <li>#shipped_carrier_method#&nbsp;</li> " >
                <cfset resulthtml = resulthtml & " <li>#no_of_packages#&nbsp;</li> " >
                <cfset resulthtml = resulthtml & " <li>#carriers_tracking_number#</li>">
            <cfset resulthtml = resulthtml & "</ul>">
            <cfset resulthtml = resulthtml & "<ul class='shipaddresseshead'><li>Shipped To:</li><li>Shipped From:</li></ul>">
            <cfset resulthtml = resulthtml & " <ul class='shipaddressesdata'>">
                <cfset resulthtml = resulthtml & "<li>(#printedOnInvoice#) #tofaddr#</li> ">
                <cfset resulthtml = resulthtml & " <li>#fromfaddr#</li>">
            <cfset resulthtml = resulthtml & "</ul>">
            <cfset resulthtml = resulthtml & "<div class='changeship'><div class='shipbuttons'><input type='button' value='Edit this Shipment' class='lnkBtn' onClick=""$('##dialog-shipment').dialog('open'); loadShipment(#shipment_id#,'shipmentForm');""></div><div class='shipbuttons' id='addPermit_#shipment_id#'><input type='button' value='Add Permit to this Shipment' class='lnkBtn' onClick=""opendialog('picks/PermitShipmentPick.cfm?shipment_id=#shipment_id#','##addPermitDlg_#shipment_id#','Pick Permit for Shipment'); "" ></div><div id='addPermitDlg_#shipment_id#'></div></div> ">

            <cfset resulthtml = resulthtml & "<div class='shippermitstyle'><h4>Permits:</h4>">
                 <cfset resulthtml = resulthtml & "<div class='permitship'><span id='permits_ship_#shipment_id#'>">
                 <cfloop query="shippermit">
                    <cfset resulthtml = resulthtml & "<ul class='permitshipul'><li>#permit_type# #permit_Num#</li><li>Issued: #dateformat(issued_Date,'yyyy-mm-dd')#</li><li style='width:300px;'> #IssuedByAgent#</li></ul>">
                    <cfset resulthtml = resulthtml & "<ul class='permitshipul2'>">
                       <cfset resulthtml = resulthtml & "<li><input type='button' class='savBtn' style='padding:1px 6px;' onClick=' window.open(""Permit.cfm?Action=editPermit&permit_id=#permit_id#"")' target='_blank' value='Edit'></li> ">
                       <cfset resulthtml = resulthtml & "<li><input type='button' class='delBtn' style='padding:1px 6px;' onClick='confirmAction(""Remove this permit from this shipment (#permit_type# #permit_Num#)?"", ""Confirm Remove Permit"", function() { deletePermitFromShipment(#theResult.shipment_id#,#permit_id#,#transaction_id#); } ); ' value='Remove Permit'></li>">
                       <cfset resulthtml = resulthtml & "<li>">
                       <cfset resulthtml = resulthtml & "<input type='button' onClick=' opendialog(""picks/PermitPick.cfm?Action=movePermit&permit_id=#permit_id#&transaction_id=#transaction_id#&current_shipment_id=#theResult.shipment_id#"",""##movePermitDlg_#theResult.shipment_id##permit_id#"",""Move Permit to another Shipment"");' class='lnkBtn' style='padding:1px 6px;' value='Move'>">
                       <cfset resulthtml = resulthtml & "<span id='movePermitDlg_#theResult.shipment_id##permit_id#'></span></li>">
                    <cfset resulthtml = resulthtml & "</ul>">
                 </cfloop>
                 <cfif shippermit.recordcount eq 0>
                     <cfset resulthtml = resulthtml & "None">
                 </cfif>
            <cfset resulthtml = resulthtml & "</span></div></div>"> <!--- span#permit_ships_, div.permitship div.shippermitsstyle --->
            <cfif shippermit.recordcount eq 0>
                <cfset resulthtml = resulthtml & "<div class='deletestyle' id='removeShipment_#shipment_id#'><input type='button' value='Delete this Shipment' class='delBtn' onClick="" confirmAction('Delete this shipment (#theResult.shipped_carrier_method# #theResult.carriers_tracking_number#)?', 'Confirm Delete Shipment', function() { deleteShipment(#shipment_id#,#transaction_id#); }  ); "" ></div>">
            <cfelse>
                <cfset resulthtml = resulthtml & "<div class='deletestyle'><input type='button' class='disBtn' value='Delete this Shipment'></div>">
            </cfif>
            <cfset resulthtml = resulthtml & "</div>" > <!--- shipment div --->
      </cfloop> <!--- theResult --->
      <cfset resulthtml = resulthtml & "</div>"><!--- shipments div --->
      <cfif theResult.recordcount eq 0>
          <cfset resulthtml = resulthtml & "No shipments found for this transaction.">
      </cfif>
   <cfcatch>
       <cfset resulthtml = resulthtml & "Error:" & "#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
   </cfcatch>
   </cftry>
     <cfoutput>#resulthtml#</cfoutput>
   </cfthread>
    <cfthread action="join" name="getSBTHtmlThread" />
    <cfreturn getSBTHtmlThread.output>
</cffunction>


		  
</cfcomponent>
