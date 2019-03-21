<cfset pageTitle = "search specimens">
<cfinclude template = "/redesign/includes/_header.cfm">
<cfoutput>
     <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <section> <a id="showRightPush" class="btn" role="button" style="border-color: rgb(255, 255, 255); color: rgb(255, 255, 255); background-color: rgb(15, 13, 14); box-shadow: rgb(204, 204, 204) 0px 0px 5px; border-width: 4px 0 4px 4px;">Filters</a> </section>
        <h3>Filters</h3>
        <div class="col-md-3 jumbotron" style="margin-bottom: 3em;padding-left:1em;">
            <h2 style="width: 280px;float: left;margin-top: 1em;">By Columns and Values</h2>
            <div style="float: left;">
                <div>Choose Column:</div>
                <div id="columnchooser"></div>
                <div style="margin-top: 10px;" id="filterbox"></div>
                <div style="margin-top: 10px;">
                    <input type="button" id="applyfilter" value="Apply Filter" style="display: inline;"/>
                    <input type="button" id="clearfilter" value="Clear Filter" style="display: inline;width: auto;"/>
                </div>
            </div>
            <div style="width: 280px;float: left;margin-top: 1em;z-index: 50001">
                <h2>Date</h2>
                <div style="float: left;display:inline;width: 90px;margin-right: 1em;">
                    <label style="margin-bottom: .14em;">From</label>
                    <input id="began_date" type="text" style="width: 89px;">
                </div>
                <div style="float: left;display:inline;width: 90px;">
                    <label style="margin-bottom: .14em;">To</label>
                    <input id="ended_date" type="text" style="width: 89px;">
                </div>
                <div style="float: left;display:inline;width: 50px;margin-left: 1em;margin-top: 1.62em;"> <a id="refine" value="Refine" style="display: inline;width: 60px;vertical-align: bottom;background-color: none;color:##007bff;"/>Refine</a> </div>
            </div>
        </div>
    </nav>
    <nav class="cbp-spmenu cbp-spmenu-vertical-left cbp-spmenu-left" id="cbp-spmenu-s3" style="z-index: 5000;">
        <h5>Display Columns</h5>
        <div class="col-md-3 jumbotron" style="margin-bottom: 3em;padding-left:1em;margin-top: 0rem">
            <ul class="checks">
                <li>
                    <input type="checkbox">
                    Check all</li>
                <li>
                    <input type="checkbox">
                    Minimum</li>
            </ul>
            <div style="float: left;margin-top: 1em;z-index: 50001;background-color:white;">
                <div id="jqxlistbox2"></div>
            </div>
        </div>
    </nav>
    <cfquery name="getCount" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	select count(collection_object_id) as cnt from cataloged_item
</cfquery>
    <div class="container"> <br/>
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8 jumbotron">
                <form id="searchForm" class="card card-sm" style="border: none;">
                    <h2 class="mt-2 mb-1 mx-5">Search Specimen Records <span class="rec_count mx-1">(access to #getCount.cnt# records)</span></h2>
                    <div class="card-body row no-gutters align-items-center py-1">
                        <div class="col-auto"> </div>
                        <!--end of col-->
                        <div class="col">
                            <input id="searchText" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search keywords">
                        </div>
                        <!--end of col-->
                        <div class="col-auto">
                            <button class="btn btn-lg" style="background: ##BAC5C6;" type="submit"> <i class="fas fa-search text-body"></i></button>
                        </div>
                        <!--end of col--> 
                        
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapseSearch" aria-controls="collapseSearch" style="font-size: 1.2em;margin:0 1.2em .25em 1.2em;"> advanced search <i class="fas fa-expand"></i> </button>
                    <div class="collapse navbar-collapse" id="collapseSearch"> <img src="/redesign/includes/images/Hollis.jpg" alt="screenshot of build a search" width="100%" style="margin-left: 0%;border:none;margin-top:1em;"/> </div>
                </form>
            </div>
            <!--end of col--> 
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="text-left col-md-12">
                <main role="main">
                    <div class="px-4 w-100 mb-5">
                        <h3 style="float: left;width: auto;">All Records</h3>
                         <button id="showLeftPush" class="active"  style="padding: 3px 5px 5px 5px;width: 138px;float: left;margin-left:1.8em;font-size: 14px;">Display Columns</button>
                        <div class="row" style="clear:both;">
                            <div id="jqxgrid" class="jqxGrid"> </div>
                        </div>
                        <div class='tableauPlaceholder' id='viz1552402922283' style='position: relative'>
                            <noscript>
                            <a href='##'><img alt=' ' src='https://public.tableau.com&##47;static&##47;images&##47;CQ&##47;CQGXQ5H7N&##47;1_rss.png' style='border: none' /></a>
                            </noscript>
                            <object class='tableauViz'  style='display:none;'>
                                <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
                                <param name='embed_code_version' value='3' />
                                <param name='path' value='shared&##47;CQGXQ5H7N' />
                                <param name='toolbar' value='yes' />
                                <param name='static_image' value='https://public.tableau.com/static/images/CQ/CQGXQ5H7N/1.png' />
                                <param name='animate_transition' value='yes' />
                                <param name='display_static_image' value='yes' />
                                <param name='display_spinner' value='yes' />
                                <param name='display_overlay' value='yes' />
                                <param name='display_count' value='yes' />
                            </object>
                        </div>
                        <script type='text/javascript'>                    
						var divElement = document.getElementById('viz1552402922283');                    
						var vizElement = divElement.getElementsByTagName('object')[0];                    
						     if ( divElement.offsetWidth > 800 ) { vizElement.style.width='100%';vizElement.style.height='827px';} 
						     else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='100%';vizElement.style.height='827px';} 
						     else { vizElement.style.width='100%';vizElement.style.height='927px';}                     
						var scriptElement = document.createElement('script');                    
						     scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    
						     vizElement.parentNode.insertBefore(scriptElement, vizElement);                
					</script> 
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
						{ name: 'collectors', type: 'string' }
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
				  { label: 'Collectors', value: 'collectors' },
				  { label: 'Collection Object ID', value: 'collection_object_id' },
				  { label: 'Collection', value: 'collection' },
                  { label: 'Cat Num', value: 'cat_num' },
                  { label: 'Scientific Name', value: 'scientific_name' },
                  { label: 'Locality', value: 'spec_locality' },
                  { label: 'Higher Geography', value: 'higher_geog' }
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
