<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
<cfoutput>
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <section> <a id="showRightPush" class="btn black-filter-btn" role="button">Filters</a> </section>
        <h3 class="filters">Filters</h3>
        <div class="col-md-3 jumbotron mb-3 pl-3" style="background: none;">
            <h4 class="mt-2 float-left wd-280">By Columns and Values</h4>
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
                <h4>Date</h4>
                <div class="d-inline float-left mr-3 wd-090">
                    <label class="mb-1 ml-1">From</label>
                    <input id="began_date" class="wd-090" type="text">
                </div>
                <div class="d-inline float-left wd-090">
                    <label class="mb-1 ml-1">To</label>
                    <input id="ended_date" type="text" class="wd-090">
                </div>
                <div class="float-left d-inline ml-3 w-050 m-162"> 
                <a id="refine" value="Refine" class="d-inline align-bottom bg-transparent wd-050 text-primary"/>Refine</a> </div>
            </div>
        </div>
    </nav>
    <nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left zindex-sticky" id="cbp-spmenu-s3">
        <section> <a id="showLeftPush" class="btn black-columns-btn" role="button">Columns</a> </section>
        <h3 class="columns">Display Columns</h3>
        <div class="col-md-3 mb-3 pl-1 mt-3">
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
 
    <div class="col-md-11 col-sm-12 main-cont">
          <h1 class="jumbotron-heading">Search Specimen Records <span class="rec_count mx-0">(access to #getCount.cnt# records)</span> </h1>
    <div class="tab-card-main mt-1 tab-card">
    <div class="card-header tab-card-header w-100" style="padding-bottom: 0px;background-color: ##5B5B5B">
        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
            <li class="nav-item col-sm-12 col-md-2 px-1"> <a class="nav-link active" id="one-tab" data-toggle="tab" href="##one" role="tab" aria-controls="One" aria-selected="true" >Keyword</a> </li>
            <li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="two-tab" data-toggle="tab" href="##two" role="tab" aria-controls="Two" aria-selected="false">Search Builder</a> </li>
            <li class="nav-item col-sm-12 col-md-3 px-1"> <a class="nav-link" id="three-tab" data-toggle="tab" href="##three" role="tab" aria-controls="Three" aria-selected="false">Custom Fixed Search</a> </li>
        </ul>
    </div>
    <div class="tab-content pb-0" id="myTabContent">
    <!---Keyword Search--->
    <div class="tab-pane fade show active py-3 mx-sm-3" id="one" role="tabpanel" aria-labelledby="one-tab">
        <h2 class="card-title ml-2">Keyword Search</h2>
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
    <div class="tab-pane fade show py-3 px-2" id="two" role="tabpanel" aria-labelledby="two-tab" >
        <form id="searchForm2">
            <h2 class="card-title ml-2">Search Buider</h2>
            <div id="POItablediv" class="bg-0 col-sm-11 col-md-10">
                <div class="input-group d-md-flex d-sm-flex ">
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
                                <tr class="rounded p-2 b-blue-gray p-2 ml-0">
                                    <td style="display: none;">1</td>
                                    <td class="mx-1 p-0 border-0"><select title="joinOperator" name="joinOperator" id="joinOperator" class="custom-select border" style="min-width: 5em;">
                                            <option value="and">and</option>
                                            <option value="or">or</option>
                                            <option value="not">not</option>
                                        </select></td>
                                    <td class="mx-1 p-0 border-0"><select title="searchField" name="searchField" id="searchField" class="custom-select border" style="min-width: 9em;">
                                            <option value="taxonomy">Taxonomy</option>
                                            <option>Places</option>
                                            <option>Media</option>
                                            <option>Publications</option>
                                            <option>Projects</option>
                                            <option>Specimens</option>
                                            <option>Dates</option>
                                            <option>Parts</option>
                                        </select></td>
                                    <td class="mx-1 p-0 border-0"><select title="comparator" name="comparator" id="comparator" class="custom-select border" style="min-width: 7em;">
                                            <option value="like">contains</option>
                                            <option value="eq">is</option>
                                        </select></td>
                                    <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search mx-0" name="srchTxt" id="srchTxt" placeholder="Enter Value"/></td>
                                    <td class="mx-0 p-0 border-0"><input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" class="d-inline" style="font-size: 15px;margin-top: 1px;"/>
                                        <input type="hidden" id="nextRowNum" value="1"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <span class="input-group-btn">
                    <button class="btn btn-custom blue-gray border-0" type="submit" style="font-size: 14px;margin-top:3px;"><i class="fa fa-search text-body"></i></button>
                    </span> </div>
            </div>
        </form>
    </div>
    <!---custom fixed search--->
    <div class="tab-pane fade p-3" id="three" role="tabpanel" aria-labelledby="three-tab">
    <h2 class="card-title ml-2">Custom Fixed Search</h2>
    <div class="container-fluid" style="font-size: smaller;">
    <form method="post" action="specimens.cfm" name="SpecData" id="searchForm3" class="form-horizontal" role="form">
    <div class="row">
        <div class="col-md-4 col-sm-12">
            <fieldset class="form-group">
                <label for="textarea" class="col-12"><strong>Catalog Number(s)</strong></label>
                <select class="dropdown col-12 w-100 border fs-12" role="menu" id="col-multi-select2" multiple="multiple">
                    <cfloop query="collSearch">
                        <option value="#collSearch.guid_prefix#"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
                    </cfloop>
                </select>
                <script>
				// script for multiselect dropdown for collections
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
               <select title="searchField" name="searchField" id="searchField" class="custom-select w-100 border rounded py-0 pl-2" style="font-size: 13px;">
                    <option value="">Select Other ID Type </option>
                    <option value="collector number">collector number </option>
                    <option value="field number">field number</option>
               </select>
               <input type="text" class="input form-control-sm mb-3 ml-0" placeholder="Other ID number">
            </fieldset>
        </div>
        <div class="col-md-4 col-sm-12">
            <fieldset class="form-group">
                <label class="col-6"><strong>Any Taxonomy</strong></label>
                <input id="taxa" class="form-control-sm mb-3 ml-0" placeholder="enter taxonomy">
				<label class="col-12"><strong>Collectors/Preparators</strong></label>
                <input type="text" class="input form-control-sm mb-3 ml-0" placeholder="Search Collectors">
            </fieldset>
        </div>
        <div class="col-md-4 col-sm-12">
            <fieldset class="form-group">
                <label class="col-12"><strong>Any Geography</strong></label>
                <input name="place" class="form-control-sm mb-3" placeholder="enter place">
                <label class="col-12"><strong>Part Name</strong></label>
                <input type="text" class="input form-control-sm mb-3" placeholder="Add Part Name">
            </fieldset>
            <span class="input-group-btn" style="float:right;">
            <button class="btn btn-custom blue-gray border-0" type="submit"> Search <i class="fa fa-search text-body"></i></button>
            </span> 
        </div>
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
                        <h2 class="float-left">Results  &nbsp;&nbsp;<a href="##" style="color: ##1e1e1e;"> <i class="fas fa-download" ></i> </a>  <input id="deleterowbutton" class="float-right" type="button" value="Remove Row" style="font-size:14px;margin-left: 1.5em;"/></h2>
                        <div class="row" style="clear:both;">
                        
                            <div id="jqxgrid" class="jqxGrid w-100"> 
                                <!---visualization of some sort---> 
                                <img src="/redesign/includes/images/visualization_placeholder_empty.jpg" alt="placeholder for visualization" style="margin: 20px 0 10px 0">
                            </div>
                        <!---    <div style="margin-top: 10px;">
   								 <input id="deleterowbutton" type="button" value="Remove Row" />
							</div>--->
                            <div style="margin-top: 5px;" id="enableselection"></div>
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
			//	width: getWidth('Grid'),
				autoheight: 'true',
                source: dataAdapter,
                filterable: false,
                sortable: true,
				pageable: true,
                autoheight: true,
				editable: true,
				pagesize: '20',
				showaggregates: true,
                columnsresize: true,
			
                columnsreorder: true,
				 selectionmode: 'checkbox',
                altrows: true,
                autoshowfiltericon: false,
                columns: [
				  {
				   
				   text: 'Link', datafield: 'collection_object_id', width: 100,
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
			$("##jqxgrid").on('columnreordered', function (event) {
                var column = event.args.columntext;
                var newindex = event.args.newindex
                var oldindex = event.args.oldindex;
                $("##eventlog").text("Column: " + column + ", " + "New Index: " + newindex + ", Old Index: " + oldindex);
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

            // select the second row.
            $("##jqxgrid").jqxGrid('selectrow', 2);
        });

        });
 
		
		
</script> 
</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">
