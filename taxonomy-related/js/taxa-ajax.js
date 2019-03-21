 $(document).ready(function () {  
	 
            var source =
            {
                datatype: "json",
				updaterow: function (rowid, rowdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failder.
                    commit(true);
                },
                datafields:
                [
                    { name: 'taxon_name_id', type: 'string' },
					{ name: 'scientific_name', type: 'string'},
					{ name: 'author_text', type: 'string' },
					{ name: 'phylclass', type: 'string' },
					{ name: 'suborder', type: 'string' },
                    { name: 'family', type: 'string' },
                    { name: 'subfamily', type: 'string' },
                    { name: 'genus', type: 'string' },
                    { name: 'species', type: 'string' },
					{ name: 'valid_catalog_term_fg', type: 'string'},
					{ name: 'source_authority', type: 'string'},
					
                    { name: 'tribe', type: 'string' },
                    { name: 'infraspecific_rank', type: 'string' },
                    { name: 'taxon_remarks', type: 'string' },
					{ name: 'phylum', type: 'string'},
					{ name: 'kingdom', type: 'string'},
					{ name: 'nomenclatural_code', type: 'string'}
	
                ],	
				root: 'taxaRecord',
				id: 'taxon_name_id',
                url: '/redesign/taxonomy-related/component/taxa-records.cfc?method=getDataTable&searchText=',	
				async: false,				
            }; 

      

			var dataAdapter = new $.jqx.dataAdapter(source, {
               downloadComplete: function (data, status, xhr) { },
               loadComplete: function (data) { },
              loadError: function (xhr, status, error) { }
            });
	        var editrow = -1;

            // create grid.
            $("#jqxgrid").jqxGrid(
            {
				width: '100%',
				autoheight: 'true',
                source: dataAdapter,
                filterable: false,
                sortable: true,
				pageable: true,
                autoheight: true,
				pagesize: '20',
				showaggregates: true,
                columnsresize: true,
				editable: true,
                selectionmode: 'singlerow',
                editmode: 'selectedrow',
                autoshowfiltericon: false,
                columns: [
				  { text: 'Taxon Name ID', datafield: 'taxon_name_id', width: 130},
				  { text: 'Scientific Name', datafield: 'scientific_name', width: 250,
				  createwidget: function (row, column, value, htmlElement) {
                   var datarecord = value;
                   var linkurl = '/redesign/taxonomy-results.cfm?scientific_name=' + value;
                   var link = '<div style="text-align:left;padding-left: 5px;margin-top:8px;"><a href="' + linkurl + '">';
                   var button = $(link + "" + value + "</a></div>");
                   $(htmlElement).append(button);
                   },  
				   initwidget: function (row, column, value, htmlElement) {}
				  },
				  { text: 'Author Text', datafield: 'author_text', width: 130 },
				  { text: 'Class', datafield: 'phylclass', width: 130  },
                  { text: 'Suborder', datafield: 'suborder', width: 130  },
                  { text: 'Family', datafield: 'family', width: 130  },
                  { text: 'Subfamily', datafield: 'subfamily', width: 130 },
                  { text: 'Genus', datafield: 'genus', width: 130 },
                  { text: 'Species', datafield: 'species', width: 130 },
				  { text: 'Valid for Catalog?', datafield: 'valid_catalog_term_fg', width: 50},
				  { text: 'Source Authority', datafield: 'source_authority', width: 130},
                  { text: 'Tribe', datafield: 'tribe', width: 130},
                  { text: 'Infraspecific Rank', datafield: 'infraspecific_rank',width: 130 },
                  { text: 'Taxon Remarks', datafield: 'taxon_remarks',width: 130 },
				  { text: 'Phylum', datafield: 'phylum',width: 130},
				  { text: 'Kingdom', datafield: 'kingdom',width: 130},
				  { text: 'Nomenclatural Code', datafield: 'nomenclatural_code',width: 130}
	
                ]
            });
	        // create buttons, listbox and the columns chooser dropdownlist.
            $("#applyfilter").jqxButton({ theme: theme });
            $("#clearfilter").jqxButton({ theme: theme });
			
            $("#filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
            $("#columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
                source: [ 
				  { label: 'Scientific Name', value: 'scientific_name' },
				  { label: 'Author Text', value: 'author_text'},
				  { label: 'Class', value: 'phylclass' },
				  { label: 'Suborder', value: 'suborder' },
                  { label: 'Family', value: 'family' },
                  { label: 'Subfamily', value: 'subfamily' },
                  { label: 'Genus', value: 'genus' },
                  { label: 'Species', value: 'species' },
				  {	label: 'Taxon Name ID', value: 'taxon_name_id' },
				  { label: 'Valid for Catalog?', value: 'valid_catalog_term_fg'},
				  { label: 'Source Authority', value: 'souce_authority'},
				  { label: 'Tribe', value: 'tribe'},
				  { label: 'Infraspecific Rank', value: 'infraspecific_rank'},
				  { label: 'Taxon Remarks', value: 'taxon_remarks'},
				  { label: 'Phylum', value: 'phylum'},
				  { label: 'Kingdom', value: 'kingdom'},
				  { label: 'Nomenclatural Code', value: 'nomenclatural_code'}
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
                $("#filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
            }

            updateFilterBox('phylclass');
            var handleCheckChange = true;
            $("#filterbox").on('checkChange', function (event) {
                if (!handleCheckChange)
                    return;
                if (event.args.label != '(Select All)') {
                    handleCheckChange = false;
                    $("#filterbox").jqxListBox('checkIndex', 0);
                    var checkedItems = $("#filterbox").jqxListBox('getCheckedItems');
                    var items = $("#filterbox").jqxListBox('getItems');

                    if (checkedItems.length == 1) {
                        $("#filterbox").jqxListBox('uncheckIndex', 0);
                    }
                    else if (items.length != checkedItems.length) {
                        $("#filterbox").jqxListBox('indeterminateIndex', 0);
                    }
                    handleCheckChange = true;
                }
                else {
                    handleCheckChange = false;
                    if (event.args.checked) {
                        $("#filterbox").jqxListBox('checkAll');
                    }
                    else {
                        $("#filterbox").jqxListBox('uncheckAll');
                    }

                    handleCheckChange = true;
                }
            });
	         // handle columns selection.
            $("#columnchooser").on('select', function (event) {
                updateFilterBox(event.args.item.value);
            });
	 
	 // builds and applies the filter.
            var applyFilter = function (datafield) {
                $("#jqxgrid").jqxGrid('clearfilters');
                var filtertype = 'stringfilter';
				if (datafield == 'collection_object_id') filtertype = 'numericfilter';
                var filtergroup = new $.jqx.filter();
                var checkedItems = $("#filterbox").jqxListBox('getCheckedItems');
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
                $("#jqxgrid").jqxGrid('addfilter', datafield, filtergroup);
			
                $("#jqxgrid").jqxGrid('applyfilters');
            }
            $("#clearfilter").click(function (datafield) { 
				//we added datafield to pass to the function
                $("#jqxgrid").jqxGrid('clearfilters');
				$("#filterbox").jqxListBox('uncheckAll');  
				//we added this line to the code
            });
            $("#applyfilter").click(function () { 
                var dataField = $("#columnchooser").jqxDropDownList('getSelectedItem').value;
                applyFilter(dataField);
            });

             var listSource = [	   
				  //{ label: 'Taxon Name ID', value: 'taxon_name_id' },
				  { label: 'Scientific Name', value: 'scientific_name'},
				  { label: 'Author Text', value: 'author_text'},
				  { label: 'Phylclass', value: 'phylclass' },
                  { label: 'Suborder', value: 'suborder' },
                  { label: 'Family', value: 'family' },
                  { label: 'Subfamily', value: 'subfamily' },
                  { label: 'Genus', value: 'genus' },
				  { label: 'Species',value: 'species'},
				  { label: 'Valid for Catalog?', value: 'valid_catalog_term_fg'},
				  { label: 'Source Authority', value: 'souce_authority'},
				  { label: 'Tribe', value: 'tribe'},
				  { label: 'Infraspecific Rank', value: 'infraspecific_rank'},
				  { label: 'Taxon Remarks', value: 'taxon_remarks'},
				  { label: 'Phylum', value: 'phylum'},
				  { label: 'Kingdom', value: 'kingdom'},
				  { label: 'Nomenclatural Code', value: 'nomenclatural_code'}
             ];

            $("#jqxlistbox2").jqxListBox({ source: listSource, width: 200, height: 200, theme: theme, checkboxes: true });
	        $("#jqxlistbox2").jqxListBox('checkAll');
            $("#jqxlistbox2").on('checkChange', function (event) {
                $("#jqxgrid").jqxGrid('beginupdate');
                if (event.args.checked) {
                    $("#jqxgrid").jqxGrid('showcolumn', event.args.value);
                }
                else {
                    $("#jqxgrid").jqxGrid('hidecolumn', event.args.value);
                }
                $("#jqxgrid").jqxGrid('endupdate');
            });
 });
  

