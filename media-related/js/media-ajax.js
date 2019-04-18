 $(document).ready(function () {  
	 
            var source =
            {
                datatype: "json",
                datafields:
                [

				
                    { name: 'media_id', type: 'string' },
					{ name: 'media_uri', type: 'string'},
					{ name: 'mime_type', type: 'string' },
					{ name: 'media_type', type: 'string' },
                    { name: 'preview_uri', type: 'string' },
                    { name: 'media_license_id', type: 'string' },
                    { name: 'mask_media_fg', type: 'string' },
					{ name: 'media_label', type: 'string' },
                    { name: 'label_value', type: 'string' },
                    { name: 'keywords', type: 'string' },
					{ name: 'lastdate', type: 'string'}
					
				],			
				root: 'media',
				id: 'media_id',
                url: '/redesign/media-related/component/media-records.cfc?method=getDataTable&searchText=',	
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
                columnsresize: true,
				rowsheight: 68,
                autoshowfiltericon: false,
                columns: [
              { 
					text: 'Media ID', datafield: 'media_id', width: 100},
//                      createwidget: function (row, column, value, htmlElement) {
//                          var datarecord = value;
//                          var imgurl = '/redesign/includes/images/eol.png';
//                          var img = '<img style="margin-top: 3px;height: 40px;" height="40" width="40" src="' + imgurl + '"/>';
//                          var button = $("<div style='border:none;'>" + img + "<div class='buttonValue'>" + value + "</div></div>");
//                          $(htmlElement).append(button);
//                          button.jqxButton({ template: "success", height: '100%', width: '100%' });
//                          button.click(function (event) {
//                              var clickedButton = button.find(".buttonValue")[0].innerHTML;
//                              alert(clickedButton);
//                          });
//                      },
//                      initwidget: function (row, column, value, htmlElement) {
//                          var imgurl = '/redesign/includes/images/eol.png';
//                          $(htmlElement).find('.buttonValue')[0].innerHTML = value;
//                          $(htmlElement).find('img')[0].src = imgurl;
//                      }
//                  },

				  { text: 'Media URI', datafield: 'media_uri', width: 650  },
                  { text: 'Mime Type', datafield: 'mime_type', width: 130  },
                  { text: 'Media Type', datafield: 'media_type', width: 130  },
                  { text: 'Preview URI', datafield: 'preview_uri', width: 650 },
                  { text: 'Media License ID', datafield: 'media_license_id', width: 70 },
                  { text: 'Mask Media Flag', datafield: 'mask_media_fg', width: 70 },
				  { text: 'Media Label', datafield: 'media_label', width: 70 },
				  { text: 'Label Value', datafield: 'label_value', width: 70 },
				  { text: 'Keywords', datafield: 'keywords', width: 70 },
				  { text: 'Last Date', datafield: 'lastdate', width: 70 }
                ]

            });
	 
	  		// create buttons, listbox and the columns chooser dropdownlist.
            // create buttons, listbox and the columns chooser dropdownlist.
	        // create buttons, listbox and the columns chooser dropdownlist.
//            $("#applyfilter").jqxButton({ theme: theme });
//            $("#clearfilter").jqxButton({ theme: theme });
//			
//            $("#filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
//            $("#columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
//                source: [ 
//				  { label: 'Media ID', value: 'media_id' },
//				  { label: 'Media URI', value: 'media_uri' },
//				  { label: 'Mime Type', value: 'mime_type' },
//                  { label: 'Media Type', value: 'media_type' },
//                  { label: 'Preview URI', value: 'preview_uri' },
//                  { label: 'Media License ID', value: 'media_license_id' },
//				  { label: 'Mask Media ID', value: 'mask_media_id' },
//				  { label: 'Media Label', value: 'media_label' },
//				  { label: 'Label Value', value: 'label_value' },
//				  { label: 'Keywords', value: 'keywords' },
//				  { label: 'Last Date', value: 'lastdate' }
//	
//                ]
//            });
//
//            var updateFilterBox = function (datafield) {
//		        var filterBoxAdapter = new $.jqx.dataAdapter(source,
//                {
//                    uniqueDataFields: [datafield],
//                    autoBind: true					
//                });
//				var uniqueRecords = filterBoxAdapter.records;
//				uniqueRecords.splice(0, 0, '(Select All)');
//                $("#filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
//               // $("#filterbox").jqxListBox('checkAll');
//			
//
//            }
//
//            updateFilterBox('media_uri');
//            var handleCheckChange = true;
//            $("#filterbox").on('checkChange', function (event) {
//                if (!handleCheckChange)
//                    return;
//                if (event.args.label != '(Select All)') {
//                    handleCheckChange = false;
//                    $("#filterbox").jqxListBox('checkIndex', 0);
//                    var checkedItems = $("#filterbox").jqxListBox('getCheckedItems');
//                    var items = $("#filterbox").jqxListBox('getItems');
//
//                    if (checkedItems.length == 1) {
//                        $("#filterbox").jqxListBox('uncheckIndex', 0);
//                    }
//                    else if (items.length != checkedItems.length) {
//                        $("#filterbox").jqxListBox('indeterminateIndex', 0);
//                    }
//                    handleCheckChange = true;
//                }
//                else {
//                    handleCheckChange = false;
//                    if (event.args.checked) {
//                        $("#filterbox").jqxListBox('checkAll');
//                    }
//                    else {
//                        $("#filterbox").jqxListBox('uncheckAll');
//                    }
//
//                    handleCheckChange = true;
//                }
//            });
	         // handle columns selection.
      //      $("#columnchooser").on('select', function (event) {
//                updateFilterBox(event.args.item.value);
//            });
	 
	 // builds and applies the filter.
   //         var applyFilter = function (datafield) {
//                $("#jqxgrid").jqxGrid('clearfilters');
//                var filtertype = 'stringfilter';
//				if (datafield == 'collection_object_id') filtertype = 'numericfilter';
//                var filtergroup = new $.jqx.filter();
//                var checkedItems = $("#filterbox").jqxListBox('getCheckedItems');
//                if (checkedItems.length == 0) {
//                    var filter_or_operator = 1;
//                    var filtervalue = "Empty";
//                    var filtercondition = 'equal';
//                    var filter = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
//                    filtergroup.addfilter(filter_or_operator, filter);
//                }
//                else {
//                    for (var i = 0; i < checkedItems.length; i++) {
//                        var filter_or_operator = 1;
//                        var filtervalue = checkedItems[i].label;
//                        var filtercondition = 'equal';
//                        var filter = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
//                        filtergroup.addfilter(filter_or_operator, filter);
//                    }
//                }
//                $("#jqxgrid").jqxGrid('addfilter', datafield, filtergroup);
//			
//                $("#jqxgrid").jqxGrid('applyfilters');
//            }
//            $("#clearfilter").click(function (datafield) { 
//				//we added datafield to pass to the function
//                $("#jqxgrid").jqxGrid('clearfilters');
//				$("#filterbox").jqxListBox('uncheckAll');  
//				//we added this line to the code
//            });
//            $("#applyfilter").click(function () { 
//                var dataField = $("#columnchooser").jqxDropDownList('getSelectedItem').value;
//                applyFilter(dataField);
//            });

          //   var listSource = [	   
//		
//	         	  { label: 'Media ID', value: 'media_id' },
//				  { label: 'Media URI', value: 'media_uri' },
//				  { label: 'Mime Type', value: 'mime_type' },
//                  { label: 'Media Type', value: 'media_type' },
//                  { label: 'Preview URI', value: 'preview_uri' },
//                  { label: 'Media License ID', value: 'media_license_id' },
//				  { label: 'Mask Media ID', value: 'mask_media_id' },
//				  { label: 'Media Label', value: 'media_label' },
//				  { label: 'Label Value', value: 'label_value' },
//				  { label: 'Keywords', value: 'keywords' },
//				  { label: 'Last Date', value: 'lastdate' }
//
//				 
//             ];
//
//            $("#jqxlistbox2").jqxListBox({ source: listSource, width: 200, height: 200, theme: theme, checkboxes: true });
//	        $("#jqxlistbox2").jqxListBox('checkAll');
//            $("#jqxlistbox2").on('checkChange', function (event) {
//                $("#jqxgrid").jqxGrid('beginupdate');
//                if (event.args.checked) {
//                    $("#jqxgrid").jqxGrid('showcolumn', event.args.value);
//                }
//                else {
//                    $("#jqxgrid").jqxGrid('hidecolumn', event.args.value);
//                }
//                $("#jqxgrid").jqxGrid('endupdate');
//            });
 });
  

