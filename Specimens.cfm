<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
<cfoutput>
	<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right zindex-sticky" id="cbp-spmenu-s2">
	<section> <a id="showRightPush" class="btn black-filter-btn" role="button">Refine Results</a> </section>
	<h3 class="filters">Refine Results</h3>
	<div class="col-md-3 py-4 mb-3 pl-3 bg-transparent">
		<h4 class="mt-2 float-left w-267">By Columns and Values</h4>
		<div class="float-left">
			<div id="columnchooser" class="mb-1"></div>
			<div class="mt-1 ml-0 d-inline float-left w-267" id="filterbox">
				<p>Search for something to filter</p>
			</div>
			<div class="w-280">
				<input type="button" id="applyfilter" class="d-inline float-left ml-0 mr-3 mt-2 py-1 px-2 fs-14" value="Apply Filter"/>
				<input type="button" id="clearfilter" class="d-inline ml-0 mt-2 py-1 px-2 fs-14" value="Clear Filter"/>
			</div>
		</div>
		<div class="float-left mt-3 w-267">
			<h4>Date</h4>
			<div class="float-left wd-110p">
				<label class="mb-1 ml-0">From</label>
				<input id="began_date" type="text" name="began_date" class="ml-0 px-1 rounded wd-100p">
			</div>
			<div class="float-left wd-100p">
				<label class="mb-1 ml-1">To</label>
				<input id="ended_date" name="ended_date" class="px-1 rounded wd-100p" type="text">
			</div>
			<div class="float-left ml-2 mt-8"> <a id="refine" value="Refine" href="##"/>Refine</a> </div>
		</div>
	</div>
	</nav>
	<nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left zindex-sticky" id="cbp-spmenu-s3">
	<section> <a id="showLeftPush" class="btn black-columns-btn" role="button">Columns</a> </section>
	<h3 class="columns">Display Columns</h3>
	<div class="col-md-3 mb-3 pl-1 mt-2">
		<ul class="checks">
			<li>
				<input type="radio">
				Check all </li>
			<li>
				<input type="radio">
				Minimum </li>
		</ul>
		<div class="float-left zindex-sticky bg-white">
			<div id="jqxlistbox2" class="ml-1 mt-4"></div>
		</div>
	</div>
	</nav>
<cfquery name="getCount" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	SELECT count(collection_object_id) as cnt FROM cataloged_item
</cfquery>
<cfquery name="collSearch" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	SELECT
		collection.institution,
		collection.collection,
		collection.collection_id,
		collection.guid_prefix
	FROM
		collection
	ORDER BY collection.collection
</cfquery>
<script>

</script>
<cfquery name="ctElevUnits" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select orig_elev_units from CTORIG_ELEV_UNITS
</cfquery>
<cfquery name="ctDepthUnits" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select depth_units from ctDepth_Units
</cfquery>
<cfquery name="ContOcean" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select continent_ocean from ctContinent ORDER BY continent_ocean
</cfquery>
<cfquery name="Country" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select distinct(country) from geog_auth_rec order by country
</cfquery>
<cfquery name="IslGrp" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select island_group from ctIsland_Group order by Island_Group
</cfquery>
<cfquery name="Feature" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select distinct(Feature) from geog_auth_rec order by Feature
</cfquery>
<cfquery name="Water_Feature" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select distinct(Water_Feature) from geog_auth_rec order by Water_Feature
</cfquery>
<cfquery name="ctgeology_attribute"  datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select attribute from geology_attribute_hierarchy group by attribute order by attribute
</cfquery>
<cfquery name="ctgeology_attribute_val"  datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select attribute_value from geology_attribute_hierarchy group by attribute_value order by attribute_value
</cfquery>
<cfquery name="ctlat_long_error_units"  datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select lat_long_error_units from ctlat_long_error_units group by lat_long_error_units order by lat_long_error_units
</cfquery>
<cfquery name="ctverificationstatus"  datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
select verificationstatus from ctverificationstatus group by verificationstatus order by verificationstatus
</cfquery>
<cfquery name="ctmedia_type" datasource="cf_dbuser" cachedwithin="#createtimespan(0,0,60,0)#">
select media_type from ctmedia_type order by media_type
</cfquery>
<cfif isdefined("session.roles") and listfindnocase(session.roles,"coldfusion_user")>
<cfset oneOfUs = 1>
<cfset isClicky = "likeLink">
<cfelse>
<cfset oneOfUs = 0>
<cfset isClicky = "">
</cfif>
<div class="search-form-div pb-4 px-3">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-11 col-sm-12">
				<h1 class="h3 smallcaps mt-4 pl-1">Search Specimen Records <span class="mt-2 font-italic pb-4 color-green fs-15 mx-0">(access to #getCount.cnt# records)</span> </h1>
				<div class="tab-card-main mt-1 tab-card">
				<div class="card-header tab-card-header pb-0 w-100">
					<ul class="nav nav-tabs card-header-tabs pt-1" id="myTab" role="tablist">
						<li class="nav-item col-sm-12 col-md-2 px-1"> <a class="nav-link active" id="one-tab" data-toggle="tab" href="##one" role="tab" aria-controls="One" aria-selected="true" >Keyword</a> </li>
						<li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="two-tab" data-toggle="tab" href="##two" role="tab" aria-controls="Two" aria-selected="false">Search Builder</a> </li>
						<li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="three-tab" data-toggle="tab" href="##three" role="tab" aria-controls="Three" aria-selected="false">Custom Fixed Search</a> </li>
					</ul>
				</div>
				<div class="tab-content pb-0" id="myTabContent">
				<!---Keyword Search--->

				<div class="tab-pane fade show active py-3 mx-sm-3 mb-3" id="one" role="tabpanel" aria-labelledby="one-tab">
					<h2 class="h3 card-title ml-2">Keyword Search</h2>
					<form id="searchForm">
						<div class="col-xs-8 col-md-4 col-lg-6 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn">
									<select class="dropdown-menu fs-14 col-multi-select"  id="col-multi-select" role="menu" multiple="multiple">
										<cfloop query="collSearch">
											<option value="#collSearch.guid_prefix#"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
										</cfloop>
									</select>
								</div>
								<input id="searchText" type="text" class="has-clear form-control form-control-borderless rounded" name="searchText" placeholder="Search term">
								<span class="input-group-btn">
									<button class="btn bg-blue-gray py-45 px-3 border-0" type="submit">
										<i class="fa fa-search text-body"></i>
									</button>
								</span> 
							</div>
						</div>
					</form>
				</div>
				<!---Search Builder--->
				<div class="tab-pane fade show py-3 mx-sm-3 mb-3" id="two" role="tabpanel" aria-labelledby="two-tab">
					<form id="searchForm2">
						<h2 class="h3 card-title ml-2">Search Builder</h2>
						<div id="POItablediv" class="bg-0 col-sm-11 col-md-11">
								<div class="input-group d-md-flex d-sm-flex">
								<div class="d-md-flex rounded"> 
								<table class="form-table fs-14 pb-2" id="customFields">
									<tr class="rounded ml-0">
										<td class="mx-1 p-0 border-0"></td>
										<td class="mx-1 p-0 border-0">
											<select title="selectType" name="selectType" id="selectType" class="custom-select border fs-14">
											  <optgroup label="Identifiers">
													<option>MCZ Catalog (Collection)</option>
													<option>Catalog Number</option>
													<option>Number plus other identifiers?</option>
													<option>Other Identifier Type</option>
													<option>Accession</option>
													<option>Accession Agency</option>
											  </optgroup>
											  <optgroup label="Taxonomy">
													<option>Any Taxonomic Element</option>
												  <optgroup label="Scientific Name">
													<option>Scientific Name</option>
													  	<option>&nbsp;&nbsp;&nbsp;Genus</option>
														<option>&nbsp;&nbsp;&nbsp;Subgenus</option>		<option>&nbsp;&nbsp;&nbsp;Species</option>		<option>&nbsp;&nbsp;&nbsp;Subspecies</option>
												</optgroup>
													<option>Author Text</option>
													<option>Infraspecific Author Text</option>		
													<optgroup label="&nbsp;&nbsp;&nbsp;Higher Taxonomy" style="font-weight: 350;">
														<optgroup label="&nbsp;&nbsp;&nbsp;&nbsp;Class">
															<option>&nbsp;&nbsp;&nbsp;Class</option>
															<option>&nbsp;&nbsp;&nbsp;Superclass</option>
															<option>&nbsp;&nbsp;&nbsp;Subclass</option>
														</optgroup>
														<optgroup label="&nbsp;&nbsp;&nbsp;&nbsp;Order">
															<option>&nbsp;&nbsp;&nbsp;Order</option>
															<option>&nbsp;&nbsp;&nbsp;Superorder</option>
															<option>&nbsp;&nbsp;&nbsp;Suborder</option>
															<option>&nbsp;&nbsp;&nbsp;Infraorder</option>
														</optgroup>
												
														<optgroup label="&nbsp;&nbsp;&nbsp;&nbsp;Family">	
															<option>&nbsp;&nbsp;&nbsp;Family</option>
															<option>&nbsp;&nbsp;&nbsp;Superfamily</option>
															<option>&nbsp;&nbsp;&nbsp;Subfamily</option>
												        </optgroup>
														<option>&nbsp;&nbsp;&nbsp;Tribe</option>
													
													</optgroup>
														<option>&nbsp;&nbsp;&nbsp;Authority</option>
														<option>&nbsp;&nbsp;&nbsp;Taxon Status</option>
														<option>&nbsp;&nbsp;&nbsp;Nomenclatural Code</option>
													</optgroup>
												  <option> A.B.1 </option>
											  </optgroup>
											  <optgroup label="Higher Geography">
												  <option> A.B.1 </option>
											  </optgroup>
											  <optgroup label="Locality">
												  <option> A.B.1 </option>
											  </optgroup>
											  <optgroup label="Biological Individual">
												  <option> A.B.1 </option>
											  </optgroup>
											</select>
										</td>
												<td class="mx-1 p-0 border-0">
													<select title="comparator" name="comparator" id="comparator" class="custom-select border minw-field-sm w-field-sm fs-14">
														<option value="">Comparator</option>
														<option value="like">contains</option>
														<option value="eq">is</option>
													</select>
												</td>
												<td class="mx-1 p-0 border-0">
													<input type="text" class="form-control flex enter-search mx-0 minw-field w-field px-2 fs-14" name="srchTxt" id="srchTxt" placeholder="Enter Value"/>
												</td>											
											<td class="border-0">
												<a class="rounded border-gray addCF p-2" href="javascript:void(0);">Add</a>
											</td>
										</tr>
									</table>
									</div>
							</div>
						</div>
						<!---
						
						
									<table class="form-table" id="customFields">
										<tr valign="top">
											<th scope="row"><label for="customFieldName">Custom Field</label></th>
											<td>
												 &nbsp;
												<input type="text" class="code" id="customFieldValue" name="customFieldValue[]" value="" placeholder="Input Value" /> &nbsp;
												<a href="javascript:void(0);" id="addCF">Add</a>
											</td>
										</tr>
									</table>
									
									<table class="table responsive-table text-muted mb-3 rounded b-collapse-s float-left" id="POITable" border="1">
										<tbody>
											<tr class="d-none">
												<td class="d-none;">##</td>
												<td>and/or/not</td>
												<td>&nbsp;&nbsp;keyword</td>
												<td>contains/is</td>
												<td>&nbsp;&nbsp;value</td>
												<td>&nbsp;&nbsp;delete?</td>
											</tr>
											<tr class="row_2 rounded ml-0">
												<td class="d-none">1</td>
												<td class="mx-1 p-0 border-0">
													<select title="joinOperator" name="joinOperator" id="joinOperator" class="custom-select border minw-field-sm w-field-sm">
														<option value="">Select...</option>
														<option value="and">and</option>
														<option value="or">or</option>
														<option value="not">not</option>
													</select>
												</td>
												<td class="mx-1 p-0 border-0">
													<div class="bg-white py-45 pr-2" id="dropDownButton">
														<div id="jqxTree" class="border-0">
															<ul class="w-100">
																<li item-selected='true'>Select Type</li>
															
																<li>Taxonomy
																	<ul>
																		<li>Any Taxonomic Element</li>
																		<li>Scientific Name</li>
																		<li>Author Text
																			<ul>
																				<li>Infraspecific Author Text</li>
																			</ul>
																		</li>
																		<li>Higher Taxonomy
																			<ul>
																				<li>Class
																					<ul>
																						<li>Superclass</li>
																						<li>Subclass</li>
																					</ul>
																				</li>
																				<li>Order
																					<ul>
																						<li>Superorder</li>
																						<li>Suborder</li>
																						<li>Infraorder</li>
																					</ul>
																				</li>
																				<li>Family
																					<ul>
																						<li>Superfamily</li>
																						<li>Subfamily</li>
																					</ul>
																				</li>
																				<li>Tribe</li>
																			</ul>
																		</li>
																		<li>Genus
																			<ul>
																				<li>Subgenus</li>
																			</ul>
																		</li>
																		<li>Species
																			<ul>
																				<li>Subspecies</li>
																			</ul>
																		</li>
																		<li>Authority</li>
																		<li>Taxon Status</li>
																		<li>Nomenclatural Code</li>
																	</ul>
																</li>
																<li>Places
																	<ul>
																		<li>Any Geographic Element</li>
																		<li>Geology
																			<ul>
																				<li>Geology Attrubute</li>
																				<li>Geology Attribute Value</li>
																				<li>Traverse Geology Hierarchies</li>
																			</ul>
																		</li>
																		<li>Higher Geography
																			<ul>
																				<li>Continent Ocean</li>
																				<li>Country</li>
																				<li>State/Province</li>
																				<li>County</li>
																				<li>Island Group</li>
																				<li>Island</li>
																				<li>Land Feature</li>
																				<li>Water Feature</li>
																				<li>USGS Quad Map</li>
																			</ul>
																		</li>
																		<li>Locality
																			<ul>
																				<li>Specific Locality</li>
																				<li>Elevation</li>
																				<li>Depth</li>
																				<li>Verification Status</li>
																				<li>Maximum Uncertainty</li>
																				<li>Locality Remarks</li>
																				<li>Select on Google Map</li>
																				<li>Locality ID</li>
																				<li>Geolocate Precision</li>
																				<li>Geolocate Score</li>
																				<li>Is Locality Georeferenced?</li>
																				<li>Accepted Georeference?</li>
																				<li>Not Georeferenced Because</li>
																			</ul>
																		</li>
																	</ul>
																</li>
																<li>Media
																	<ul>
																		<li>Any Media Type
																			<ul>
																				<li>Image</li>
																				<li>Audible</li>
																				<li>Video</li>
																				<li>Spectrometer Data</li>
																			</ul>
																		</li>
																		<li>Media URI</li>
																		<li>Media Relationships
																			<ul>
																				<li>Created By Agent</li>
																				<li>Document for Permit</li>
																				<li>Document for Loan</li>
																				<li>Shows Accession</li>
																				<li>Shows Borrow</li>
																				<li>Shows Cataloged Item</li>
																				<li>Shows Collecting Event</li>
																				<li>Shows Deaccession</li>
																				<li>Shows Locality</li>
																				<li>Shows Permit</li>
																				<li>Shows Project</li>
																				<li>Shows Publication</li>
																			</ul>
																		</li>
																		<li>Media Labels
																			<ul>
																				<li>Aspect</li>
																				<li>Credit</li>
																				<li>Description</li>
																				<li>Height</li>
																				<li>Internal Remarks</li>
																				<li>Light Source</li>
																				<li>Made Date</li>
																				<li>md5hash</li>
																				<li>Original Filename</li>
																				<li>Owner</li>
																				<li>Remarks</li>
																				<li>Spectrometer</li>
																				<li>Spectrometer Reading Location</li>
																				<li>Subject</li>
																				<li>Width</li>
																			</ul>
																		</li>
																	</ul>
																</li>
																<li>Publication
																	<ul>
																		<li>Publication Type
																			<ul>
																				<li>Annual Report</li>
																				<li>Book</li>
																				<li>Book Section</li>
																				<li>Data Release</li>
																				<li>Journal Article</li>
																				<li>Journal Section</li>
																				<li>Newsletter</li>
																				<li>Serial Monograph</li>
																			</ul>
																		</li>
																		<li>Top Title</li>
																		<li>Authors</li>
																		<li>Editors</li>
																		<li>Year
																			<ul>
																				<li>or Years (if range use hyphen)</li>
																			</ul>
																		</li>
																		<li>Journal Name</li>
																		<li>Cites Collection</li>
																		<li>Cites Scientific Name</li>
																		<li>Accepted Scientific Name</li>
																		<li>Publication Remarks</li>
																	</ul>
																</li>
																<li>Biological Individual
																	<ul>
																		<li>Parts
																			<ul>
																				<li>Part Name</li>
																				<li>Preserve Method</li>
																				<li>Relationship</li>
																				<li>Disposition</li>
																				<li>Condition</li>
																				<li>Lot Number</li>
																				<li>Uniquie Container ID</li>
																				<li>Part Remarks</li>
																			</ul>
																		</li>
																		<li>Part Attribute</li>
																		<li>Part Relationships</li>
																		<li>Specimen Attributes</li>
																	</ul>
																</li>
																<li>Usage
																	<ul>
																		<li>Basis of Citation
																			<ul>
																				<li>Any Type</li>
																				<li>Additional Material</li>
																				<li>Allolectotype</li>
																				<li>Allotype</li>
																				<li>Cotype</li>
																				<li>Erroneous Citation</li>
																				<li>Figured</li>
																				<li>Genetic Voucher</li>
																				<li>Genotype</li>
																				<li>Holotype</li>
																				<li>Ideotype</li>
																				<li>Lectotype</li>
																				<li>Neotype</li>
																			</ul>
																		</li>
																		<li>Part Attribute</li>
																		<li>Part Relationships</li>
																		<li>Specimen Attributes</li>
																	</ul>
																</li>
																<li>Curatorial
																	<ul>
																		<li>Loan Number</li>
																		<li>Permit Issued By</li>
																		<li>Permit Issued To</li>
																		<li>Permit Type</li>
																		<li>Permit Number</li>
																		<li>Print Flag</li>
																		<li>Entered By</li>
																		<li>Entered Date</li>
																		<li>Last Edited By</li>
																		<li>Last Edited Date</li>
																		<li>Missing (Flags)</li>
																		<li>Specimen Remarks</li>
																	</ul>
																</li>
															</ul>
														</div>
													</div>
												<td class="mx-1 p-0 border-0">
													<select title="comparator" name="comparator" id="comparator" class="custom-select border minw-field-sm w-field-sm">
														<option value="">Select...</option>
														<option value="like">contains</option>
														<option value="eq">is</option>
													</select></td>
												<td class="mx-1 p-0 border-0">
													<input type="text" class="form-control flex enter-search mx-0 minw-field w-field px-2" name="srchTxt" id="srchTxt" placeholder="Enter Value"/>
												</td>
												<td class="mx-0 p-0 border-0 ml-auto border-blue-gray">
													<input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" class="float-right btn-default btn-sm mt-0 px-2"/>
													<input type="hidden" id="nextRowNum" value="1" >
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<span class="">
									<button class="btn py-45 px-3 bg-blue-gray border-0 mt-015" type="submit"> 
										<i class="fa fa-search text-body"></i> 
									</button>
								</span> 
							</div>
						</div>--->
					</form>
				</div>
				<!---custom fixed search--->
				<div class="tab-pane fade p-3" id="three" role="tabpanel" aria-labelledby="three-tab">
				<h2 class="h3 card-title ml-1">Custom Fixed Search</h2>
				<div class="container-fluid fs-13">
				<form id="searchForm3">
					<div class="row">
						<div class="col-md-4 col-sm-12">
							<fieldset class="form-group">
								<label for="guid_prefix" class="col-12 pl-0 mb-1">Catalog Number(s)</label>
								<select class="dropdown-menu" id="collmultiselect" role="menu" multiple="multiple">
							<cfloop query="collSearch">
								<option value="#collSearch.guid_prefix#">#collSearch.collection# (#collSearch.guid_prefix#)</option>
							</cfloop>
							</select>			
							<script>
							//// script for multiselect dropdown for collections
							//// on custom fixed search
							$("##collmultiselect").multiselect({
								header: !0,
								//height: 175,
								//minWidth: "200px",
								classes: "float-sm-left float-md-left mx-0 pl-2 col-6 text-muted",
								checkAllText: "Check all",
								uncheckAllText: "Uncheck all",
								noneSelectedText: "All Collections ",
								selectedText: "## selected",
								fontFamily: "Arial",
								selectedList: 0,
								show: null,
								hide: null,
								autoOpen: !1,
								multiple: !0,
								position: {}
							});
							</script>	
								<div class="col-6 px-0 mb-3 d-inline float-left">
									<textarea id="textarea" type="text" rows="1" name="textarea" class="input rounded border float-left d-inline ml-1 p-2 text-muted w-100" placeholder="Enter Other ID number"></textarea>
								
								</div>
								<label for="textarea" class="col-12 pl-0 mb-0">Other IDs</label>
								<select title="otherID" name="otherID" id="otherID" class="dropdown rounded float-left col-6 d-inline form-control-sm custom-select fs-13">
									<option value="other id type">Other ID Type </option>
									<option value="Collector Number">Collector Number </option>
									<option value="field number">Field Number</option>
								</select>
								<div class="col-6 px-0 mb-3 d-inline float-left">
									<input type="text" class="form-control-sm rounded border float-left d-inline" placeholder="Enter Other ID number">
								</div>
							</fieldset>
						</div>
						<div class="col-md-3 col-sm-12">
							<fieldset class="form-group">
								<label class="col-12 pl-0 mb-1">Any Taxonomy</label>
								<input id="taxa" class="form-control-sm mb-3 ml-0" placeholder="Enter Taxonomy">
								<label class="col-12 pl-0 mb-1">Any Geography</label>
								<input type="text" class="form-control-sm mb-3 ml-0 border"  placeholder="Enter Place">
							</fieldset>
						</div>
						<div class="col-md-3 col-sm-12">
							<fieldset class="form-group">
								<label class="col-12 px-0 mb-1">Collectors/Preparators</label>
								<input id="collectors" class="form-control-sm mb-3 ml-0" placeholder="Enter Collectors/Preparators">
								<label class="col-12 pl-0 mb-1">Part Name</label>
								<input type="text" class="input form-control-sm mb-3 ml-0 border"  placeholder="Part Name">
							</fieldset>
						</div>
						<div class="col-md-2 col-sm-12">
							<fieldset class="form-group">
								<label class="col-12 pl-0 mb-1">Loan Number</label>
								<input name="place" class="form-control-sm mb-3 ml-0 border" placeholder="Enter Loan Number">
								<label class="col-12 pl-0 mb-1">Years Collected</label>
								<input type="text" class="input form-control-sm mb-3 ml-0" placeholder="Enter Years Collected">
							</fieldset>
							<span class="input-group-btn float-right">
							<button class="btn btn-custom bg-blue-gray py-1 px-2 border-0" type="submit"> Search <i class="fa fa-search text-body"></i></button>
							</span> </div>
						<div class="menu_results"> </div>
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!--Grid Related code below along with search handler for keyword search-->
	<div class="container-fluid">
		<div class="row">
			<div class="text-left col-md-12">
				<main role="main">
					<div class="px-4 w-100 mb-5">
						<div class="row">
						<h2 class="float-left mt-3"><span class="pt-0 d-inline-block">Results</span>
							<label for="">&nbsp;</label>
							<input id="csvExport" class="float-right btn-default btn-sm ml-2 py-1 px-2" type="button" value="Download"/>
							<input id="csvExport2" class="float-right btn-default btn-sm ml-2 py-1 px-2" type="button" value="Download Shown"/>
							<input id="deleterowbutton" class="float-right btn-default btn-sm py-1 px-2" type="button" value="Remove Row"/>
						</h2>
						</div>
						<div class="row">
							<div id="jqxgrid" class="jqxGrid w-100"> </div>
							<div class="mt-005" id="enableselection"></div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>

<script>
///   JQXGRID -- for Keyword Search /////
$(document).ready(function() {
	$('##searchForm').bind('submit', function(evt){
	console.log($('##searchText').val());
	var searchParam = $('##searchText').val();
	var element = document.getElementById("showRightPush");
	element.classList.remove("hiddenclass");
	var element = document.getElementById("showLeftPush");
	element.classList.remove("hiddenclass");
	$('##searchText').jqxGrid('showloadelement');
	$("##jqxgrid").jqxGrid('clearfilters');
	var search =
		{
			datatype: "json",
			datafields:
			[
				{ name: 'collection_object_id', type: 'string' },
				{ name: 'collection', type: 'string' },
				{ name: 'cat_num', type: 'string' },
				{ name: 'scientific_name', type: 'string' },
				{ name: 'spec_locality', type: 'string' },
				{ name: 'higher_geog', type: 'string' },
				{ name: 'collectors', type: 'string' },
				{ name: 'verbatim_date', type: 'string' },
				{ name: 'coll_obj_disposition', type: 'string' },
				{ name: 'othercatalognumbers', type: 'string' }
			],
			root: 'specimenRecord',
			id: 'collection_object_id',
			url: '/redesign/specimens/component/records_search.cfc?method=getDataTable&searchText='+ searchParam,
			async: false
		}
		var dataAdapter = new $.jqx.dataAdapter(search, {
			beforeLoadEvent: function (){},
			downloadComplete: function (data, status, xhr) {},
			loadComplete: function (data) { },
			loadError: function (xhr, status, error) { },
		});
		evt.preventDefault();
	$("##jqxgrid").jqxGrid({
		width: '100%',
		autoheight: 'true',
		source: dataAdapter,
		filterable: false,
		sortable: true,
		pageable: true,
		autoheight: true,
		editable: true,
		pagesize: '50',
		showaggregates: true,
		columnsresize: true,
		autoshowfiltericon: true,
		selectionmode: 'multiplecellsextended',
		columnsreorder: true,
		groupable: true,
		selectionmode: 'checkbox',
		altrows: true,
		showtoolbar: true,
        rendertoolbar: function (toolbar) {
            var me = this;
            var container = $("<div style='margin: .25em 1em .25em .5em;'></div>");
            toolbar.append(container);
			container.append('<h2 class="h3 float-left mt-0 pt-1 mr-4">Results</h2>');
			container.append('<input id="deleterowbutton" class="btn btn-sm ml-2 fs-13 py-1 px-2" type="button" value="Delete Selected Row"/>');
			container.append('<input id="csvExport" class="btn btn-sm ml-3 fs-13 py-1 px-2" type="button" value="Download"/>');
			$("##csvExport").jqxButton();
			$("##deleterowbutton").jqxButton();
			// delete row.
			$("##deleterowbutton").on('click', function () {
				var selectedrowindex = $("##jqxgrid").jqxGrid('getselectedrowindex');
				var rowscount = $("##jqxgrid").jqxGrid('getdatainformation').rowscount;
				if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
					var id = $("##jqxgrid").jqxGrid('getrowid', selectedrowindex);
					var commit = $("##jqxgrid").jqxGrid('deleterow', id);
				}
			});
        },
		columns: [
	
		{text: 'Link', datafield: 'collection_object_id', width: 100,
			createwidget: function (row, column, value, htmlElement) {
				var datarecord = value;
				var linkurl = '/redesign/specimens/SpecimenDetail.cfm?collection_object_id=' + value;
				var link = '<div class="justify-content-center p-1 pl-2 mt-1"><a href="' + linkurl + '">';
				var button = $(link + "<span>View Record</span></a></div>");
			$(htmlElement).append(button);
			},
			initwidget: function (row, column, value, htmlElement) {  }
		},
		{text: 'Collection', datafield: 'collection', width: 150},
		{text: 'Catalog Number', datafield: 'cat_num', width: 130},
		{text: 'Scientific Name', datafield: 'scientific_name', width: 250},
		{text: 'Locality', datafield: 'spec_locality', width: 250    },
		{text: 'Higher Geography', datafield: 'higher_geog', width: 280},
		{text: 'Collectors', datafield: 'collectors', width: 180},
		{text: 'Verbatim Date', datafield: 'verbatim_date', width: 190},
		{text: 'Disposition', datafield: 'coll_obj_disposition', width: 120},
		{text: 'Other IDs', datafield: 'othercatalognumbers', width: 280}
		]
	});		
	$("##deleterowbutton").jqxButton();
	$("##deleterowbutton").on('click', function () {
		var selectedrowindex = $("##jqxgrid").jqxGrid('getselectedrowindex');
		var rowscount = $("##jqxgrid").jqxGrid('getdatainformation').rowscount;
			if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
				console.log('selectedrowindex: ', selectedrowindex);
			var id = $("##jqxgrid").jqxGrid('getrowid', selectedrowindex);
				console.log('rowid: ', id);
			var commit = $("##jqxgrid").jqxGrid('deleterow', id);
		}
	});
	$("##csvExport").click(function () {
		$("##jqxgrid").jqxGrid('exportdata', 'csv', 'jqxGrid');
	});
	$("##jqxgrid").on('columnreordered', function (event) {
		var column = event.args.columntext;
		var newindex = event.args.newindex
		var oldindex = event.args.oldindex;
		$("##eventlog").text("Column: " + column + ", " + "New Index: " + newindex + ", Old Index: " + oldindex);
	});
	$("##applyfilter").jqxButton({theme: 'Classic'});
	$("##clearfilter").jqxButton({theme: 'Classic'});
	$("##csvExport").jqxButton();
	$("##filterbox").jqxListBox({ checkboxes: true, width: 275, height: 240 });
	$("##columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0, width: 200, height: 25,
		source: [
			{label: 'Collectors', value: 'collectors'},
			{label: 'Collection Object ID', value: 'collection_object_id'},
			{label: 'Collection', value: 'collection'},
			{label: 'Cat Num', value: 'cat_num'},
			{label: 'Scientific Name', value: 'scientific_name'},
			{label: 'Locality', value: 'spec_locality'},
			{label: 'Higher Geography', value: 'higher_geog'},
			{label: 'Verbatim Date',value: 'verbatim_date'},
			{label: 'Disposition', value: 'coll_obj_disposition'},
			{label: 'Other IDs', value: 'othercatalognumbers'}
			]
		});
	var updateFilterBox = function (datafield) {
	var filterBoxAdapter = new $.jqx.dataAdapter(search,
	{
		uniqueDataFields: [datafield],
		autoBind: true
	});
	var uniqueRecords = filterBoxAdapter.records;
	uniqueRecords.splice(0, 0, '(All or None)');
	$("##filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
	$("##filterbox").jqxListBox('checkAll');
	}
	updateFilterBox('collectors');
	var handleCheckChange = true;
	$("##filterbox").on('checkChange', function (event) {
		if (!handleCheckChange)
			return;
		if (event.args.label != '(All or None)') {
			handleCheckChange = false;
			$("##filterbox").jqxListBox('checkIndex', 0);
			var checkedItems = $("##filterbox").jqxListBox('getCheckedItems');
			var items = $("##filterbox").jqxListBox('getItems');
			if (checkedItems.length == 1) {
				$("##filterbox").jqxListBox('uncheckIndex', 0);
			}
			else if (items.length != checkedItems.length) {
				$("##filterbox").jqxListBox('indeterminateIndex', 0);
			}
			handleCheckChange = true;
		}
		else {
			handleCheckChange = false;
			if (event.args.checked) {
				$("##filterbox").jqxListBox('checkAll');
			}
			else {
				$("##filterbox").jqxListBox('uncheckAll');
			}
			handleCheckChange = true;
		}
	});
		// handle columns selection.
	$("##columnchooser").on('select', function (event) {
	//	console.log(event);
		updateFilterBox(event.args.item.value);
	});
			// builds and applies the filter.
			var applyFilter = function (datafield) {
			//	console.log(datafield);	
			$("##jqxgrid").jqxGrid('clearfilters');
			var filtertype = 'stringfilter';
			if (datafield == 'collection_object_id' || datafield == 'locality_id') filtertype = 'numericfilter';
				
			var filtergroup = new $.jqx.filter();
			var checkedItems = $("##filterbox").jqxListBox('getCheckedItems');
			if (checkedItems.length == 0) {
				var filter_or_operator = 1;
				var filtervalue = "Empty";
				var filtercondition = 'equal';
				var filter = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
				filtergroup.addfilter(filter_or_operator, filter);
			}
			else {
				for (var i = 0; i < checkedItems.length; i++) {
					var filter_or_operator = 1;
					var filtervalue = checkedItems[i].label;
					var filtercondition = 'equal';
					var filter = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
					filtergroup.addfilter(filter_or_operator, filter);
				}
			}
			$("##jqxgrid").jqxGrid('addfilter', datafield, filtergroup);
			$("##jqxgrid").jqxGrid('applyfilters');
			}
			$("##clearfilter").click(function (datafield) {
			//we added datafield to pass to the function
			$("##jqxgrid").jqxGrid('clearfilters');
			$("##filterbox").jqxListBox('uncheckAll');
			//we added this line to the code
			});
			$("##applyfilter").click(function () {
			var dataField = $("##columnchooser").jqxDropDownList('getSelectedItem').value;
			applyFilter(dataField);
		});
			var listSource = [
				{ label: 'Collectors', value: 'collectors' },
				{ label: 'Collection Object ID', value: 'collection_object_id' },
				{ label: 'Collection', value: 'collection' },
				{ label: 'Cat Num', value: 'cat_num' },
				{ label: 'Scientific Name', value: 'scientific_name' },
				{ label: 'Locality', value: 'spec_locality' },
				{ label: 'Higher Geography', value: 'higher_geog' },
				{ label: 'Verbatim Date',value: 'verbatim_date'  },
				{ label: 'Disposition', value: 'coll_obj_disposition' },
				{ label: 'Other IDs', value: 'originalcatalognumbers'}
			];
			$("##jqxlistbox2").jqxListBox({ source: listSource, width: 198, height: 300, theme: theme, checkboxes: true });
			$("##jqxlistbox2").jqxListBox('checkAll');
			$("##jqxlistbox2").on('checkChange', function (event) {
			$("##jqxgrid").jqxGrid('beginupdate');
			if (event.args.checked) {
				$("##jqxgrid").jqxGrid('showcolumn', event.args.value);
			}
				else {
				$("##jqxgrid").jqxGrid('hidecolumn', event.args.value);
			}
				$("##jqxgrid").jqxGrid('endupdate');
			});
		
		$("##clearselectionbutton").jqxButton({ theme: theme });
		$("##enableselection").jqxDropDownList({
			autoDropDownHeight: true, dropDownWidth: 230, width: 120, height: 25, selectedIndex: 1, source: ['none', 'single row', 'multiple rows',
			'multiple rows extended', 'multiple rows advanced']
		});
		$("##enablehover").jqxCheckBox({  checked: true });
		// clears the selection.
		$("##clearselectionbutton").click(function () {
			$("##jqxgrid").jqxGrid('clearselection');
		});
		// scroll to a row.
		$("##scrolltobutton").click(function () {
			var index = parseInt($("##rowindexinput2").val());
			if (!isNaN(index)) {
				$("##jqxgrid").jqxGrid('ensurerowvisible', index);
			}
		});
		// enable or disable the selection.
		$("##enableselection").on('select', function (event) {
			var index = event.args.index;
			$("##selectrowbutton").jqxButton({ disabled: false });
			switch (index) {
				case 0:
					$("##jqxgrid").jqxGrid('selectionmode', 'none');
					$("##selectrowbutton").jqxButton({ disabled: true });
					break;
				case 1:
					$("##jqxgrid").jqxGrid('selectionmode', 'singlerow');
					break;
				case 2:
					$("##jqxgrid").jqxGrid('selectionmode', 'multiplerows');
					break;
				case 3:
					$("##jqxgrid").jqxGrid('selectionmode', 'multiplerowsextended');
					break;
				case 4:
					$("##jqxgrid").jqxGrid('selectionmode', 'multiplerowsadvanced');
					break;
			}
		});
		// enable or disable the hover state.
		$("##enablehover").on('change', function (event) {
			$("##jqxgrid").jqxGrid('enablehover', event.args.checked);
		});
		// display selected row index.
		$("##jqxgrid").on('rowselect', function (event) {
			$("##selectrowindex").text(event.args.rowindex);
		});
		// display unselected row index.
		$("##jqxgrid").on('rowunselect', function (event) {
			$("##unselectrowindex").text(event.args.rowindex);
		});
	});
});
</script> 
	
<script>
$(document).ready(function(){
	$(".addCF").click(function(){
		$("##customFields").append('<tr class="rounded ml-0"><td class="mx-1 pr-1 border-0"><select title="Join Operator" name="JoinOperator" id="joinOperator" class="custom-select border mx-0 d-flex"><option value="">Join with...</option><option value="and">and</option><option value="or">or</option><option value="not">not</option></select></td><td class="mx-1 pr-1 border-0"><select title="Select Type" name="SelectType" class="custom-select border d-flex"><option>Select Type...</option><optgroup label="Identifiers"><option>MCZ Catalog (Collection)</option><option>Catalog Number</option><option>Number plus other identifiers?</option><option>Other Identifier Type</option><option>Accession</option><option>Accession Agency</option></optgroup><optgroup label="Taxonomy"><option>Any Taxonomic Element</option><option>Scientific Name</option><option>Genus</option><option>Subgenus</option><option>Species</option><option>Subspecies</option><option>Author Text</option><option>Infraspecific Author Text</option><option>Class</option><option>Superclass</option><option>Subclass</option><option>Order</option><option>Superorder</option><option>Suborder</option><option>Infraorder</option><option>Family</option><option>Superfamily</option><option>Subfamily</option><option>Tribe</option><option>Authority</option><option>Taxon Status</option><option>Nomenclatural Code</option><option>Common Name</option></optgroup><optgroup label="Locality"><option>Any Geographic Element</option><option>Continent/Ocean</option><option>Ocean Region</option><option>Ocean Subregion</option><option>Country</option><option>State/Province</option><option>County</option><option>Island Group</option><option>Island</option><option>Land Feature</option><option>Water Feature</option><option>Specific Locality</option><option>Elevation</option><option>Depth</option><option>Verification Status</option><option>Maximum Uncertainty</option><option>Quad</option><option>Geology Attribute</option><option>Geog Auth Rec ID</option><option>Locality Remarks</option></optgroup><optgroup label="Collecting Event"><option>Verbatim Locality</option><option>Began Date</option><option>Ended Date</option><option>Verbatim Date</option><option>Verbatim Coordinates</option><option>Collecting Method</option><option>Collecting Event Remarks</option><option>Verbatim Coordinate System</option><option>Habitat</option><option>Collecting Source</option><option>Verbatim SRS (Datum)</option><option>Collecting Event ID</option></optgroup><optgroup label="Media"><option>Any Media Type</option><option>Image</option><option>Audible</option><option>Video</option><option>Spectrometer Data</option><option>Media URI</option><option>Any Media Relationship</option><option>Created By Agent</option><option>Document for Permit</option><option>Document for Loan</option><option>Shows Accession</option><option>Shows Borrows</option><option>Shows Cataloged Items</option><option>Shows Collecting Event</option><option>Shows Deaccession</option><option>Shows Locality</option><option>Shows Permit</option><option>Shows Project</option><option>Shows Publication</option><option>Any Media Label</option><option>Aspect</option><option>Credit</option><option>Description</option><option>Height</option><option>Internal Remarks</option><option>Light Source</option><option>Made Date</option><option>md5hash</option><option>Original Filename</option><option>Owner</option><option>Remarks</option><option>Spectrometer</option><option>Spectrometer Reading Location</option><option>Subject</option><option>Width</option></optgroup><optgroup label="Publications"><option>Any Publication</option><option>Title</option><option>Participant/Agent</option><option>Year</option><option>Publication Type</option><option>Journal Name</option><option>Cites Collection</option><option>Cites Specimens</option><option>Accepted Scientific Name</option><option>Peer Reviewed Only?</option></optgroup></td><td class="mx-1 pr-1 border-0"><select title="Comparator" name="comparator" id="comparator" class="custom-select d-flex border"><option value="">Compare with...</option><option value="like">contains</option><option value="eq">is</option></select></td>><td class="mx-1 pr-1 border-0"><input type="text" class="form-control d-flex enter-search mx-0" name="customFieldValue[]" id="srchTxt" placeholder="Enter Value"/></td><td class="border-0 mx-1 pr-1 py-2"><a href="javascript:void(0);" class="remCF px-2">Remove</a></td></tr>');
		});
    $("##customFields").on('click','.remCF',function(){
        $(this).parent().parent().remove();
		});
	});
	
</script>
<script>
//// script for Search Builder Second dropdown for type
//$(document).ready(function () {
//	$("##dropDownButton").jqxDropDownButton({ width: 150, height: 25, theme: theme});
//	$('##jqxTree').bind('select', function (event) {
//		var args = event.args;
//		var item = $('##jqxTree').jqxTree('getItem', args.element);
//		var dropDownContent = '<div class="mt-0 ml-2 position-relative py-1 bg-white">' + item.label + '</div>';
//		$("##dropDownButton").jqxDropDownButton('setContent', dropDownContent);
//	});
//	$("##jqxTree").jqxTree({ width: 260, theme: theme});
//});
//// script for DatePicker
$(function() {
	$("##began_date").datepicker({ 
		dateFormat: "yy-mm-dd", 
		changeMonth: true,
		changeYear: true 
	}).val()
	$("##ended_date").datepicker({ 
		dateFormat: "yy-mm-dd", 
		changeMonth: true,
		changeYear: true 
	}).val()
});
</script>
<script>
//// script for multiselect dropdown for collections
//// on keyword
$("##col-multi-select").multiselect({
	header: !0,
	height: 175,
	minWidth: "200px",
	classes: "float-sm-left float-md-right mx-0",
	checkAllText: "Check all",
	uncheckAllText: "Uncheck all",
	noneSelectedText: "All Collections ",
	selectedText: "## selected",
	fontFamily: "Arial",
	selectedList: 0,
	show: null,
	hide: null,
	autoOpen: !1,
	multiple: !0,
	position: {}
});
</script>

</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">
