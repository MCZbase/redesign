<!---https://www.jqwidgets.com/community/topic/jqwidget-grid-for-coldfusion/--->
<cfcomponent>
<cffunction name="getDataTable" access="remote" returntype="any" returnformat="json">
<cfset username="#session.dbuser#" />
<cfset password="#decrypt(session.epw,cfid)#">
<cfset listColumns ="taxon_name_id,phylclass,suborder,family,subfamily,genus,species" />
<cfif isDefined("searchText") and len(searchText) gt 0>
<cfquery name="qryLoc" datasource="uam_god">
select #listColumns# from taxonomy
WHERE CONTAINS(taxon_name_id, <cfqueryparam cfsqltype="CF_SQL_TEXT" value="#searchText#">, 1) > 0 and rownum <= 50
</cfquery>
<cfelse>
<cfquery name="qryLoc" datasource="user_login" username="#username#" password="#password#">
select taxon_name_id, scientific_name, phylclass, suborder, family, subfamily, genus, species, valid_catalog_term_fg, source_authority, full_taxon_name, author_text, tribe, infraspecific_rank, taxon_remarks, phylum, kingdom, nomenclatural_code  from taxonomy where rownum <= 50
</cfquery>
</cfif>
<cfoutput>
	<cfset i = 1>
	<cfset data = ArrayNew(1)>
	<cfloop query="qryLoc">
		<cfset row = StructNew()>
		<cfset row["taxon_name_id"] = "#qryLoc.taxon_name_id#">
		<cfset row["scientific_name"] = "#qryLoc.scientific_name#">
		<cfset row["phylclass"] = "#qryLoc.phylclass#">
		<cfset row["suborder"] = "#qryLoc.suborder#">
		<cfset row["family"] = "#qryLoc.family#">
		<cfset row["subfamily"] = "#qryLoc.subfamily#">
		<cfset row["genus"] = "#qryLoc.genus#">
		<cfset row["species"] = "#qryLoc.species#">
		<cfset row["valid_catalog_term_fg"] = "#qryLoc.valid_catalog_term_fg#">
		<cfset row["source_authority"] = "#qryLoc.source_authority#">
		<cfset row["full_taxon_name"] = "#qryLoc.full_taxon_name#">
		<cfset row["author_text"] = "#qryLoc.author_text#">
		<cfset row["tribe"] = "#qryLoc.tribe#">
		<cfset row["infraspecific_rank"] = "#qryLoc.infraspecific_rank#">
		<cfset row["taxon_remarks"] = "#qryLoc.taxon_remarks#">
		<cfset row["phylum"] = "#qryLoc.phylum#">
		<cfset row["kingdom"] = "#qryLoc.kingdom#">
		<cfset row["nomenclatural_code"] = "#qryLoc.nomenclatural_code#">
		
		<cfset data[i]  = row>
		<cfset i = i + 1>
	</cfloop>
<cfoutput>
</cfoutput>
	<cfreturn #serializeJSON(data)#>
</cfoutput>
</cffunction>
</cfcomponent>