<cfset pageTitle = "specimens search form builder">
<cfinclude template = "/redesign/includes/_header.cfm">
<script type="text/javascript" src="/redesign/specimen-details-related/js/searchBuilder.js"></script>
<style>
/*
    Basscss v6.0.1
    Low-level CSS toolkit
    http://basscss.com
*/
input, select, textarea, fieldset {
	font-size: .89rem;
	margin-top: 0;
	margin-bottom: 0;
}
input[type=text], input[type=datetime], input[type=datetime-local], input[type=email], input[type=month], input[type=number], input[type=password], input[type=search], input[type=tel], input[type=time], input[type=url], input[type=week] {
	box-sizing: border-box;
	height: 1.25rem;
	padding: .25rem .25rem;
	vertical-align: middle;
	-webkit-appearance: none;
}
select {
	box-sizing: border-box;
	line-height: 1.75;
	padding: .25rem .25rem;
}
select:not([multiple]) {
	height: 1.25rem;
	vertical-align: middle;
}
.fieldset-reset {
	padding: 0;
	margin-left: 0;
	margin-right: 0;
	border: 0;
}
.fieldset-reset legend {
	padding: 0;
}
:root {
}
button, .button {
	font-size: inherit;
	font-weight: bold;
	text-decoration: none;
	cursor: pointer;
	display: inline-block;
	box-sizing: border-box;
	line-height: 1.125rem;
	padding: .35rem .75rem;
	margin: 0;
	height: auto;
	border: 1px solid transparent;
	vertical-align: middle;
	-webkit-appearance: none;
}
button::after, button::before, .button::after, .button::before {
	box-sizing: border-box;
}

::-moz-focus-inner {
 border: 0;
 padding: 0;
}
.button:hover {
	text-decoration: none
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
	font-weight: bold;
	line-height: 1.25;
	margin-top: 1em;
	margin-bottom: .5em;
}
p, dl, ol, ul {
	font-size: .87rem;
	margin-top: 0;
	margin-bottom: 1rem;
}
h1, .h1 {
	font-size: 2rem
}
h2, .h2 {
	font-size: 1.5rem
}
h3, .h3 {
	font-size: 1.25rem
}
h4, .h4 {
	font-size: 1rem
}
h5, .h5 {
	font-size: .875rem
}
h6, .h6 {
	font-size: .75rem
}
li,li:hover,li:active {cursor:pointer;}
.list-reset {
	list-style: none;
	padding-left: 0;
}
.inline {
	display: inline
}
.block {
	display: block
}
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
.col-right {
	float: right;
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
            <h2 class="h3 mx-4">Create a Specimen Search Form</h2>
            <h2 class="h4 mt-1 mb-3 mx-4" style="font-variant: normal; font-size: 14px;">Drag search form fields (rectangles below) to the top three rectangles in the order you would like to see them (3 columns). The selected fields will appear under the default fields:  "Catalog Numbers," "Other IDs," "Any Taxonomy," and "Any Geography" on the search page. Refresh page to empty form.</h2>
            <div class="col col-md-4 col-sm-12 mb-3">
                <ul class="p-2 js-sortable-copy-target js-sortable border-blue-gray rounded sortable-top list flex flex-column list-reset" style="min-height: 40px;">
                </ul>
            </div>
            <div class="col col-md-4 col-sm-12 mb-3">
                <ul class="p-2 js-sortable-copy-target js-sortable border-blue-gray rounded sortable-top list flex flex-column list-reset" style="min-height: 40px;">
                </ul>
            </div>
            <div class="col col-md-4 col-sm-12 mb-3">
                <ul class="p-2 border-blue-gray js-sortable-copy-target js-sortable rounded sortable-top list flex flex-column list-reset" style="min-height: 40px;">
                </ul>
            </div>
            <div class="form-check col-md-6 col-sm-12" style="clear: both;padding-left: 4em;float:left;">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Check to make custom search appear on search page load.</label>
            </div>
            <span class="input-group-btn rounded" style="float:right;padding-right: 8px;">
            <button class="btn btn-custom blue-gray border-0 js-serialize-button button" type="submit"> Save to Search Page <i class="fa fa-search text-body"></i></button>
            </span> </div>
    </div>
    <div class="p2 bg-navy border-top yellow border-yellow">
        <h5>Serialized:</h5>
        <code>
        <pre class="serialized-content"></pre>
        </code> </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Identifiers</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Other ID Type</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Other ID Value</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Other ID Prefix</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Other ID Suffix</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="accn">Accessions</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Accession Agency</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
            <h4>Taxonomy</h4>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="scientific_name">Scientific Name</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder" id="phylclass">Class</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Genus</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Species</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Subspecies</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Nature of ID</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">Determiner</li>
            <li class="p-1 px-2 mb-1 text-dark bg-light search-form-builder">ID Remarks</li>
        </ul>
    </div>
    <div class="col col-md-3 col-sm-12">
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
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
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
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
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
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
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
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
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
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
        <ul class="mx-4 js-sortable-copy sortable list flex flex-column list-reset">
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
//	const formToJSON = elements => [].reduce.call(elements, (data, element) => {
//
//  data[element.name] = element.value;
//  return data;
//
//}, {});
//
//const handleFormSubmit = event => {
//
//  // Stop the form from submitting since we’re handling that with AJAX.
//  event.preventDefault();
//
//  // Call our function to get the form data.
//  const data = formToJSON(form.elements);
//
//  // Demo only: print the form data onscreen as a formatted JSON object.
//  const dataContainer = document.getElementsByClassName('results__display')[0];
//
//  // Use `JSON.stringify()` to make the output valid, human-readable JSON.
//  dataContainer.textContent = JSON.stringify(data, null, "  ");
//
//  // ...this is where we’d actually do something with the form data...
//};
//
//const form = document.getElementsByClassName('contact-form')[0];
//form.addEventListener('submit', handleFormSubmit);
</script>


<script>
	
			sortable('.js-sortable', {
			forcePlaceholderSize: true,
			placeholderClass: 'mb-1 border',
			hoverClass: '',
              itemSerializer: function (item, container) {
                item.parent = '[parentNode]'
                item.node = '[Node]'
				item.id = ''
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
//		sortable('.js-grid', {
//					forcePlaceholderSize: true,
//					placeholderClass: 'col col-4 border border-maroon'
//				});
//		sortable('.js-sortable-connected', {
//			forcePlaceholderSize: true,
//			connectWith: '.js-connected',
//			handle: '.js-handle',
//			items: 'li',
//			placeholderClass: 'border border-white bg-orange mb1'
//		});
//		sortable('.js-sortable-inner-connected', {
//			forcePlaceholderSize: true,
//			connectWith: 'js-inner-connected',
//			handle: '.js-inner-handle',
//			items: '.item',
//	maxItems: 3,
//			placeholderClass: 'border border-white bg-orange mb1'
//		});
//		document.querySelector('.js-sortable-connected').addEventListener('sortupdate', function(e){
//			console.log('Sortupdate: ', e.detail);
//			console.log('Container: ', e.detail.origin.container, ' -> ', e.detail.destination.container);
//			console.log('Index: '+e.detail.origin.index+' -> '+e.detail.destination.index);
//			console.log('Element Index: '+e.detail.origin.elementIndex+' -> '+e.detail.destination.elementIndex);
//		});
//
//		document.querySelector('.js-sortable-connected').addEventListener('sortstart', function(e){
//			console.log('Sortstart: ', e.detail);
//		});
//
//		document.querySelector('.js-sortable-connected').addEventListener('sortstop', function(e){
//			console.log('Sortstop: ', e.detail);
//		});

		sortable('.js-sortable-buttons', {
			forcePlaceholderSize: true,
			items: 'li',
			placeholderClass: 'border border-white mb1',
      hoverClass: 'bg-yellow'
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
		// JS DISABLED
		document.querySelector('.js-disable').addEventListener('click', function(){
			var $list = document.querySelector('[data-disabled]');
			if ( $list.getAttribute('data-disabled') === 'false' ) {
				this.innerHTML = 'Enable';
				sortable($list, 'disable');
				$list.setAttribute('data-disabled', true);
				$list.classList.add('muted');
			} else {
				this.innerHTML = 'Disable';
				sortable($list, 'enable');
				$list.setAttribute('data-disabled', false);
				$list.classList.remove('muted');
			}
		});

		// Destroy & Init
		document.querySelector('.js-destroy').addEventListener('click', function(){
			sortable('.js-sortable-buttons', 'destroy');
		});
		document.querySelector('.js-init').addEventListener('click', function(){
			sortable('.js-sortable-buttons', {
				forcePlaceholderSize: true,
				items: 'li',
				placeholderClass: 'border border-white mb1'
			});
		});
	</script>
<cfinclude template = "/redesign/includes/_footer.cfm">
