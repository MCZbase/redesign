 $(document).ready(function () {           	   
//            var search =
//            {
//                datatype: "json",
//                datafields:
//                [
//                    { name: 'collection_object_id', type: 'string' },
//					{ name: 'collection', type: 'string' },
//                    { name: 'cat_num', type: 'string' },
//                    { name: 'scientific_name', type: 'string' },
//                    { name: 'spec_locality', type: 'string' },
//                    { name: 'higher_geog', type: 'string' },
//                    { name: 'collectors', type: 'string' }
//                ],			
//				root: 'specimenRecord',
//				id: 'collection_object_id',
//                url: '/redesign/component/records.cfc?method=getDataTable&searchText=',	
//				async: false,				
//            };   	 
		var dataAdapter = new $.jqx.dataAdapter(search, {
               downloadComplete: function (data, status, xhr) { },
               loadComplete: function (data) { },
              loadError: function (xhr, status, error) { }
            });
				
				
				 $('##jqxgrid').jqxGrid('source', dataAdapter);

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
				pagesize: '50',
                columnsresize: true,
                autoshowfiltericon: false,
                columns: [
				  { text: 'Collection Object ID', datafield: 'collection_object_id', width: 142
				   , 
				   createwidget: function (row, column, value, htmlElement) {
                   var datarecord = value;
                   var linkurl = 'specimen-details2.cfm?collection_object_id=' + value;
                   var link = '<div style="text-align:center;margin-top:8px;"><a href="' + linkurl + '">';
                   var button = $(link + "<span>" + value + "</span></a></div>");
                   $(htmlElement).append(button);
                      }
                  },
                  { text: 'Collection', datafield: 'collection', width: 'auto' },
                  { text: 'Catalog Number', datafield: 'cat_num', width: 'auto' },
                  { text: 'Scientific Name', datafield: 'scientific_name', width:'auto' },
                  { text: 'Locality', datafield: 'spec_locality', width:'auto'},
                  { text: 'Higher Geography', datafield: 'higher_geog', width:'auto'},
                  { text: 'Collectors', datafield: 'collectors', width: 'auto' }
                ]
            });
	 		// create buttons, listbox and the columns chooser dropdownlist.
            // create buttons, listbox and the columns chooser dropdownlist.
	        // create buttons, listbox and the columns chooser dropdownlist.
            $("#applyfilter").jqxButton({ theme: theme });
            $("#clearfilter").jqxButton({ theme: theme });
            $("#filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
            $("#columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
                search: [ 
				  {	label: 'Collectors', value: 'collectors' },
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
                $("#filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
                $("#filterbox").jqxListBox('checkAll');
            }

            updateFilterBox('collectors');
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
	 
	    var listSource = [{ label: 'Collectors', value: 'collectors' },
				  { label: 'Collection Object ID', value: 'collection_object_id' },
				  { label: 'Collection', value: 'collection' },
                  { label: 'Cat Num', value: 'cat_num' },
                  { label: 'Scientific Name', value: 'scientific_name' },
                  { label: 'Locality', value: 'spec_locality' },
                  { label: 'Higher Geography', value: 'higher_geog' },
				  { label: 'Verbatim Date',value: 'verbatim_date'  },
				  { label: 'Disposition', value: 'coll_obj_disposition' },
				  { label: 'Other IDs', value: 'originalcatalognumbers'    
   }];

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
  
