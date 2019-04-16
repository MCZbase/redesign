<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
<cfoutput>
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <section> <a id="showRightPush" class="btn" role="button" style="border-color: rgb(255, 255, 255); color: rgb(255, 255, 255); background-color: rgb(15, 13, 14); box-shadow: rgb(204, 204, 204) 0px 0px 5px; border-width: 4px 0 4px 4px;">Filters</a> </section>
        <h3>Filters</h3>
        <div class="col-md-3 jumbotron mb-3 pl-3">
            <h2 class="mt-2 float-left wd-280">By Columns and Values</h2>
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
                <div class="float-left d-inline ml-3" style="width: 50px;margin-top: 1.62em;"> <a id="refine" value="Refine" class="d-inline align-bottom bg-transparent wd-050 bg-primary"/>Refine</a> </div>
            </div>
        </div>
    </nav>
    <nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left zindex-sticky" id="cbp-spmenu-s3">
        <section> <a id="showLeftPush" class="btn" role="button" style="border-color: rgb(255, 255, 255); color: rgb(255, 255, 255); background-color: rgb(15, 13, 14); box-shadow: rgb(204, 204, 204) 0px 0px 5px; border-width: 4px 0 4px 4px;">Columns</a> </section>
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
                <div id="jqxlistbox2" style="margin-left: 5px;margin-top: 1em;"></div>
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

<div style="padding: 0 2.5em 0 2em;border: 1px solid ##ccc;color: ##333;background-color:##e9ecef;z-index: -1">
<form id="searchForm">
<div class="jumbotron px-1" style="background-color: ##e9ecef;">
	 <h2 class="">Search Specimen Records 
	     <span class="rec_count mx-0">(access to #getCount.cnt# records)</span>
	 </h2>
</div>
    
<div class="container-fluid">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel" style="">
                   <select class="dropdown-menu" role="menu" id="col-multi-select" multiple="multiple" >
                    <cfloop query="collSearch">
                        <option value="#collSearch.guid_prefix#" style="font-size: 14px;"> #collSearch.collection# (#collSearch.guid_prefix#)</option>
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
							noneSelectedText: "Collections ",
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
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input id="searchText" type="text" class="has-clear form-control form-control-borderless" name="x" placeholder="Search term" style="border-radius:5px;">
                <span class="form-control-clear form-control-feedback hidden"><i class="far fa-times-circle" style="position:absolute;right: 55px;top:12px;color: ##94a4a5;"></i></span>   
			    <span class="input-group-btn">
                    <button class="btn btn-default" style="border: 1px solid ##bac5c6;background-color: ##bebebe" type="submit"><i class="fa fa-search text-body"></i></button>
                </span>
            </div>
        </div>
	</div>
</div>

<script>
	/// clear keyword search script below
$('.has-clear input[type="text"]').on('input propertychange', function() {
  var $this = $(this);
  var visible = Boolean($this.val());
  $this.siblings('.form-control-clear').toggleClass('hidden', !visible);
}).trigger('propertychange');

$('.form-control-clear').click(function() {
  $(this).siblings('input[type="text"]').val('')
    .trigger('propertychange').focus();
});
</script>


	<div class="mb-3 mx-0" style="margin-top:.75em"> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapseSearch" aria-controls="collapseSearch" style="font-size: 16px;margin-left:2px;"> Advanced Search <i class="fa fa-sort fa-xs"></i></button></div>		
			
<div class="container" style="margin-left:0;">
<div class="row">
<div class="collapse navbar-collapse" id="collapseSearch" style="align-items: left">
<!---advanced search dropdown table below--->
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
    button.value = "* DELETE *";
    button.onclick = function(it) {deleteRow(it)};

    x.appendChild( new_row );    
}
</script>
        <form id="searchForm">
            <div id="POItablediv" class="" style="background-color: none;">
                <table class="table responsive-table" id="POITable" border="1" style="width:100%;border-collapse:separate !important; line-height:24px; font-weight:100;margin-bottom: 1.25em;border-radius:5px;" class="bodywrapcenter">
				<tbody>
                    <tr class="first_row">
                        <td style="display: none;">##</td>
                        <td>and/or/not</td>
                        <td>&nbsp;&nbsp;keyword</td>
                        <td>contains/is</td>
                        <td>&nbsp;&nbsp;value</td>
                        <td>&nbsp;&nbsp;delete?</td>
                    </tr>
                    <tr style="padding:.5em;border: 1px solid ##bac5c6;border-radius: 5px;">
                        <td style="display: none;">1</td>
                        <td class="mx-1 p-0 border-0"><select title="operator" class="custom-select" style="min-width: 5em;font-weight: 510;">
                                <option value="and">and</option>
                                <option value="or">or</option>
                                <option value="not">not</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0">
                               <select title="keyword" id="sciNameOper" class="custom-select" style="min-width: 9em;margin-right: 10px;font-weight: 510">
                                <option value="taxonomy">Taxonomy</option>
                                <option>Places</option>
                                <option>Media</option>
                                <option>Publications</option>
                                <option>Projects</option>
                                <option>Specimens</option>
                                <option>Dates</option>
                                <option>Parts</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><select title="operator" id="sciNameOper" class="custom-select" style="min-width: 7em;font-weight: 510">
                                <option value="like">contains</option>
                                <option value="eq">is</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search" id="key_value" placeholder="Enter Value" style="margin-left:0; margin-right:0;margin-right: 0; "/></td>
                         <td class="mx-0 p-0 border-0 hello">
                        <input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" style="display:inline;"/></td>
                         <td class="mx-0 p-0 border-0">
                        <input type="submit" id="searchText" value="SEARCH" class="text-right has-clear" style="display: inline;background-color: ##BEBEBE;"/>
                        </td>
                    </tr>
					</tbody>
                </table>
            </div>
        </form>
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
                    <li class="searchfield"> <a href="##" style="color: ##1e1e1e;"> <i class="fas fa-download" ></i> </a> </li>
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
