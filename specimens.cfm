<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">

<cfoutput>
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <section> <a id="showRightPush" class="btn black-filter-btn" role="button">Filters</a> </section>
        <h3>Filters</h3>
        <div class="col-md-3 jumbotron mb-3 pl-3" style="background: none;">
            <h2 class="mt-2 float-left wd-280">By Columns and Values</h2>
            <div class="float-left">
                <div>Choose Column:</div>
                <div id="columnchooser"></div>
                <div class="mt-010" id="filterbox"></div>
                <div class="mt-010">
                    <input type="button" id="applyfilter" class="d-inline" value="Apply Filter"/>
                    <input type="button" id="clearfilter" class="d-inline" value="Clear Filter"/>
                </div>
            </div>
            <div class="float-left mt-3 zindex-sticky wd-280">
                <h2>Date</h2>
                <div class="d-inline float-left mr-3 wd-090">
                    <label class="mb-1 ml-1">From</label>
                    <input id="began_date" class="wd-090" type="text">
                </div>
                <div class="d-inline float-left wd-090">
                    <label class="mb-1 ml-1">To</label>
                    <input id="ended_date" type="text" class="wd-090">
                </div>
                <div class="float-left d-inline ml-3 w-050 m-162"> <a id="refine" value="Refine" class="d-inline align-bottom bg-transparent wd-050 text-primary"/>Refine</a> </div>
            </div>
        </div>
    </nav>
    <nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left zindex-sticky" id="cbp-spmenu-s3">
        <section> <a id="showLeftPush" class="btn black-columns-btn" role="button">Columns</a> </section>
        <h5>Display Columns</h5>
        <div class="col-md-3 jumbotron mb-3 pl-1 mt-0">
            <ul class="checks">
                <li>
                    <input type="checkbox">
                    Check all</li>
                <li>
                    <input type="checkbox">
                    Minimum</li>
            </ul>
            <div class="float-left zindex-sticky bg-white">
                <div id="jqxlistbox2" class="ml-5px mt-4"></div>
            </div>
        </div>
    </nav>
    <cfquery name="getCount" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	select count(collection_object_id) as cnt from cataloged_item
	</cfquery>
    <cfquery name="collSearch" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	SELECT
		collection.institution,
		collection.collection,
		collection.collection_id,
		collection.guid_prefix
	FROM
		collection
	order by collection.collection
	</cfquery>
    <script>
function deleteRow(evt) {
    var i = evt.target.parentNode.parentNode.rowIndex;
    document.getElementById('POITable').deleteRow(i);
}
function insRow() {
    var x = document.getElementById('POITable');
    var new_row = x.rows[1].cloneNode(true);
    var len = x.rows.length;
    new_row.cells[0].innerHTML = len;
    var inp1 = new_row.cells[1].getElementsByTagName('select')[0];
    inp1.id += len;
    inp1.name += len;
    inp1.value = '';
    var inp2 = new_row.cells[2].getElementsByTagName('select')[0];
    inp2.id += len;
    inp2.name += len;
    inp2.value = '';

	var inp3 = new_row.cells[3].getElementsByTagName('select')[0];
    inp3.id += len;
    inp3.name += len;
    inp3.value = '';

	var inp4 = new_row.cells[4].getElementsByTagName('input')[0];
    inp4.id += len;
    inp4.name += len;
    inp4.value = '';
    var button = new_row.cells[5].getElementsByTagName('input')[0];
    button.value = "* DELETE *";
    button.onclick = function(it) {deleteRow(it)};
    x.appendChild( new_row );
}
function deleteRow2(evt) {
    var i = evt.target.parentNode.parentNode.rowIndex;
    document.getElementById('FUFtable').deleteRow(i);
}
function insRow2() {
    var x = document.getElementById('FUFtable');
    var new_row = x.rows[1].cloneNode(true);
    var len = x.rows.length;
    new_row.cells[0].innerHTML = len;
    var inp1 = new_row.cells[1].getElementsByTagName('select')[0];
    inp1.id += len;
    inp1.name += len;
    inp1.value = '';
    var inp2 = new_row.cells[2].getElementsByTagName('select')[0];
    inp2.id += len;
    inp2.name += len;
    inp2.value = '';

	var inp3 = new_row.cells[3].getElementsByTagName('select')[0];
    inp3.id += len;
    inp3.name += len;
    inp3.value = '';

	var inp4 = new_row.cells[4].getElementsByTagName('input')[0];
    inp4.id += len;
    inp4.name += len;
    inp4.value = '';
    var button = new_row.cells[5].getElementsByTagName('input')[0];
    button.value = "* DELETE *";
    button.onclick = function(it) {deleteRow(it)};
    x.appendChild( new_row );
}
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
        <div class="jumbotron px-1 mt-1 mx-4">
            <h2 class="">Search Specimen Records <span class="rec_count mx-0">(access to #getCount.cnt# records)</span> </h2>
        </div>
    </div>
    <div class="col-md-11 col-sm-12">
    <div class="tab-card-main mt-1 tab-card">
    <div class="card-header tab-card-header w-100" style="padding-bottom: 0px;background-color: ##5B5B5B">
        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
            <li class="nav-item col-sm-12 col-md-2 px-1"> <a class="nav-link active" id="one-tab" data-toggle="tab" href="##one" role="tab" aria-controls="One" aria-selected="true" >Keyword</a> </li>
            <li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="two-tab" data-toggle="tab" href="##two" role="tab" aria-controls="Two" aria-selected="false">Search Builder</a> </li>
            <li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="four-tab" data-toggle="tab" href="##four" role="tab" aria-controls="Four" aria-selected="false">Custom Fixed Search</a> </li>
        </ul>
    </div>
    <div class="tab-content pb-0" id="myTabContent">
    <!---Keyword Search--->
    <div class="tab-pane fade show active py-3 mx-sm-3" id="one" role="tabpanel" aria-labelledby="one-tab">
        <h5 class="card-title mx-2">Keyword Search</h5>
        <form id="searchForm">
            <div class="col-xs-8 col-md-4 col-lg-6 col-xs-offset-2">
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <select class="dropdown-menu fs-14" role="menu" id="col-multi-select" multiple="multiple" >
                            <cfloop query="collSearch">
                                <option value="#collSearch.guid_prefix#"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
                            </cfloop>
                        </select>
                        <script>
	//// script for multiselect dropdown for collections
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
                    </div>
                    <input id="searchText" type="text" class="has-clear form-control form-control-borderless rounded" name="searchText" placeholder="Search term">
                    <span class="input-group-btn">
                    <button class="btn btn-custom blue-gray border-0" type="submit"><i class="fa fa-search text-body"></i></button>
                    </span> </div>
                <p class="px-1" style="line-height: 1.5em;padding-top: 1em;font-size: 13px;">Explanation of how keyword search works.... </p>
            </div>
        </form>
    </div>
    <!---Search Builder--->
    <div class="tab-pane fade show py-3 px-3" id="two" role="tabpanel" aria-labelledby="two-tab" >
      
        <form id="searchForm2">
             <h5 class="card-title mx-2">Search Buider</h5>
            <div id="POItablediv" class="bg-0 col-sm-12 col-md-10">
                <div class="input-group d-md-flex d-sm-block">
                    <div class="input-group-btn search-panel d-md-flex">
                        <table class="table responsive-table w-100 text-muted mb-3 rounded b-collapse-s" id="POITable" border="1">
                            <tbody>
                                <tr class="first_row">
                                    <td style="display: none;">##</td>
                                    <td>and/or/not</td>
                                    <td>&nbsp;&nbsp;keyword</td>
                                    <td>contains/is</td>
                                    <td>&nbsp;&nbsp;value</td>
                                    <td>&nbsp;&nbsp;delete?</td>
                                </tr>
                                <tr class="rounded p-2 b-blue-gray p-2 ml-1">
                                    <td style="display: none;">1</td>
                                    <td class="mx-1 p-0 border-0"><select title="joinOperator" name="joinOperator" id="joinOperator" class="custom-select" style="min-width: 5em;">
                                            <option value="and">and</option>
                                            <option value="or">or</option>
                                            <option value="not">not</option>
                                        </select></td>
                                    <td class="mx-1 p-0 border-0"><select title="searchField" name="searchField" id="searchField" class="custom-select" style="min-width: 9em;">
                                            <option value="taxonomy">Taxonomy</option>
                                            <option>Places</option>
                                            <option>Media</option>
                                            <option>Publications</option>
                                            <option>Projects</option>
                                            <option>Specimens</option>
                                            <option>Dates</option>
                                            <option>Parts</option>
                                        </select></td>
                                    <td class="mx-1 p-0 border-0"><select title="comparator" name="comparator" id="comparator" class="custom-select" style="min-width: 7em;">
                                            <option value="like">contains</option>
                                            <option value="eq">is</option>
                                        </select></td>
                                    <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search mx-0" name="srchTxt" id="srchTxt" placeholder="Enter Value"/></td>
                                    <td class="mx-0 p-0 border-0"><input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" class="d-inline"/>
                                        <input type="hidden" id="nextRowNum" value="1"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <span class="input-group-btn">
                    <button class="btn btn-custom blue-gray border-0" type="submit"> <i class="fa fa-search text-body"></i></button>
                    </span> </div>
            </div>
        </form>
    </div>
  
    
    <!---field rich search--->
        
    <div class="tab-pane fade p-3" id="four" role="tabpanel" aria-labelledby="four-tab">
    <h5 class="card-title ml-2">Custom Fixed Search</h5>
    <div class="container-fluid">
    <form method="post" action="specimens.cfm" name="SpecData" id="searchForm4" class="form-horizontal" role="form">

      
        <div class="row px-4 pb-3">
            <div class="custom-control custom-checkbox col-md-3 col-sm-12">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Include Observations?</label>
            </div>
            <div class="custom-control custom-checkbox col-md-3 col-sm-12">
                <input type="checkbox" class="custom-control-input" id="customCheck2">
                <label class="custom-control-label" for="customCheck2">Require Tissues?</label>
            </div>
            <div class="custom-control custom-checkbox col-md-3 col-sm-12">
                <input type="checkbox" class="custom-control-input" id="customCheck3">
                <label class="custom-control-label" for="customCheck3">Accent Insensitive?</label>
            </div>
             
                    <select id="selectbasic" name="selectbasic" class="selectpicker border rounded">
                <option value="none">Require Media?</option>
                <option value="any">Any</option>
                <cfloop query="ctmedia_type">
                    <option value="#ctmedia_type.media_type#">#ctmedia_type.media_type#</option>
                </cfloop>
            </select>
			
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <fieldset class="form-group">
                    <label for="textarea" class="col-12"><strong>Catalog Number(s)</strong></label>
                    <select class="col-12 fs-14 w-100" role="menu" id="col-multi-select2" multiple="multiple">
                      
                        <cfloop query="collSearch">
                            <option value="#collSearch.guid_prefix#"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
                        </cfloop>
                    </select>
                    <script>
	//// script for multiselect dropdown for collections
$("##col-multi-select2").multiselect({
	header: !0,
	height: 175,
	minWidth: "300px",
	classes: "",
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
   <textarea id="textarea" name="textarea" class="form-control-sm mb-3">Enter Catalog Numbers</textarea>
        <label for="textarea" class="col-12"><strong>Other IDs</strong></label>
                    <select class="selectpicker w-100 border rounded mb-0 fs-12" role="menu" id="col-multi-select3">
                            <option value=""> </option>
                            <option value="collector number">collector number </option>
                            <option value="field number">field number</option>
                    </select>
                       <input type="text" class="input form-control-sm mb-3" placeholder="Other ID number">
   <label class="col-12"><strong>Collectors</strong></label>
   <input type="text" class="input form-control-sm mb-3" placeholder="Search Collectors">
    
               
              
                </fieldset>
            </div>
            <div  class="col-md-4 col-sm-12">
                <fieldset class="form-group">
                    <label class="col-4"><strong>Taxonomy</strong></label>
                    <input id="taxa" class="form-control-sm mb-3" placeholder="enter taxonomy">
                    <script>
							$("##nicIssuedDate").prop('disabled', true);

							</script>
                   <div class="col-12 p-0" style="margin:0;padding:0;">
                   <label class="d-inline col-12" for="date"><strong>Date Range (use one field for day) </strong></label>
                    <div class="input-group float-left col-md-6 col-sm-12 p-0 mb-3 mt-2 mr-0">
                        <input type="date" id ="DateRange1" class="form-control-sm" placeholder="" style="font-size: 12px;width: 80%;">
                        <div class="input-group-append" style="padding: 0;"> 
                              <span class="input-group-text" id="basic-addon2" style="padding: 3px"><span class="fa fa-calendar"></span></span> 
                        </div>
					</div>
                    <div class="input-group float-left col-md-6 col-sm-12 p-0 mb-3 mt-2 mr-0">
                        <input type="date" id ="DateRange2" class="form-control-sm" placeholder="" style="font-size: 12px;width: 80%">
                        <div class="input-group-append" style="padding: 0;">
							<span class="input-group-text" id="basic-addon3" style="padding: 3px"><span class="fa fa-calendar"></span></span> 
                        </div>
                    </div>
					</div>
                    <label class="col-12"><strong>Basis of Citation</strong></label>
                    <select id="selectbasic2" name="selectbasic" class="selectpicker border rounded mb-3 fs-12">
                        <option>Holotype</option>
                        <option>Paratype</option>
                        <option>Lectotype</option>
                    </select>
                </fieldset>
            </div>
            <div class="col-md-4 col-sm-12">
                <fieldset class="form-group">
                    <label class="col-12"><strong>Geography</strong></label>
                    <input name="place" class="form-control-sm mb-3" placeholder="enter place">
                    <label class="col-12"><strong>Part Name</strong></label>
                    <input type="text" class="input form-control-sm mb-3" placeholder="Add Part Name">
                    <label class="col-12"><strong>Disposition</strong></label>
                    <select id="selectbasic3" name="selectbasic" class="selectpicker border rounded" style="margin-left: 5px;padding: 2px;">
                        <option>in collection</option>
                        <option>on loan</option>
                        <option>deaccessioned</option>
                        <option>other</option>
                    </select>
                </fieldset>
             <span class="input-group-btn" style="float:right;">
                    <button class="btn btn-custom blue-gray border-0" type="submit"> Search <i class="fa fa-search text-body"></i></button>
                    </span> 
            </div>
        </div>
    </div>
    <!--/.row-->
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
                        <h3 style="float: left;width:120px;">Results</h3>
                        <ul>
                            <li class="searchfield"> <a href="##" style="color: ##1e1e1e;"> <i class="fas fa-download" ></i> </a> </li>
                        </ul>
                        <div class="row" style="clear:both;">
                            <div id="jqxgrid" class="jqxGrid" style="width: 100%;"> 
                                <!---visualization of some sort---> 
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <script>
		  $(document).ready(function() {
                $('##searchForm').bind('submit', function(evt){
				console.log($('##searchText').val());
				var searchParam = $('##searchText').val();
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
					url: '/redesign/specimen-details-related/component/records_search.cfc?method=getDataTable&searchText='+ searchParam,
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
				pagesize: '20',
				showaggregates: true,
				pagesizeoptions: ['100', '200', '300', '400', '500','600','700','800','900'],
                columnsresize: true,

                autoshowfiltericon: false,
                columns: [
				  { text: 'Link', datafield: 'collection_object_id', width: 100,
				   createwidget: function (row, column, value, htmlElement) {
                   var datarecord = value;
                   var linkurl = 'specimen-detail.cfm?collection_object_id=' + value;
                   var link = '<div style="text-align:center;margin-top:8px;"><a href="' + linkurl + '">';
                   var button = $(link + "<span>View Record</span></a></div>");
                   $(htmlElement).append(button);
                      },
				   initwidget: function (row, column, value, htmlElement) {  }},
                  { text: 'Collection', datafield: 'collection', width: 150  },
                  { text: 'Catalog Number', datafield: 'cat_num', width: 130  },
                  { text: 'Scientific Name', datafield: 'scientific_name', width: 250  },
                  { text: 'Locality', datafield: 'spec_locality', width: 250 },
                  { text: 'Higher Geography', datafield: 'higher_geog', width: 280 },
                  { text: 'Collectors', datafield: 'collectors', width: 180 },
				  { text: 'Verbatim Date', datafield: 'verbatim_date', width: 190  },
				  { text: 'Disposition', datafield: 'coll_obj_disposition', width: 120  },
				  { text: 'Other IDs', datafield: 'othercatalognumbers', width: 280  }
                ]

			});




	 		// create buttons, listbox and the columns chooser dropdownlist.
            // create buttons, listbox and the columns chooser dropdownlist.
	        // create buttons, listbox and the columns chooser dropdownlist.
            $("##applyfilter").jqxButton({ theme: theme });
            $("##clearfilter").jqxButton({ theme: theme });
            $("##filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
            $("##columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
                source: [
				  {	label: 'Collectors', value: 'collectors' },
				  { label: 'Collection Object ID', value: 'collection_object_id' },
				  { label: 'Collection', value: 'collection' },
                  { label: 'Cat Num', value: 'cat_num' },
                  { label: 'Scientific Name', value: 'scientific_name' },
                  { label: 'Locality', value: 'spec_locality' },
                  { label: 'Higher Geography', value: 'higher_geog' },
				  { label: 'Verbatim Date',value: 'verbatim_date'  },
				  { label: 'Disposition', value: 'coll_obj_disposition' },
				  { label: 'Other IDs', value: 'othercatalognumbers'  }

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


              var listSource = [ { label: 'Collectors', value: 'collectors' },
			  { label: 'Collection Object ID', value: 'collection_object_id' },
			  { label: 'Collection', value: 'collection' },
			  { label: 'Cat Num', value: 'cat_num' },
			  { label: 'Scientific Name', value: 'scientific_name' },
			  { label: 'Locality', value: 'spec_locality' },
			  { label: 'Higher Geography', value: 'higher_geog' },
			  { label: 'Verbatim Date',value: 'verbatim_date'  },
			  { label: 'Disposition', value: 'coll_obj_disposition' },
			  { label: 'Other IDs', value: 'originalcatalognumbers'} ];

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

    });
		  });


  $(function(){
    function saveEdits() {
    }
 	var screenWidth, screenHeight, dialogWidth, dialogHeight, isDesktop;
    screenWidth = window.screen.width;
    screenHeight = window.screen.height;
    if ( screenWidth < 1600 ) {
		dialogWidth = '94%';
        dialogHeight = 'auto';
		 isDesktop = false;
    } else if ( screenWidth > 1600  ){
        dialogWidth = '66%';
       dialogHeight = 'auto'
        isDesktop = true;
    }
$(function () {
    dialog = $( "##dialog-form" ).dialog({
      autoOpen: false,
      width: dialogWidth,
	  height: dialogHeight,
      maxWidth: 1250,
	  fluid: true,
      modal: true,
	  resizable: true,
      buttons: {
		    "1": { id: 'open', text: 'Save Shared Record', click: function(){ $(this).dialog("open"); },"class": "save_shared" },
            "2": { id: 'save', text: 'Save Changes for this Record Only', click: function(){ $(this).dialog("save"); }, "class": "save_local" },
            "3": { id: 'close', text: 'Cancel', click: function(){ $(this).dialog("close"); }, "class": "cancel_bk"}
            }
    });
    $(_btnToDialog).click(function () {
                $("##dialog-form").dialog("open");
            });
	form = dialog.find( "form" ).on( "submit", function( event ) {
           event.preventDefault();
           saveEdits();
		// $(window).off("resize.responsive");
    });
 $(document).on("click", "button.popperbtn", function() {
    $("##dialog-form").dialog("open");
	 fluidDialog();
  });
});
	$(document).ready(function(){
  activaTab(role);
});
function activaTab(tab){
  $('.nav-tabs a[href="##' + tab + '"]').tab('show');
};
	function fluidDialog() {
    var $visible = $(".ui-dialog:visible");
    // each open dialog
    $visible.each(function () {
        var $this = $(this);
        var dialog = $this.find(".ui-dialog-content").data("dialog");
        // if fluid option == true
        if (dialog.options.maxWidth && dialog.options.width) {
            // fix maxWidth bug
            $this.css("max-width", dialog.options.maxWidth);
            //reposition dialog
            dialog.option("position", dialog.options.position);
        }
    });
}

});

</script> 
</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">
