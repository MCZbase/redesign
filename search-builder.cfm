<cfset pageTitle = "search form builder">
<cfinclude template = "/redesign/includes/_header.cfm">
<!---HTML5 sortable  ---   https://github.com/lukasoppermann/html5sortable/blob/master/README.md--->
<script type="text/javascript" src="/redesign/specimen-details-related/js/searchBuilder.js"></script>
<style>

.clearfix:before, .clearfix:after {
	content: " ";
	display: table
}
.clearfix:after {
	clear: both
}
.col {
	float: left;
	box-sizing: border-box;
}
.col-12 {
	width: 100%;
}
.flex {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex
}
.flex-column {
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column
}
</style>
</head>
<body>
<section class="mb-3 mx-auto col col-12 px-0">
   <div class="p-3 clearfix jumbotron text-dark">
        <div class="col col-md-12 col-sm-12 mb-1">
            <h1 class="jumbotron-heading mx-4">Create a Specimen Search Form</h1>
            <h2 class="h4 mt-1 mb-3 mx-4" style="font-variant: normal; font-size: 14px;">Drag search form fields (rectangles in white background below) to the top three rectangles (gray background) in the order you would like to see them. More than one form field can appear in a column. The selected fields will appear under the default fields:  "Catalog Numbers," "Other IDs," "Any Taxonomy," and "Any Geography" on the search page. Refresh page to empty form.</h2>
            <div class="col col-md-3 col-sm-12 mb-3">
                <ul class="p-2 js-sortable-copy-target js-sortable border-blue-gray rounded sortable-top list flex flex-column list-reset" style="min-height: 40px;">
                </ul>
            </div>
            <div class="col col-md-3 col-sm-12 mb-2">
                <ul class="p-2 js-sortable-copy-target js-sortable border-blue-gray rounded sortable-top list flex flex-column list-reset" style="min-height: 40px;">
                </ul>
            </div>
            <div class="col col-md-3 col-sm-12 mb-2">
                <ul class="p-2 border-blue-gray js-sortable-copy-target js-sortable rounded sortable-top list flex flex-column list-reset" style="min-height: 40px;">
                </ul>
            </div>
            
             <div class="col col-md-3 col-sm-12 my-2">
               <span class="input-group-btn rounded" style="float:left;padding-right: 8px;">
            <button class="btn btn-custom blue-gray border-0 js-serialize-button button" type="submit"> Save to Search Page <i class="fa fa-search text-body"></i></button>
            </span>
			</div>
            <div class="form-check col-md-12 col-sm-12" style="clear: both;padding-left: 4em;float:right;">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Check to make custom search appear on search page load.</label>
            </div>
           </div>
    </div>
    <div class="p2 bg-navy yellow border-yellow">
      <div id="serialize">
        <code>
        <pre class="serialized-content"></pre>
        </code> </div>
	</div>
   <div class="pl-5">
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Identifiers</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id ="other_id_type">Other ID Type</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="other_id_value">Other ID Value</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="other_id_prefix">Other ID Prefix</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="other_id_suffix">Other ID Suffix</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="accn">Accessions</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="accession_agency">Accession Agency</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Taxonomy</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="scientific_name">Scientific Name</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="phylclass">Class</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="genus">Genus</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="species">Species</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="subspecies">Subspecies</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="nature_of_id">Nature of ID</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="determiner">Determiner</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="id_remarks">ID Remarks</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Higher Geography</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Continent/Ocean</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Country</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">State/Province</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">USGS Quad Map</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">County</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Island Group</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Island</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Land Feature</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Water Feature</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Collecting Event</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="collectors">Collector/Preparator</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Years Collected</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Collected On or After</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Collected On or Before</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Month</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Verbatim Date</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Collecting Source</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Verbatim Locality</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">General Habitat</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="">Microhabitat</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Specific Locality</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Geology Attribute</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Geology Attribute Value</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Traverse Geology HIerarchies</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Specific Locality</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Elevation</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Depth</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Verification Status</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Maximum Uncertainty</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Biological Individual</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Part Name</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Preserve Method</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Relationship</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Part Attribute</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Part Location</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Part Remarks</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Specimen Attribute</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="ml-2 js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Usage</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Basis of Citation</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Media Type</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Project</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Loans</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Accessions</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Accession Agency</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Item 5</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Item 6</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Curatorial</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Barcode/Unique Container ID</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Loan Number</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Issued By</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Permit Issued To</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Permit Type</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Permit Number</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Part Distribution</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Entered By</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Entered Date</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Last Edited By</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Last Edited Date</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Remarks</li>
        </ul>
    </div>
    </div>
</section>
</div>

<script>
sortable('.js-sortable', {
				  itemSerializer: function (item, container) {
					item.parent = '[parentNode]'
					item.node = '[Node]'
					item.html = item.html.replace('<','&lt;')
					return item
              },
              containerSerializer: function (container) {
                container.node = '[Node]'
                return container
              }
			})
            document.querySelector('.js-serialize-button').addEventListener('click', function () {
              let serialized = sortable('.js-sortable', 'serialize')
              document.querySelector('.serialized-content').innerHTML = JSON.stringify(serialized, null, ' ')
            })

		sortable('.js-sortable-copy', {
		  forcePlaceholderSize: true,
		  copy: true,
		  acceptFrom: false,
		  placeholderClass: 'mb1 bg-navy border border-yellow',
		});
		sortable('.js-sortable-copy-target', {
		forcePlaceholderSize: true,
			acceptFrom: '.js-sortable-copy,.js-sortable-copy-target',
		placeholderClass: 'mb1 border border-maroon',
	  });


		sortable('.js-sortable-buttons', {
			forcePlaceholderSize: true,
			items: 'li'
		});
		// buttons to add items and reload the list
		// separately to showcase issue without reload
		document.querySelector('.js-add-item-button').addEventListener('click', function(){
			doc = new DOMParser().parseFromString(`<li class="p1 mb1 blue bg-white">new item</li>`, "text/html").body.firstChild;
			document.querySelector('.js-sortable-buttons').appendChild(doc);
		});

		document.querySelector('.js-reload').addEventListener('click', function(){
			console.log('Options before re-init:');
			console.log(document.querySelector('.js-sortable-buttons').h5s.data.opts);
			sortable('.js-sortable-buttons');
			console.log('Options after re-init:');
			console.log(document.querySelector('.js-sortable-buttons').h5s.data.opts);
		});

	

	

		</script>
<cfinclude template = "/redesign/includes/_footer.cfm">
