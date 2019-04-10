<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
<cfoutput>
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <section> 
             <a id="showRightPush" class="btn" role="button" style="border-color: rgb(255, 255, 255); color: rgb(255, 255, 255); background-color: rgb(15, 13, 14); box-shadow: rgb(204, 204, 204) 0px 0px 5px; border-width: 4px 0 4px 4px;">Filters</a> 
        </section>
        <h3>Filters</h3>
        <div class="col-md-3 jumbotron mb-3 pl-3">
            <h2 class="mt-3 float-left wd-280">By Columns and Values</h2>
            <div class="float-left">
                <div>Choose Column:</div>
                <div id="columnchooser"></div>
                <div class="mt-010" id="filterbox"></div>
                <div class="mt-010">
                    <input type="button" id="applyfilter" class="d-inline" value="Apply Filter"/>
                    <input type="button" id="clearfilter" class="d-inline" value="Clear Filter" style="width: auto;"/>
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
                    <input id="ended_date" type="text" style="width: 89px;">
                </div>
                <div class="float-left d-inline ml-3" style="width: 50px;margin-top: 1.62em;"> 
                     <a id="refine" value="Refine" class="d-inline align-bottom bg-transparent wd-050 bg-primary"/>Refine</a> 
                </div>
            </div>
        </div>
    </nav>
    <nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left zindex-sticky" id="cbp-spmenu-s3">
        <section> 
             <a id="showLeftPush" class="btn" role="button" style="border-color: rgb(255, 255, 255); color: rgb(255, 255, 255); background-color: rgb(15, 13, 14); box-shadow: rgb(204, 204, 204) 0px 0px 5px; border-width: 4px 0 4px 4px;">Columns</a> 
        </section>
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
            <div class="float-left mt-3 zindex-sticky bg-white">
                <div id="jqxlistbox2"></div>
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

<div class="container">
    <br/>
    <div class="row justify-content-center">
    <div class="col-12 col-md-10 col-lg-10 col-sm-12 col-xs-12">
    <div class="jumbotron">
    <form id="searchForm" class="card card-sm border-0">
    <h2 class="mb-2 mt-4 mx-5 text-center">Search Specimen Records <span class="rec_count mx-1">(access to #getCount.cnt# records)</span></h2>
    <div class="card-body row no-gutters align-items-center py-1">
<style>
	button.ui-multiselect {background-color: ##BAC5C6;padding: .89em; width: 100px;font-weight: 600;}
	button.ui-multiselect.ui-state-active {color: ##535353;font-weight: 600;}
	button span.ui-icon {margin-top:0;color:black;width: 10px;}
	.ui-multiselect-header span.ui-icon {top: 4px;}
	select span.ui-icon {margin-top:10px;}
	.ui-multiselect-checkboxes label input {float:left; top:1px; position: relative;}
	.ui-icon-triangle-2-n-s {font-size: 20px;color: black;}
</style>
<div class="col-sm-6 col-xs-6 col-lg-5 d-flex mx-0 my-1">
<select id="coll-multi-select" multiple="multiple">
	<cfloop query="collSearch">
			<option value="#collSearch.guid_prefix#" style="font-size: 14px;"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
	</cfloop>
</select>
</div>
<script>
$("##coll-multi-select").multiselect({
	minWidth: "150",
	height: "300"
});
</script>
        <div class="col-sm-8 col-xs-8 col-lg-5 my-1">
            <input id="searchText" class="form-control form-control-lg form-control-borderless col-sm-12" type="search" >
        </div>
        <div class="col-auto my-1">
            <button class="btn btn-lg" style="background: ##BAC5C6;" type="submit"> <i class="fa fa-search text-body"></i></button>
        </div>
    </div>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapseSearch" aria-controls="collapseSearch" style="font-size: 16px;"> advanced search <i class="fa fa-expand"></i></button>
	</div>
</div>
<div class="col-sm-12 col-md-7 col-lg-7 mb-4">
<div class="collapse navbar-collapse" id="collapseSearch">
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
    inp1.value = '';

    var inp2 = new_row.cells[2].getElementsByTagName('select')[0];
    inp2.id += len;
    inp2.value = '';
	
	var inp3 = new_row.cells[3].getElementsByTagName('select')[0];
    inp3.id += len;
    inp3.value = '';
	
	var inp4 = new_row.cells[4].getElementsByTagName('input')[0];
    inp4.id += len;
    inp4.value = '';

    var button = new_row.cells[5].getElementsByTagName('input')[0];
    button.value = "DELETE";
    button.onclick = function(it) {deleteRow(it)};

    x.appendChild( new_row );    
}
</script>
<form id="searchForm" class="border-0" style="margin: 0 auto">
    <div id="POItablediv" class="align-content-center">         
    <table class="table" id="POITable" border="1">
        <tr class="first_row">
            <td style="display: none;">##</td>
            <td>and/or/not</td>
            <td>&nbsp;&nbsp;keyword</td>
            <td>contains/is</td>
			<td>&nbsp;&nbsp;value</td>
			<td>&nbsp;&nbsp;delete?</td>
        </tr>
        <tr style="margin: 0 auto;">
             <td style="display: none;">1</td>
             <td class="px-0 py-0 border-0" style="width: 6em;">
                           <select title="operator" class="custom-select mx-md-0 search-fields" style="min-width: 6em;text-align: center;margin-right: 1em;">
                            <option>and</option>
                            <option>or</option>
                            <option>not</option>
                        </select></td>
             <td class="px-0 py-0 border-0" style="width:9em;"><select title="keyword" class="custom-select mx-md-0 search-fields" style="min-width: 9em;">
                            <option>Taxonomy</option>
                            <option>Places</option>
                            <option>Media</option>
                            <option>Publications</option>
                            <option>Projects</option>
                            <option>Specimens</option>
                            <option>Dates</option>
                            <option>Parts</option>
                        </select></td>
             <td class="px-0 py-0 border-0"><select title="operator" class="custom-select mx-md-0 search-fields" style="min-width: 7.5em;text-align:center;">
                            <option>contains</option>
                            <option>is</option>
                        </select></td>
             <td class="px-0 py-0 border-0 d-xs-flex"><input type="text" id="key_value" class="m-0 mt-1 d-xs-flex d-sm-flex"/></td>
         <td class="px-2 py-0 border-0"><input type="button" id="delPOIbutton" class="mx-0 mt-1 p-1" value="ADD ROW" style="font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, 'sans-serif'"onclick="insRow()"/></td>
       <td class="px-0 py-0 m-0 border-0"><input type="button" id="searchButton" style="font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, 'sans-serif'" class="mx-0 mt-1 p-1" value="SEARCH" onclick="search()"/></td>
        </tr>
    </table>
	</div>
</form>
	</div>
	</div>
	   </div>
	<div class="col-2"><div class="row"> </div></div>

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
                    <h3 style="float: left;width:220px;">All Records</h3>
                    <ul>
                        <li class="searchfield"> 
                             <a href="##" style="color: ##1e1e1e;"> <i class="fas fa-download" ></i> </a> 
                        </li>
                    </ul>
                    <div class="row" style="clear:both;">
                        <div id="jqxgrid" class="jqxGrid"> </div>
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
			$("##jqxgrid").jqxGrid({source: dataAdapter});
	
			evt.preventDefault();	

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
				uniqueRecords.splice(0, 0, '(Select All)');
                $("##filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
                $("##filterbox").jqxListBox('checkAll');
            }
            updateFilterBox('collectors');
   			$("##filterbox").on('checkChange', function (event) {
              if (!handleCheckChange)
                 return;
	   		  var handleCheckChange = true;
				
   			});
            $("##columnchooser").on('select', function (event) {
                updateFilterBox(event.args.item.value);
            });
            var applyFilter = function (datafield) {
                $("##jqxgrid").jqxGrid('clearfilters');
                var filtertype = 'stringfilter';

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
                $("##jqxgrid").jqxGrid('clearfilters');
            });
            $("##applyfilter").click(function () {
                var dataField = $("##columnchooser").jqxDropDownList('getSelectedItem').value;
                applyFilter(dataField);
			
                updateFilterBox(dataField);
            
            });
        });	  

 });
</script> 
</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">
