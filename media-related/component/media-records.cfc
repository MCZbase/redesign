<!---https://www.jqwidgets.com/community/topic/jqwidget-grid-for-coldfusion/--->




<cfcomponent>
<cffunction name="getDataTable" access="remote" returntype="any" returnformat="json">
<cfset username="#session.dbuser#" />
<cfset password="#decrypt(session.epw,cfid)#">
<cfset listColumns ="m.media_id, m.media_uri, m.mime_type, m.media_type, m.preview_uri,m.media_license_id, m.mask_media_fg, ml.media_label,ml.label_value,mk.keywords, mk.lastdate" />
<cfif isDefined("searchText") and len(searchText) gt 0>
<cfquery name="qryLoc" datasource="uam_god">
select #listColumns# from media
WHERE CONTAINS(media_id, <cfqueryparam cfsqltype="CF_SQL_TEXT" value="#searchText#">, 1) > 0
</cfquery>
<cfelse>

<cfquery name="qryLoc" datasource="user_login" username="#username#" password="#password#">
select #listColumns# from media m,media_labels ml, media_keywords mk where m.media_id = ml.media_id and mk.media_id = m.media_id and rownum <= 20																									   
</cfquery>
</cfif>
<cfoutput>
	<cfset i = 1>
	<cfset data = ArrayNew(1)>
	<cfloop query="qryLoc">
		<cfset row = StructNew()>
		<cfset row["media_id"] = "#qryLoc.media_id#">
		<cfset row["media_uri"] = "#qryLoc.media_uri#">
		<cfset row["mime_type"] = "#qryLoc.mime_type#">
		<cfset row["media_type"] = "#qryLoc.media_type#">
		<cfset row["preview_uri"] = "#qryLoc.preview_uri#">
		<cfset row["media_license_id"] = "#qryLoc.media_license_id#">
		<cfset row["mask_media_fg"] = "#qryLoc.mask_media_fg#">
        <cfset row["media_label"] = "#qryLoc.media_label#">
		<cfset row["label_value"] = "#qryLoc.label_value#">
		<cfset row["keywords"] = "#qryLoc.keywords#">
		<cfset row["lastdate"] = "#qryLoc.lastdate#">
		<cfset data[i]  = row>
		<cfset i = i + 1>
	</cfloop>
<cfoutput>
</cfoutput>
	<cfreturn #serializeJSON(data)#>
</cfoutput>
</cffunction>
</cfcomponent>