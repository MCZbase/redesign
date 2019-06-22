<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
	 <script type="text/javascript">
        $(document).ready(function () {
            var viewModel = function (value, min, max) {
                this.value = ko.observable(value);
                this.min = ko.observable(1700);
                this.max = ko.observable(max);
                this.validateValue = function () {
                    if (this.value() > this.max()) this.value(parseFloat(this.max()));
                    if (this.value() < this.min()) this.value(parseFloat(this.min()));
                }

                this.setMax = ko.computed({
                    read: this.max,
                    write: function (value) {
                        if (!isNaN(value))
                            this.max(parseFloat(value)); // Write to underlying storage
                        if (value < this.min()) this.max(parseFloat(this.min()) + 1);
                        this.validateValue();
                    },
                    owner: this
                });
                this.setMin = ko.computed({
                    read: this.min,
                    write: function (value) {
                        if (!isNaN(value))
                            this.min(parseFloat(value)); // Write to underlying storage
                        if (value > this.max()) this.max(parseFloat(value) + 1);

                        this.validateValue();
                    },
                    owner: this
                });
                this.setValue = ko.computed({
                    read: this.value,
                    write: function (value) {
                        if (!isNaN(value))
                            this.value(parseFloat(value)); // Write to underlying storage
                        this.validateValue();
                    },
                    owner: this
                });
                this.disabled = ko.observable(false);
            };

            ko.applyBindings(new viewModel(2019, 1700, 2019));
        });
    </script>
	
<cfoutput>
	<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right zindex-sticky" id="cbp-spmenu-s2">
	<section> <a id="showRightPush" class="btn black-filter-btn hiddenclass" role="button">Refine Results</a> </section>
	<h3 class="filters">Refine Results</h3>
	<div class="col-md-3 py-2 px-4 mb-3 pl-3 bg-transparent">
		<h4 class="mt-0 float-left w-267">By Columns and Values</h4>
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
		<div class="float-left mt-3 pt-0 w-267 rounded border-blue-gray"  style="padding: 0 10px 10px 10px;">
			<h4>Date</h4>
	<!---	<div class="float-left wd-110p">
				<label class="mb-1 ml-0">From</label>
				<input id="began_date" type="text" name="began_date" class="ml-0 px-1 rounded wd-100p border">
			</div>
			<div class="float-left wd-100p">
				<label class="mb-1 ml-1">To</label>
				<input id="ended_date" name="ended_date" class="px-1 rounded wd-100p border" type="text">
			</div>
			<div class="float-left ml-2 mt-8"> <a id="refine" value="Refine" href="##"/>Refine</a> </div>
		--->

		    <div class="float-left" data-bind="jqxScrollBar: {min: min, max: max, value: value, theme: getDemoTheme(), disabled: disabled, width: 240, height: 22}"></div>
				<div class="float-left">
					<div class="float-left w-50">
						<label class="pl-2 mb-0 fs-14"> Min</label>
						<input class="rounded border px-1 w-75" data-bind="value: setMin" />
					</div>
					<div class="float-left w-50">
						<label class="pl-2 mb-0 fs-14">Max</label>
						<input class="rounded border px-1 w-75" data-bind="value: setMax" />
					</div>
					<div class="float-left w-50">
						<label class="pl-2 mb-0 mt-1 fs-14">Value</label>
						<input class="rounded border pl-1 w-75" data-bind="value: setValue" />
					</div>
					<div class="float-left w-50 mt-3 pt-1 fs-14">
						<a class="btn float-left primary border py-1 px-3 button">Refine Date</a>
					</div>
			</div>
		</div>
	</nav>
	<nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left zindex-sticky" id="cbp-spmenu-s3">
	<section> <a id="showLeftPush" class="btn black-columns-btn hiddenclass" role="button">Columns</a> </section>
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
			<div class="col-md-11 col-sm-12 col-lg-11">
				<h1 class="h3 smallcaps mt-4 pl-1">Search Specimen Records <span class="mt-2 font-italic pb-4 color-green fs-15 mx-0">(access to #getCount.cnt# records)</span> </h1>
				<div class="tab-card-main mt-1 tab-card">
				<div class="card-header tab-card-header pb-0 w-100">
					<ul class="nav nav-tabs card-header-tabs pt-1" id="myTab" role="tablist">
						<li class="nav-item col-sm-12 col-md-2 px-1"> <a class="nav-link active" id="one-tab" data-toggle="tab" href="##one" role="tab" aria-controls="One" aria-selected="true" >Keyword</a> </li>
						<li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="two-tab" data-toggle="tab" href="##two" role="tab" aria-controls="Two" aria-selected="false">Search Builder</a> </li>
						<li class="nav-item col-sm-12 col-md-4 px-1"> <a class="nav-link" id="three-tab" data-toggle="tab" href="##three" role="tab" aria-controls="Three" aria-selected="false">Custom Fixed Search</a> </li>
					</ul>
				</div>
				<div class="tab-content pb-0" id="myTabContent">
				<!---Keyword Search--->
				<div class="tab-pane fade show active py-3 mx-sm-3 mb-3" id="one" role="tabpanel" aria-labelledby="one-tab">
					<h2 class="h3 card-title ml-2">Keyword Search</h2>
					<form id="searchForm">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn">
									<select class="dropdown-menu col-multi-select"  id="col-multi-select" role="menu" multiple="multiple">
										<cfloop query="collSearch">
											<option value="#collSearch.guid_prefix#"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
										</cfloop>
									</select>
								</div>
								<input id="searchText" type="text" class="has-clear form-control w-50 form-control-borderless rounded" name="searchText" placeholder="Search term">
								<span class="input-group-btn">
									<button class="btn button px-3 border-0" id="keySearch" type="submit">
										Search <i class="fa fa-search text-body"></i>
									</button>
								</span> 
							</div>
						</div>
					</form>
				</div>
				<!---Search Builder--->
				<div class="tab-pane fade show py-3 mx-3 mb-3" id="two" role="tabpanel" aria-labelledby="two-tab">
					<form id="searchForm2">
						<h2 class="h3 card-title ml-2">Search Builder</h2>
						<div class="bg-0 col-sm-12 col-md-12 pl-2">
							<div class="input-group">
								
								<table class="form-table pb-2 col-md-12 col-sm-12" id="customFields">
									<tr class="rounded ml-0 mb-2">
										<td class="border-0"></td>
										<td class="mr-1 pr-1 border-0">
											<select title="Select Type" name="selectType" id="selectType" class="custom-select border d-flex">
												<option>Select Type...</option>
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
													<option>Scientific Name</option>
													<option>Genus</option>
													<option>Subgenus</option>		
													<option>Species</option>		
													<option>Subspecies</option>
													<option>Author Text</option>
													<option>Infraspecific Author Text</option>		
													<option>Class</option>
													<option>Superclass</option>
													<option>Subclass</option>
													<option>Order</option>
													<option>Superorder</option>
													<option>Suborder</option>
													<option>Infraorder</option>
													<option>Family</option>
													<option>Superfamily</option>
													<option>Subfamily</option>
													<option>Tribe</option>
													<option>Authority</option>
													<option>Taxon Status</option>
													<option>Nomenclatural Code</option>
													<option>Common Name</option>
												</optgroup>
												<optgroup label="Locality">
													<option>Any Geographic Element</option>
													<option>Continent/Ocean</option>
													<option>Ocean Region</option>
													<option>Ocean Subregion</option>
													<option>Country</option>
													<option>State/Province</option>
													<option>County</option>
													<option>Island Group</option>
													<option>Island</option>
													<option>Land Feature</option>
													<option>Water Feature</option>
													<option>Specific Locality</option>
													<option>Elevation</option>
													<option>Depth</option>
													<option>Verification Status</option>
													<option>Maximum Uncertainty</option>
													<option>USGS Quad Map</option>
													<option>Geology Attribute</option>
													<option>Geology Hierarchy</option>
													<option>Geog Auth Rec ID</option>	
													<option>Locality Remarks</option>
													<option>Select on Google Map</option>
													<option>Locality ID</option>
													<option>Geolocate Precision</option>
													<option>Geolocate Score</option>
													<option>Is Locality Georeferenced?</option>
													<option>Accepted Georeference?</option>
													<option>Not Georeferenced Because</option>
												</optgroup>
												<optgroup label="Collecting Event">
													<option>Collector/Agent/Inst.</option>
													<option>Verbatim Locality</option>
													<option>Began Date</option>
													<option>Ended Date</option>
													<option>Verbatim Date</option>
													<option>Verbatim Coordinates</option>
													<option>Collecting Method</option>
													<option>Collecting Event Remarks</option>
													<option>Verbatim Coordinate System</option>
													<option>Habitat</option>
													<option>Collecting Source</option>
													<option>Verbatim SRS (Datum)</option>
													<option>Collecting Event ID</option>
												</optgroup>
												<optgroup label="Media">
													<option>Any Media Type</option>
													<option>Image</option>
													<option>Audible</option>
													<option>Video</option>
													<option>Spectrometer Data</option>
													<option>Media URI</option>
													<option>Any Media Relationship</option>
													<option>Created By Agent</option>
													<option>Document for Permit</option>
													<option>Document for Loan</option>
													<option>Shows Accession</option>
													<option>Shows Borrows</option>
													<option>Shows Cataloged Items</option>
													<option>Shows Collecting Event</option>
													<option>Shows Deaccession</option>
													<option>Shows Locality</option>
													<option>Shows Permit</option>
													<option>Shows Project</option>
													<option>Shows Publication</option>
													<option>Any Media Label</option>
													<option>Aspect</option>
													<option>Credit</option>
													<option>Description</option>
													<option>Height</option>
													<option>Internal Remarks</option>
													<option>Light Source</option>
													<option>Made Date</option>
													<option>md5hash</option>
													<option>Original Filename</option>
													<option>Owner</option>
													<option>Remarks</option>
													<option>Spectrometer</option>
													<option>Spectrometer Reading Location</option>
													<option>Subject</option>
													<option>Width</option>
												</optgroup>
												<optgroup label="Publications">
													<option>Accepted Scientific Name</option>
													<option>Any Publication Type</option>
													<option>Annual Report</option>
													<option>Author (agent)</option>
													<option>Book</option>
													<option>Book Section</option>
													<option>Cites Collection</option>
													<option>Cites Specimens</option>
													<option>Data Release</option>
													<option>Editor (agent)</option>
													<option>Journal Article</option>
													<option>Journal Name</option>
													<option>Journal Section</option>
													<option>Newsletter</option>
													<option>Peer Reviewed Only?</option>
													<option>Publication Remarks</option>
													<option>Serial Monograph</option>
													<option>Title</option>
													<option>Year (or Years as range)</option>
												</optgroup>
												<optgroup label="Usage">
													<option>Any Type</option>
													<option>Additional Material</option>
													<option>Allolectotype</option>
													<option>Allotype</option>
													<option>Cotype</option>
													<option>Erroneous Citation</option>
													<option>Figured</option>
													<option>Genetic Voucher</option>
													<option>Genotype</option>
													<option>Holotype</option>
													<option>Ideotype</option>
													<option>Lectotype</option>
													<option>Neotype</option>
												</optgroup>
												<optgroup label="Biological Individual">
													<option>Part Name</option>
													<option>Preserve Method</option>
													<option>Relationship</option>
													<option>Disposition</option>
													<option>Condition</option>
													<option>Lot Number</option>
													<option>Uniquie Container ID</option>
													<option>Part Remarks</option>
													<option>Part Attribute</option>
													<option>Part Relationships</option>
													<option>Specimen Attributes</option>
												</optgroup>
												<optgroup label="Curatorial">
													<option>Loan Number</option>
													<option>Permit Issued By</option>
													<option>Permit Issued To</option>
													<option>Permit Type</option>
													<option>Permit Number</option>
													<option>Print Flag</option>
													<option>Entered By</option>
													<option>Entered Date</option>
													<option>Last Edited By</option>
													<option>Last Edited Date</option>
													<option>Missing (Flags)</option>
													<option>Specimen Remarks</option>
												</optgroup>
											</select>
										</td>
										<td class="mr-1 pr-1 border-0 pl-0">
											<select title="Select Comparator..." name="comparator" id="comparator" class="custom-select border d-flex">
												<option value="">Compare with...</option>
												<option value="like">contains</option>
												<option value="eq">is</option>
											</select>
										</td>
										<td class="mr-1 pr-1 border-0">
											<input type="text" class="form-control d-flex enter-search mx-0" name="srchTxt" id="srchTxt" placeholder="Enter Value"/>
										</td>											
										<td class="border-0 mx-1 pr-1 pt-1">
											<a class="addCF d-flex px-2" href="javascript:void(0);">Add</a>
										</td>
										<td class="border-0">&nbsp;  </td>
									</tr>
								</table>		
								<div class="w-100 mt-2">
									<span class="float-right ml-auto">
										<button class="btn button px-3 m-1" type="submit"> 
											Search <i class="fa fa-search text-body"></i> 
										</button>
										<button class="btn button px-3 m-1" type="submit"> 
											Save <i class="fa fa-save text-body"></i> 
										</button>
									</span>
								</div>
							</div>		
						</div>
					</form>
				</div>
				<!---custom fixed search--->
				<div class="tab-pane fade p-3 mb-3" id="three" role="tabpanel" aria-labelledby="three-tab">
				<h2 class="h3 card-title ml-1">Custom Fixed Search</h2>
				<div class="container-fluid fs-13">
				<form id="searchForm3">
					<div class="row">
						<div class="col-lg-4 col-sm-12">
							<fieldset class="form-group">
								<label for="guid_prefix" class="col-11 mb-1 pl-1 float-left">Select Collection</label>
								<select class="dropdown-menu mb-3 col-md-5 col-sm-12 float-left" id="collmultiselect" role="menu" multiple="multiple">
								<cfloop query="collSearch">
									<option value="#collSearch.guid_prefix#"> &nbsp;#collSearch.collection# (#collSearch.guid_prefix#)</option>
								</cfloop>
								</select>			
								<script>
								//// script for multiselect dropdown for collections
								//// on custom fixed search
								$("##collmultiselect").multiselect({
									header: !0,
									height: 175,
									minWidth: "200px",
									classes: "col-md-5 col-sm-12 text-muted",
									checkAllText: "Check all",
									uncheckAllText: "Uncheck all",
									noneSelectedText: "All",
									selectedText: "## selected",
									fontFamily: "",
									selectedList: 0,
									show: null,
									hide: null,
									autoOpen: !1,
									multiple: !0,
									position: {}
								});
								</script>	
							
								<textarea id="textarea" type="text" rows="1" name="textarea" class="w-100 col-md-6 col-sm-12 pl-0 p-2 border mb-3 fs-14 rounded mx-1 float-left" placeholder="Catalog ##(s)"></textarea>
								<label for="textarea" class="col-12 mb-1 pl-1">Select Other ID Type</label>
								<select title="otherID" name="otherID" id="otherID" class="custom-select dropdown rounded float-left col-md-5 col-sm-12 w-100 p-0 fs-13 text-muted border pl-2" style="height: 2.9em;">
									<option value="">None</option>
									<option value="Collector Number">Collector Number </option>
									<option value="field number">Field Number</option>
								</select>
								<div class="col-md-7 col-sm-12 mb-3 pl-0 d-inline float-left">
									<input type="text" class="w-100 border mb-3 rounded p-2" placeholder="Other ID(s)">
								</div>
							</fieldset>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-12 pl-0">
							<fieldset class="form-group">
								<label class="col-12 mb-1 pl-1">Any Taxonomy</label>
								<input id="taxa" class="w-100 border mb-3 rounded p-2">
								<label class="col-12 mb-1 pl-1">Any Geography</label>
								<input type="text" class="w-100 border mb-3 rounded p-2 ml-1">
							</fieldset>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-12 pl-0">
							<fieldset class="form-group">
								<label class="col-12 mb-1 pl-1">Collectors/Preparators</label>
								<input id="collectors" class="w-100 border mb-3 rounded p-2">
								<label class="col-12 mb-1 pl-1">Part Name</label>
								<input type="text" class="w-100 border mb-3 rounded p-2 ml-1">
							</fieldset>
						</div>
						<div class="col-lg-2 col-md-4 col-sm-12 pl-0">
							<fieldset class="form-group">
								<label class="col-11 mb-1 pl-1">Loan Number</label>
								<input name="place" class="w-100 border mb-3 rounded p-2">
								<label class="col-12 mb-1 pl-1">When Collected</label>
								<input type="text" class="w-100 border mb-3 rounded p-2 ml-1">
							</fieldset>
							<span class="input-group-btn float-right">
							<button class="btn button px-3" type="submit"> Search <i class="fa fa-search text-body"></i></button>
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
					 <div id="jqxWidget">
					<div class="px-4 w-100 mb-5">
						<div class="row">
				<!---<h2 class="float-left mt-3"><span class="pt-0 d-inline-block">Results</span>
					<input id="csvExport" class="float-right btn-default btn-sm ml-2 py-1 px-2" type="button" value="Download"/>
					<input id="deleterowbutton" class="float-right btn-default btn-sm py-1 px-2" type="button" value="Remove Row"/>--->
						</h2>
						</div>
						<div class="row mt-4">
							<div id="jqxgrid" class="jqxGrid w-100"> </div>
							<div class="mt-005" id="enableselection"></div>
						</div>
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
	
//	var imgThumbnail = new Array();
//		imgThumbnail[0] = { Image: 'avatar.png', Title: 'Avatar', Year: 2009 };
//		imgThumbnail[1] = { Image: 'priest.png', Title: 'Priest', Year: 2006 };
//		imgThumbnail[2] = { Image: 'endgame.png', Title: 'End Game', Year: 2006 };
//		imgThumbnail[3] = { Image: 'unknown.png', Title: 'Unknown', Year: 2011 };
//		imgThumbnail[4] = { Image: 'unstoppable.png', Title: 'Unstoppable', Year: 2010 };
//		imgThumbnail[5] = { Image: 'twilight.png', Title: 'Twilight', Year: 2008 };
//		imgThumbnail[6] = { Image: 'kungfupanda.png', Title: 'Kung Fu Panda', Year: 2008 };
//		imgThumbnail[7] = { Image: 'knockout.png', Title: 'Knockout', Year: 2011 };
//		imgThumbnail[8] = { Image: 'theplane.png', Title: 'The Plane', Year: 2010 };
//		imgThumbnail[9] = { Image: 'bigdaddy.png', Title: 'Big Daddy', Year: 1999 };
//
//     var imagerenderer = function (row, datafield, value) {
//          return '<img style="margin-left: 5px;" height="60" width="50" src="../../images/' + value + '"/>';
//     }

		
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
		console.log(event);
		updateFilterBox(event.args.item.value);
	});
			// builds and applies the filter.
			var applyFilter = function (datafield) {
			$("##jqxgrid").jqxGrid('clearfilters');
			var filtertype = 'stringfilter';
			if (datafield == 'collection_object_id') filtertype = 'numericfilter';
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
