<cfset pageTitle = "search media">
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
        <h5>Display Columns &nbsp;<i class="fas fa-columns" style="opacity: .5"></i></h5>
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
    <div class="container-fluid"> <br/>
        <div class="row">
            <div class="col-sm-1 col-md-4 col-lg-4 jumbotron pt-0">
                <form id="searchForm" class="card card-sm" style="border: none;">
                    <h2 class="mt-2 mb-1 mx-5">Search Media </h2>
                    <div class="card-body row no-gutters align-items-center py-1 mr-4">
                        <div class="col-auto"> </div>
                        <!--end of col-->
                        <div class="col px-2">
                            <input id="searchText" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search any terms">
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
            
            <div class="col-sm-1 col-md-3 col-lg-3 jumbotron pt-2">
                 <div class="row no-gutters align-items-left py-1 mx-3">
                    <h2 class="mt-1 mb-1 mx-1">What's here </h2>
                    <p class="card card-sm mx-1" style="border: none;display: inline;"> These <a href="##" style="color: green;">476270</a> records represent media in MCZbase. The media may or may not be connected to data objects. </p>
                 </div>
                </p>
            </div>
            
                 <div class="col-sm-12 col-md-5 col-lg-5 jumbotron pt-2">
                 <div class="row no-gutters align-items-left py-1 mx-1">
                   <h2 class="my-1 mx-1 w-100">Select Usage </h2>
                    <form id="searchForm" style="border: none;">
                            <ul class="check_selection mx-0 mb-4">
							  <li><input type="checkbox">Limit search to media not yet linked to any record.</li>
							  <li><input type="checkbox">Require MIME Tag</li>
							  <li><input type="checkbox">Require Media Type</li>
                            </ul>
                     </form>
                </div>
                </div>

        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="px-0 text-left col-lg-12">
                <main role="main">
                    <div class="px-4 w-100 mb-5">
                        <h3 style="width: 150px;float: left;">Media</h3>
                        <ul>
                      <li id="showLeftPush" class="active" style="margin-top: .5em;font-size: 1.2em;padding-bottom: 0;float: left;width: 1.2em;margin-right: .6em;list-style: none;"><i class="fas fa-columns"></i> &nbsp;</li>
                       <li style="font-size: 1.2em;margin-top:.5em;padding-bottom: 0;float: left;width: 1.2em;margin-right: .6em;list-style:none;"><a href="##" style="color: black;"><i class="fas fa-download" ></i></a>
							</li></ul>
                        <div class="row" style="clear:both;">
                            <div id="jqxgrid" class="jqxGrid"> </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <script>
////  below searches with keyword to return results which are then filtered
//// see ajax.js to see code that fills table with initial page load results
		  $(document).ready(function() {
                $('##searchForm').bind('submit', function(evt){
				console.log($('##searchText').val());
				var searchParam = $('##searchText').val();
				$('##searchText').jqxGrid('showloadelement');
				$("##jqxgrid").jqxGrid('clearfilters');
				var taxasearch =
				{
					datatype: "json",
					datafields:
					[
	                { name: 'taxon_name_id', type: 'string' },
					{ name: 'scientific_name', type: 'string'},
					{ name: 'phylclass', type: 'string' },
					{ name: 'suborder', type: 'string' },
                    { name: 'family', type: 'string' },
                    { name: 'subfamily', type: 'string' },
                    { name: 'genus', type: 'string' },
                    { name: 'species', type: 'string' },
					{ name: 'valid_catalog_term_fg', type: 'string'},
					{ name: 'source_authority', type: 'string'},
					{ name: 'author_text', type: 'string' },
                    { name: 'tribe', type: 'string' },
                    { name: 'infraspecific_rank', type: 'string' },
                    { name: 'taxon_remarks', type: 'string' },
					{ name: 'phylum', type: 'string'},
					{ name: 'kingdom', type: 'string'},
					{ name: 'nomenclatural_code', type: 'string'}
					],
					root: 'specimenRecord',
					id: 'taxon_name_id',

					url: '/redesign/taxonomy-related/component/taxa-records_search.cfc?method=getDataTable&searchText='+ searchParam,
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

	  		// create buttons, listbox and the columns chooser dropdownlist.
            // create buttons, listbox and the columns chooser dropdownlist.
	        // create buttons, listbox and the columns chooser dropdownlist.
            $("##applyfilter").jqxButton({ theme: theme });
            $("##clearfilter").jqxButton({ theme: theme });
			
            $("##filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
            $("##columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
                source: [ 
				  { label: 'Scientific Name', value: 'scientific_name' },
				  { label: 'Class', value: 'phylclass' },
				  { label: 'Suborder', value: 'suborder' },
                  { label: 'Family', value: 'family' },
                  { label: 'Subfamily', value: 'subfamily' },
                  { label: 'Genus', value: 'genus' },
                  { label: 'Species', value: 'species' },
				  {	label: 'Taxon Name ID', value: 'taxon_name_id' },
				  { label: 'Valid for Catalog?', value: 'valid_catalog_term_fg', width: 50},
				  { label: 'Source Authority', value: 'souce_authority',width: 200},
				  { label: 'Author Text', value: 'author_text', width: 200},
				  { label: 'Tribe', value: 'tribe', width: 150},
				  { label: 'Infraspecific Rank', value: 'infraspecific_rank', width: 150},
				  { label: 'Taxon Remarks', value: 'taxon_remarks', width: 150},
				  { label: 'Phylum', value: 'phylum', width: 150},
				  { label: 'Kingdom', value: 'kingdom', width: 150},
				  { label: 'Nomenclatural Code', value: 'nomenclatural_code', width: 150}
                ]
            });

            var updateFilterBox = function (datafield) {
		        var filterBoxAdapter = new $.jqx.dataAdapter(source,
                {
                    uniqueDataFields: [datafield],
                    autoBind: true					
                });
				var uniqueRecords = filterBoxAdapter.records;
				uniqueRecords.splice(0, 0, '(Select All)');
                $("##filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
               // $("##filterbox").jqxListBox('checkAll');
			

            }

            updateFilterBox('phylclass');
            var handleCheckChange = true;
            $("##filterbox").on('checkChange', function (event) {
                if (!handleCheckChange)
                    return;
                if (event.args.label != '(Select All)') {
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

             var listSource = [	   
				  { label: 'Taxon Name ID', value: 'taxon_name_id' },
				  { label: 'Scientific Name', value: 'scientific_name'},
				  { label: 'Phylclass', value: 'phylclass' },
                  { label: 'Suborder', value: 'suborder' },
                  { label: 'Family', value: 'family' },
                  { label: 'Subfamily', value: 'subfamily' },
                  { label: 'Genus', value: 'genus' },
				  { label: 'Species',value: 'species'},
				  { label: 'Valid for Catalog?', value: 'valid_catalog_term_fg'},
				  { label: 'Source Authority', value: 'souce_authority'},
				  { label: 'Author Text', value: 'author_text'},
				  { label: 'Tribe', value: 'tribe'},
				  { label: 'Infraspecific Rank', value: 'infraspecific_rank'},
				  { label: 'Taxon Remarks', value: 'taxon_remarks'},
				  { label: 'Phylum', value: 'phylum'},
				  { label: 'Kingdom', value: 'kingdom'},
				  { label: 'Nomenclatural Code', value: 'nomenclatural_code'}
             ];

            $("##jqxlistbox2").jqxListBox({ source: listSource, width: 200, height: 200, theme: theme, checkboxes: true });
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
</script> 
</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">
