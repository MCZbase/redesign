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
                    { name: 'collectors', type: 'string' },
					{ name: 'verbatim_date', type: 'string' },
					{ name: 'coll_obj_disposition', type: 'string' },
					{ name: 'othercatalognumbers', type: 'string' }
                ],			
				root: 'specimenRecord',
				id: 'collection_object_id',
                url: '/redesign/specimen-details-related/component/records.cfc?method=getDataTable&searchText=',	
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
				pagesize: '20',
				showaggregates: true,
				//pagesizeoptions: ['100', '200', '300', '400', '500','600','700','800','900'],
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
            $("#applyfilter").jqxButton({ theme: theme });
            $("#clearfilter").jqxButton({ theme: theme });	
            $("#filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
            $("#columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
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
		        var filterBoxAdapter = new $.jqx.dataAdapter(source,
                {
                    uniqueDataFields: [datafield],
                    autoBind: true					
                });
				var uniqueRecords = filterBoxAdapter.records;
				uniqueRecords.splice(0, 0, '(Select All)');
                $("#filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
               // $("#filterbox").jqxListBox('checkAll');
			

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

			  $("#jqxlistbox2").jqxListBox({ source: listSource, width: 198, height: 300, theme: theme, checkboxes: true });
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
 
	   $('#eventsLog').jqxPanel({ width: 300, height: 80 });
            $("#grid").on("filter", function (event) {
                $("#events").jqxPanel('clearcontent');
                var filterinfo = $("#grid").jqxGrid('getfilterinformation');
                var eventData = "Triggered 'filter' event";
                for (i = 0; i < filterinfo.length; i++) {
                    var eventData = "Filter Column: " + filterinfo[i].filtercolumntext;
                    $('#eventLog').jqxPanel('prepend', '<div style="margin-top: 5px;">' + eventData + '</div>');
                }
            });
 
        });





  