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
    <div class="container">
    <br/>
    <div class="row justify-content-center">
    <div class="col-12 col-md-9 col-lg-9">
    <div class="jumbotron">
    <form id="searchForm" class="card card-sm border-0">
    <h2 class="mt-2 mb-1 mx-5 text-center">Search Specimen Records <span class="rec_count mx-1">(access to #getCount.cnt# records)</span></h2>
    <div class="card-body row no-gutters align-items-center py-1">
        <div class="col-auto">  
		<div class="dropdown">
		  <button class="btn1 btn dropdown-toggle btn-lrg py-090" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All Collections</button>
			     <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				     <li><a tabindex="-1" href="##">Cryogenic</a>
					 <li><a tabindex="-1" href="##">Entomology</a>
					 <li><a tabindex="-1" href="##">Herpetology</a>
					 <li><a tabindex="-1" href="##">Ichthyology</a>
					 <li><a tabindex="-1" href="##">Invertebrate Paleontology</a>
					 <li><a tabindex="-1" href="##">Invertebrate Zoology</a>
					 <li><a tabindex="-1" href="##">Malacology</a>
					 <li><a tabindex="-1" href="##">Mammalogy</a>
					 <li><a tabindex="-1" href="##">Ornithology</a>
					 <li><a tabindex="-1" href="##">Vertebrate Paleontology</a>
			      </ul>
			  <!----- To-Do:  add collections from dropdown above to query on records_search.cfc  ---->
			
			</div>		
        </div>
<script>
$(function(){
  $(".dropdown-menu li a").click(function(){
    $(".btn1:first-child").text($(this).text());
    $(".btn1:first-child").val($(this).text());
  });
});
</script>
        <div class="col">
            <input id="searchText" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search keywords">
        </div>
        <div class="col-auto">
            <button class="btn btn-lg" style="background: ##BAC5C6;margin-left: 5px;" type="submit"> <i class="fa fa-search text-body"></i></button>
        </div>
    </div>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapseSearch" aria-controls="collapseSearch" style="font-size: 1.2em;margin:0 1.25em .25em 1.25em;padding: none;"> advanced search <i class="fa fa-expand"></i> </button>
		</div>
		</div>
<div class="col-sm-12 col-md-7 col-lg-7 mb-4">
    <div class="collapse navbar-collapse" id="collapseSearch">
<script>
function deleteRow(row) {
  var i = row.parentNode.parentNode.rowIndex;
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
  var inp4 = new_row.cells[4].getElementsByTagName('select')[0];
  inp4.id += len;
  inp4.value = '';
  x.appendChild(new_row);

///  If rows = 0, add one row when advanced search is clicked ///
/// make the icons (plus, trash) show on the iphone ///
}
</script>
 <form id="searchForm" class="card card-sm border-0">
    <div class="card-body row no-gutters align-items-center py-1 ml-0">
        <div id="POItablediv" class="table-responsive">
            <table id="POITable" class="table mx-0 my-0 border-0">
                 <tr class="border-0 my-0 mx-0 d-none">
                    <td class="d-none">##</td>
                    <td>And / Or/ Not</td>
                    <td>Keyword</td>
                    <td>Contains / Is</td>
                    <td>Key Value</td>
                    <td>Delete</td>
                    <td>Add</td>
                </tr>
                <tbody>
                <tr class="border-0 px-0 py-0" style="background-color: white;">
                    <td class="d-none">1</td>
                    <td class="px-0 py-0 border-0"><select id="name1" title="operator" class="custom-select mx-md-0 mt-0 py-0 rounded-0" style="min-width: 4em;text-align: center;margin-right: 1em;">
                            <option>and</option>
                            <option>or</option>
                            <option>not</option>
                        </select></td>
                    <td class="px-0 py-0 border-0"><select id="name2" title="keyword" class="custom-select mx-md-0 mt-0 py-0 rounded-0" style="min-width: 8.5em;text-align: center;">
                            <option>Keyword</option>
                            <option>Collection</option>
                            <option>Taxonomy</option>
                            <option>Places</option>
                            <option>Media</option>
                            <option>Publication</option>
                            <option>Projects</option>
                            <option>Specimens</option>
                            <option>Dates</option>
                            <option>Parts</option>
                        </select></td>
                    <td class="px-0 py-0 border-0"><select id="name3" title="operator" class="custom-select mx-md-0 mt-0 py-0 rounded-0" style="min-width: 7.5em;text-align:center;">
                            <option>contains</option>
                            <option>is</option>
                        </select></td>
                    <td class="advance px-0 py-0 border-0"><select id="name3" title="key value" class="custom-select mx-md-0 mt-0 rounded-0" style="min-width: 12.5em;text-align:center;">
                            <option>Value</option>
                            <option>Cryogenic</option>
                            <option>Herpetology</option>
                            <option>Malacology</option>
                            <option>Ichthyology</option>
                            <option>Invertebrate Zoology</option>
                            <option>Invertebrate Paleontology</option>
                            <option>Mammology</option>
                            <option>Vertebrate Paleontology</option>
                            <option>Ornithology</option>
                            <option>Entomology</option>
                        </select></td>
                    <td class="advancebut px-0 py-0 mx-0 my-0 border-0"><input type="button" id="delPOIbutton" class="fas fa-trash-alt trash mt-1 rounded py-1" value=" " onclick="deleteRow(this)" style="font-size: 1.5em;width: 1.35em; height: 1.35em;"/></td>
                    
                    <td class="advancebut px-0 py-0 mx-0 my-0 border-0"><input type="button" id="addmorePOIbutton" onclick="insRow()" class="fas fa-plus mt-1 py-1 rounded" value="" style="font-size: 1.5em;width: 1.35em;height: 1.35em;"/></td>
                </tr>
				</tbody>
            </table>
        </div>
    </div>
		</form>
    </div>
    </div>
    </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="text-left col-md-12">
                <main role="main">
                <div class="px-4 w-100 mb-5">
                    <h3 style="float: left;width:170px;">All Records</h3>
                    <!---               <button id="showLeftPush" class="active hide_button"  style="padding: 3px 5px 5px 5px;border:none;margin-bottom: -1em;margin-top: 1.25em;width: 138px;float: left;margin-left:1.8em;font-size: 14px;background-color: ##cfdfb6">Display Columns</button>--->
                    <ul>
                        <li id="showLeftPush" class="active searchfield"> <i class="fas fa-columns"></i> </li>
                        &nbsp;
                        <li class="searchfield"> <a href="##" style="color: ##1e1e1e;"> <i class="fas fa-download" ></i> </a> </li>
                       <!--- <li class="searchfield"> <a href="##" id="add-taxonomy" class="detail-edit-cell" onClick="$('##dialog-form').dialog('open');" style="color: ##1e1e1e;"> <i class="fas fa-plus-circle" style="font-size: 1em;" ></i> </a> </li>--->
                    </ul>
                    <div class="row" style="clear:both;">
                        <div id="jqxgrid" class="jqxGrid"> </div>
                    </div>
                    </main>
                </div>
            </div>
        </div>
    </div>
    <script>
///  below searches with keyword to return results which are then filtered
/// see ajax.js to see code that fills table with initial page load results
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
						{ name: 'originalcatalognumbers', type: 'string' }
					],
					root: 'specimenRecord',
					id: 'collection_object_id',

					url: '/redesign/component/records_search.cfc?method=getDataTable&searchText='+ searchParam,
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
				  { label: 'Other IDs', value: 'originalcatalognumbers'  }
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
