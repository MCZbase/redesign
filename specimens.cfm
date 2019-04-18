<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
<cfoutput>
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <section> <a id="showRightPush" class="btn black-filter-btn" role="button">Filters</a> </section>
        <h3>Filters</h3>
        <div class="col-md-3 jumbotron mb-3 pl-3">
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
                <div class="float-left d-inline ml-3 w-050 m-162"> 
                <a id="refine" value="Refine" class="d-inline align-bottom bg-transparent wd-050 text-primary"/>Refine</a> 
                </div>
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

<div class="search-form-div">
<form id="searchForm">
<div class="jumbotron px-1 mt-1">
	 <h2 class="">Search Specimen Records 
	     <span class="rec_count mx-0">(access to #getCount.cnt# records)</span>
	 </h2>
</div>
    
<div class="container-fluid">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                   <select class="dropdown-menu" role="menu" id="col-multi-select" multiple="multiple" >
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
                <span class="form-control-clear form-control-feedback hidden"><i class="far fa-times-circle" style="position: absolute;right: 55px;top: 12px;color: ##94a4a5;"></i></span>   
			    <span class="input-group-btn">
                    <button class="btn btn-default blue-gray border-0" type="submit"><i class="fa fa-search text-body"></i></button>
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


	<div class="mb-3 mx-0 mt-075"> 
		<button type="button" data-toggle="collapse" data-target="##collapseSearch" aria-controls="collapseSearch" class="fs-16 bbr-0"> 
		   Advanced Search <i class="fa fa-sort fa-xs"></i>
		</button>
    </div>		
			
<div class="container" style="margin-left:0;">
<div class="row">
<div class="collapse navbar-collapse" id="collapseSearch" style="align-items: left">
<!---advanced search dropdown table below--->

        <form id="searchForm">
            <div id="POItablediv" class="bg-0" style="background-color: none;">
                <table class="table responsive-table w-100 text-muted mb-3 rounded b-collapse-s" id="POITable" border="1" style="line-height:24px;">
				<tbody>
                    <tr class="first_row">
                        <td style="display: none;">##</td>
                        <td>and/or/not</td>
                        <td>&nbsp;&nbsp;keyword</td>
                        <td>contains/is</td>
                        <td>&nbsp;&nbsp;value</td>
                        <td>&nbsp;&nbsp;delete?</td>
                    </tr>
                    <tr class="rounded p-2 b-blue-gray p-2">
                        <td style="display: none;">1</td>
                        <td class="mx-1 p-0 border-0"><select title="operator" class="custom-select fw-510" style="min-width: 5em;">
                                <option value="and">and</option>
                                <option value="or">or</option>
                                <option value="not">not</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0">
                               <select title="keyword" id="sciNameOper" class="custom-select fw-510" style="min-width: 9em;">
                                <option value="taxonomy">Taxonomy</option>
                                <option>Places</option>
                                <option>Media</option>
                                <option>Publications</option>
                                <option>Projects</option>
                                <option>Specimens</option>
                                <option>Dates</option>
                                <option>Parts</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><select title="operator" id="sciNameOper" class="custom-select fw-510" style="min-width: 7em;">
                                <option value="like">contains</option>
                                <option value="eq">is</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search mx-0" id="key_value" placeholder="Enter Value"/></td>
                         <td class="mx-0 p-0 border-0 hello">
                        <input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" class="d-inline"/></td>
                         <td class="mx-0 p-0 border-0">
                        <input type="submit" id="searchText" value="SEARCH" class="text-right has-clear d-inline blue-gray"/>
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
         <!---       <h3 style="float: left;width:220px;">All Records</h3>
                <ul>
                    <li class="searchfield"> <a href="##" style="color: ##1e1e1e;"> <i class="fas fa-download" ></i> </a> </li>
                </ul>--->
                <div class="row" style="clear:both;">
                    <div id="jqxgrid" class="jqxGrid" style="width: 100%;">   
              
                    <div class='tableauPlaceholder' id='viz1555509433495' style='position: relative; align-content: center;margin:auto auto;'>
                    <noscript>
						<a href='##'><img alt='visualization of data' src='https://public.tableau.com/static/images/SC/SCXQGQQKW/1_rss.png' style='border: none' /></a>
					</noscript>
								<object class='tableauViz'  style='display:none;'>
								<param name='host_url' value='https://public.tableau.com/' /> 
								<param name='embed_code_version' value='3' /> 
								<param name='path' value='shared/SCXQGQQKW' /> 
								<param name='toolbar' value='yes' />
								<param name='static_image' value='https://public.tableau.com/static/images/SC/SCXQGQQKW/1.png' /> 
								<param name='animate_transition' value='yes' />
								<param name='display_static_image' value='yes' />
								<param name='display_spinner' value='yes' />
								<param name='display_overlay' value='yes' />
								<param name='display_count' value='yes' />
                    </object>
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
				  { text: '+', datafield: 'collection_object_id', width: 10, 
				   createwidget: function (row, column, value, htmlElement) {
                   var datarecord = value;
                   var linkurl = 'specimen-detail.cfm?collection_object_id=' + value;
                   var link = '<div style="text-align:center;margin-top:8px;"><a href="' + linkurl + '">';
                   var button = $(link + "<span><i class='fa fa-plus-circle'></span></a></div>");
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