 $(document).ready(function () {           
	  	   
            var source =
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
                url: '/redesign/component/records.cfc?method=getDataTable&searchText=',
				
				async: false,
				
            };
	 	
             	 
			var dataAdapter = new $.jqx.dataAdapter(source, {
               downloadComplete: function (data, status, xhr) { },
               loadComplete: function (data) { },
              loadError: function (xhr, status, error) { }
            });
           
	 


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
				pagesize: '100',
				pagesizeoptions: ['100', '200', '300', '400', '500','600','700','800','900'],
                columnsresize: true,
                autoshowfiltericon: false,
//				rendergridrows: function () {
//						return dataadapter.records;
//				},
                columns: [
				  { text: 'Collection Object ID', datafield: 'collection_object_id', width: 142, 
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
                source: [ { label: 'Collectors', value: 'collectors' },
				  { label: 'Collection Object ID', value: 'collection_object_id' },
				  { label: 'Collection', value: 'collection' },
                  { label: 'Cat Num', value: 'cat_num' },
                  { label: 'Scientific Name', value: 'scientific_name' },
                  { label: 'Locality', value: 'spec_locality' },
                  { label: 'Higher Geography', value: 'higher_geog' }
                 
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
            $("#columnchooser").on('select', function (event) {
                updateFilterBox(event.args.item.value);
            });
            var applyFilter = function (datafield) {
                $("#jqxgrid").jqxGrid('clearfilters');
                var filtertype = 'stringfilter';

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
                $("#jqxgrid").jqxGrid('clearfilters');
				  $("#filterbox").jqxListBox('uncheckAll');
            });
            $("#applyfilter").click(function () {
                var dataField = $("#columnchooser").jqxDropDownList('getSelectedItem').value;
                applyFilter(dataField);
            });
        });
  
//          $('#events').jqxPanel({ width: 300, height: 80 });
//                $("#jqxgrid").on("filter", function (event) {
//               // $("#events").jqxPanel('clearcontent');
//                var filterinfo = $("#jqxgrid").jqxGrid('getfilterinformation');
//                var eventData = "Triggered 'filter' event";
//                for (i = 0; i < filterinfo.length; i++) {
//                    var eventData = "Filter Column: " + filterinfo[i].filtercolumntext;
//                    $('#events').jqxPanel('prepend', '<div style="margin-top: 5px;">' + eventData + '</div>');
//                }
//            });