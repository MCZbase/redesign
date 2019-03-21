<!---https://www.jqwidgets.com/community/topic/jqwidget-grid-for-coldfusion/--->


<cfcomponent>
<cffunction name="getDataTable" access="remote" returntype="any" returnformat="json">
<cfset username="#session.dbuser#" />
<cfset password="#decrypt(session.epw,cfid)#">
<cfset listColumns ="ff.collection_object_id,ff.collection,ff.cat_num,ff.scientific_name,ff.spec_locality,ff.higher_geog,ff.collectors" />
<cfif isDefined("searchText") and len(searchText) gt 0>
<cfquery name="qryLoc" datasource="uam_god">
select #listColumns# from #session.flatTableName# ff, FLAT_text ft 
WHERE CONTAINS(ft.cat_num, <cfqueryparam cfsqltype="CF_SQL_TEXT" value="#searchText#">, 1) > 0 and ft.collection_object_id = ff.collection_object_id
</cfquery>
<cfelse>
<cfquery name="qryLoc" datasource="user_login" username="#username#" password="#password#">
select #listColumns# from #session.flatTableName# ff where rownum <= 50 and spec_locality like '%Massachusetts%'
</cfquery>
</cfif>
<cfoutput>
	<cfset i = 1>
	<cfset data = ArrayNew(1)>
	<cfloop query="qryLoc">
		<cfset row = StructNew()>
		<cfset row["collection_object_id"] = "#qryLoc.collection_object_id#">
		<cfset row["collection"] = "#qryLoc.collection#">
		<cfset row["cat_num"] = "#qryLoc.cat_num#">
		<cfset row["scientific_name"] = "#qryLoc.scientific_name#">
		<cfset row["spec_locality"] = "#qryLoc.spec_locality#">
		<cfset row["higher_geog"] = "#qryLoc.higher_geog#">
		<cfset row["collectors"] = "#qryLoc.collectors#">
		
		<cfset data[i]  = row>
		<cfset i = i + 1>
	</cfloop>
<cfoutput>
</cfoutput>
	<cfreturn #serializeJSON(data)#>
</cfoutput>
</cffunction>
</cfcomponent>
