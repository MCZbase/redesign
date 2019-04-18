<cfset pageTitle = "search projects">
<cfinclude template = "/redesign/includes/_header.cfm">
<style>
	#drop-area {
  border: 2px dashed #ccc;
  border-radius: 20px;
  width: 480px;
  font-family: sans-serif;
  margin: 50px auto;
  padding: 30px;
}
#drop-area.highlight {
  border-color: purple;
}
p {
  margin-top: 0;
}
.my-form {
  margin-bottom: 10px;
}
#gallery {
  margin-top: 10px;
}
#gallery img {
  width: 150px;
  margin-bottom: 0;
  margin-right: 10px;
  vertical-align: middle;
}
#dialog-form form label.button1 {
  display: inline-block;
  padding: 5px 10px;
  background: #ccc;
  cursor: pointer;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.button:hover {
  background: #ddd;
}
#fileElem {
  display: none;
}
	</style>
<cfoutput>

    <div class="container-fluid mt-3">
      <div class="row">
            <div class="col-sm-12 col-md-4 col-lg-4 jumbotron" style="padding: 0 4em;">
                    <h2 class="mt-4 mb-1">What's here </h2>
                    <p style="border: none;display: inline;"> These <a href="##" style="color: green;">341645</a> records represent media in MCZbase. The media records can be associated with publications, transactions, and specimens. </p>
               
             </div>
            <div class="col-sm-12 col-md-4 col-lg-4 jumbotron pt-2 px-0 mx-0">
                <form id="searchForm" class="card card-sm" style="border: none;">
                    <h2 class="mt-4 mb-1 mx-1">Search Media Keywords</h2>
                    <div class="card_search row no-gutters align-items-center py-1 mr-4">
                        <div class="col px-0">
                            <input id="searchText" class="form-control form-control-borderless" type="search" placeholder="Search any terms">
                        </div>
                        <div class="col-auto">
                            <button class="btn" style="background: ##BAC5C6;" type="submit"> <i class="fas fa-search text-body"></i></button>
						</div>
                     </div>
			     </form>
              </div>
					
                 <div class="col-lg-4 col-md-4 jumbotron mx-0 px-0 col-sm-12">
                   <h2 class="mt-3 mx-3 w-100 pl-1">Select Usage </h2>
                    <form id="searchForm" style="border: none;">
                      <ul class="check_selection mx-0 mb-1">
						<li><input type="checkbox">Limit to media not yet linked to records?</li>
					   <ul>
					</form>
				 </div>
				 
	    <div class="container-fluid" style="margin-left: 2em;">
                 <div class="row">					
	<div class="mb-3 col-12" style="margin-top:.75em;"> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapseSearch" aria-controls="collapseSearch" style="font-size: 16px;margin-left:2px;"> Additional Search Parameters <i class="fa fa-sort fa-xs"></i></button></div>	
			</div></div>
   <div class="collapse navbar-collapse" id="collapseSearch" style="align-items: left">
        <div class="container">
                 <div class="row">
                  <div class="col-sm-12 col-md-4 col-lg-4 jumbotron mx-0 px-0">		  
						<h2 class="mt-0 mx-3 w-100 pl-1 px-3">Limit to Media Type?</h2>		
						<form id="searchForm" style="border: none;">
                            <ul class="check_selection mx-3 mb-4 px-3">
							  <li><input type="checkbox">Text (html, PDF, or Word Doc) </li>
							  <li><input type="checkbox">Image (.png, .jpg, jpeg, .tiff)<li>
							  <li><input type="checkbox">Video (.avi, .mp4,)</li>
							  <li><input type="checkbox">Audio (.mpeg)</li>
							  <li><input type="checkbox">Model (.vrml, .pdf)</li>
							  <li><input type="checkbox">Application (.pdf, .vnd.ms-excel, .zip)</li>
							<ul>
						</form>	
					</div>
              
                
                     
            <div class="col-sm-12 col-md-8 col-lg-8 jumbotron mx-0 px-0">
                <h2 class="mt-0 mx-3 w-100 pl-1">Select Media Relationships</h2>	
               <div class="" id="" style="align-items: left">
                   <!---advanced search dropdown table below--->
                   <script>
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
                   <form id="searchForm">
            <div id="POItablediv" class="" style="background-color: none;">
                <table class="table responsive-table" id="POITable" border="1" style="width:100%;border-collapse:separate !important; line-height:24px; font-weight:100;margin-bottom: 1.25em;border-radius:5px;" class="bodywrapcenter">
				<tbody>
                    <tr class="first_row">
                        <td style="display: none;">##</td>
                        <td>and/or/not</td>
                        <td>&nbsp;&nbsp;keyword</td>
                        <td>contains/is</td>
                        <td>&nbsp;&nbsp;value</td>
                        <td>&nbsp;&nbsp;delete?</td>
                    </tr>
                    <tr style="padding:.5em;border: 1px solid ##bac5c6;border-radius: 5px;">
                        <td style="display: none;">1</td>
                        <td class="mx-1 p-0 border-0"><select title="operator" class="custom-select" style="min-width: 6em;">
                                <option value="and">and</option>
                                <option value="or">or</option>
                                <option value="not">not</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0">
                               <select title="keyword" id="sciNameOper" class="custom-select" style="min-width: 14em;margin-right: 10px;">
                                <option value="taxonomy">Taxonomy</option>
                                <option>Places</option>
                                <option>Media</option>
                                <option>Publications</option>
                                <option>Projects</option>
                                <option>Specimens</option>
                                <option>Dates</option>
                                <option>Parts</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><select title="operator" id="sciNameOper" class="custom-select" style="min-width: 8em;">
                                <option value="like">contains</option>
                                <option value="eq">is</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search" id="key_value" placeholder="Enter Value" style="margin-left:0; margin-right:0;margin-right: 0; "/></td>
                         <td class="mx-0 p-0 border-0 hello">
                        <input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" style="display:inline;"/></td>
                         <td class="mx-0 p-0 border-0">
                        <input type="submit" id="searchText" value="SEARCH" class="text-right has-clear" style="display: inline"/>
                        </td>
                    </tr>
					</tbody>
                </table>
            </div>
        </form>
               </div>
						
                <h2 class="mt-0 mx-3 w-100 pl-1">Select Media Labels</h2>	
               <div class=""  style="align-items: left">
                   <!---advanced search dropdown table below--->
                   <script>
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
                   <form id="searchForm">
            <div id="POItablediv" class="" style="background-color: none;">
                <table class="table responsive-table" id="POITable" border="1" style="width:100%;border-collapse:separate !important; line-height:24px; font-weight:100;margin-bottom: 1.25em;border-radius:5px;" class="bodywrapcenter">
				<tbody>
                    <tr class="first_row">
                        <td style="display: none;">##</td>
                        <td>and/or/not</td>
                        <td>&nbsp;&nbsp;keyword</td>
                        <td>contains/is</td>
                        <td>&nbsp;&nbsp;value</td>
                        <td>&nbsp;&nbsp;delete?</td>
                    </tr>
                    <tr style="padding:.5em;border: 1px solid ##bac5c6;border-radius: 5px;">
                        <td style="display: none;">1</td>
                        <td class="mx-1 p-0 border-0"><select title="operator" class="custom-select" style="min-width: 6em;">
                                <option value="and">and</option>
                                <option value="or">or</option>
                                <option value="not">not</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0">
                               <select title="keyword" id="sciNameOper" class="custom-select" style="min-width: 14em;margin-right: 10px;">
                                <option value="taxonomy">Taxonomy</option>
                                <option>Places</option>
                                <option>Media</option>
                                <option>Publications</option>
                                <option>Projects</option>
                                <option>Specimens</option>
                                <option>Dates</option>
                                <option>Parts</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><select title="operator" id="sciNameOper" class="custom-select" style="min-width: 8em;">
                                <option value="like">contains</option>
                                <option value="eq">is</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search" id="key_value" placeholder="Enter Value" style="margin-left:0; margin-right:0;margin-right: 0; "/></td>
                         <td class="mx-0 p-0 border-0 hello">
                        <input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" style="display:inline;"/></td>
                         <td class="mx-0 p-0 border-0">
                        <input type="submit" id="searchText" value="SEARCH" class="text-right has-clear" style="display: inline"/>
                        </td>
                    </tr>
					</tbody>
                </table>
            </div>
        </form>
               </div>
			</div>
							</div></div>

				  </div>
						</div>
						</div>
   
    <div class="container-fluid">
        <div class="row">
            <div class="text-left col-lg-12">
                <main role="main">
                    <div class="px-4 w-100 mb-5 mt-3">

 
 <h3 style="width: 150px;float: left;">Media</h3>  
         <cfquery name="getTaxa"	 datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
			select full_taxon_name, taxon_name_id, phylclass, phylorder, family, genus, species from taxonomy	
		</cfquery>
         <!--- <button type="button" id="add-taxonomy" class="detail-edit-cell" onClick="$('##dialog-form').dialog('open');">Add New</button>--->           
            
            
            
            
  <div id="dialog-form" title="Add Media" style="display: none;z-index: 350"> 
    
     
<div id="drop-area">
  <form class="my-form">
    <p>Upload multiple files with the file dialog or by dragging and dropping images onto the dashed region</p>
    <input type="file" id="fileElem" multiple accept="image/*" onchange="handleFiles(this.files)">
    <label class="button1" for="fileElem">Select some files</label>
	</form>
  <progress id="progress-bar" max=100 value=0></progress>
  <div id="gallery" /></div>
  
	<div class="collapse navbar-collapse" id="collapseSearch" style="align-items: left">
<!---advanced search dropdown table below--->
<script>
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
        <form id="searchForm">
            <div id="POItablediv" class="" style="background-color: none;">
                <table class="table responsive-table" id="POITable" border="1" style="width:100%;border-collapse:separate !important; line-height:24px; font-weight:100;margin-bottom: 1.25em;border-radius:5px;" class="bodywrapcenter">
				<tbody>
                    <tr class="first_row">
                        <td style="display: none;">##</td>
                        <td>and/or/not</td>
                        <td>&nbsp;&nbsp;keyword</td>
                        <td>contains/is</td>
                        <td>&nbsp;&nbsp;value</td>
                        <td>&nbsp;&nbsp;delete?</td>
                    </tr>
                    <tr style="padding:.5em;border: 1px solid ##bac5c6;border-radius: 5px;">
                        <td style="display: none;">1</td>
                        <td class="mx-1 p-0 border-0"><select title="operator" class="custom-select" style="min-width: 6em;">
                                <option value="and">and</option>
                                <option value="or">or</option>
                                <option value="not">not</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0">
                               <select title="keyword" id="sciNameOper" class="custom-select" style="min-width: 14em;margin-right: 10px;">
                                <option value="taxonomy">Taxonomy</option>
                                <option>Places</option>
                                <option>Media</option>
                                <option>Publications</option>
                                <option>Projects</option>
                                <option>Specimens</option>
                                <option>Dates</option>
                                <option>Parts</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><select title="operator" id="sciNameOper" class="custom-select" style="min-width: 8em;">
                                <option value="like">contains</option>
                                <option value="eq">is</option>
                            </select></td>
                        <td class="mx-1 p-0 border-0"><input type="text" class="text_search form-control flex enter-search" id="key_value" placeholder="Enter Value" style="margin-left:0; margin-right:0;margin-right: 0; "/></td>
                         <td class="mx-0 p-0 border-0 hello">
                        <input type="button" id="delPOIbutton" value="ADD ROW" onclick="insRow()" style="display:inline;"/></td>
                         <td class="mx-0 p-0 border-0">
                        <input type="submit" id="searchText" value="SEARCH" class="text-right has-clear" style="display: inline"/>
                        </td>
                    </tr>
					</tbody>
                </table>
            </div>
        </form>
    </div>
  
</div>   
            
       </form>            
              
                 
  </div>
                  <ul>
                      <li id="showLeftPush" class="active searchfield">
                           <i class="fas fa-columns"></i>
                      </li>
                      &nbsp; 
                       <li class="searchfield">
                         <a href="##" style="color: black;">
                          <i class="fas fa-download" ></i>
                          </a>
							</li>
                      
                      <li class="searchfield">
                      <a href="##" id="add-taxonomy" class="detail-edit-cell" onClick="$('##dialog-form').dialog('open');" style="color: black;">
                      <i class="fas fa-plus-circle" style="font-size: 1em;" ></i>
						  </a>
                       </ul>
                        <div class="row" style="clear:both;">
                            <div id="jqxgrid" class="jqxGrid">
                                <div id="grid"></div>
        				    </div>

                            </div>
                        </div>
                    </div>
                </main>
            </div>
       
		  </div></div>
     <script>	
//////////////////////
  $(function(){ 
    function saveEdits() {
    }
 	var screenWidth, screenHeight, dialogWidth, dialogHeight, isDesktop;
    screenWidth = window.screen.width;
    screenHeight = window.screen.height;
    if ( screenWidth < 1599 ) {
		dialogWidth = '90%';
        dialogHeight = 'auto';
		 isDesktop = false;
    } else if ( screenWidth > 1600  ){
        dialogWidth = '40%';
       dialogHeight = 'auto'
        isDesktop = true;
    }
    dialog = $( "##dialog-form" ).dialog({
      autoOpen: false,
      width: dialogWidth,
	  height: dialogHeight,
      maxWidth: 800,
	  fluid: true,
      modal: true,
	  resizable: true,
      buttons: {
            "1": { id: 'save', text: 'Save', click: function(){ $(this).dialog("save"); }, "class": "save_local" },
            "2": { id: 'close', text: 'Cancel', click: function(){ $(this).dialog("close"); }, "class": "cancel_bk"}
            }
    });
	form = dialog.find( "form" ).on( "submit", function( event ) {
           event.preventDefault();
           saveEdits();
		// $(window).off("resize.responsive");
    });
    $( "##add-taxonomy" ).button().on( "click", function() {
           dialog.dialog( "open" );
		   fluidDialog();
    });
	function fluidDialog() {
    var $visible = $(".ui-dialog:visible");
    // each open dialog
    $visible.each(function () {
        var $this = $(this);
        var dialog = $this.find(".ui-dialog-content").data("dialog");
    //  console.log(dialog);
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
	
// ************************ Drag and drop ***************** //
let dropArea = document.getElementById("drop-area")

// Prevent default drag behaviors
;['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
  dropArea.addEventListener(eventName, preventDefaults, false)   
  document.body.addEventListener(eventName, preventDefaults, false)
})

// Highlight drop area when item is dragged over it
;['dragenter', 'dragover'].forEach(eventName => {
  dropArea.addEventListener(eventName, highlight, false)
})

;['dragleave', 'drop'].forEach(eventName => {
  dropArea.addEventListener(eventName, unhighlight, false)
})

// Handle dropped files
dropArea.addEventListener('drop', handleDrop, false)

function preventDefaults (e) {
  e.preventDefault()
  e.stopPropagation()
}

function highlight(e) {
  dropArea.classList.add('highlight')
}

function unhighlight(e) {
  dropArea.classList.remove('active')
}

function handleDrop(e) {
  var dt = e.dataTransfer
  var files = dt.files

  handleFiles(files)
}

let uploadProgress = []
let progressBar = document.getElementById('progress-bar')

function initializeProgress(numFiles) {
  progressBar.value = 0
  uploadProgress = []

  for(let i = numFiles; i > 0; i--) {
    uploadProgress.push(0)
  }
}

function updateProgress(fileNumber, percent) {
  uploadProgress[fileNumber] = percent
  let total = uploadProgress.reduce((tot, curr) => tot + curr, 0) / uploadProgress.length
  console.debug('update', fileNumber, percent, total)
  progressBar.value = total
}

function handleFiles(files) {
  files = [...files]
  initializeProgress(files.length)
  files.forEach(uploadFile)
  files.forEach(previewFile)
}

function previewFile(file) {
  let reader = new FileReader()
  reader.readAsDataURL(file)
  reader.onloadend = function() {
    let img = document.createElement('img')
    img.src = reader.result
    document.getElementById('gallery').appendChild(img)
  }
}

function uploadFile(file, i) {
  var url = 'https://res.cloudinary.com/mcztesting/image/upload/'
  var xhr = new XMLHttpRequest()
  var formData = new FormData()
  xhr.open('POST', url, true)
  xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest')

  // Update progress (can be used to show progress indicator)
  xhr.upload.addEventListener("progress", function(e) {
    updateProgress(i, (e.loaded * 100.0 / e.total) || 100)
  })

  xhr.addEventListener('readystatechange', function(e) {
    if (xhr.readyState == 4 && xhr.status == 200) {
      updateProgress(i, 100) // <- Add this
    }
    else if (xhr.readyState == 4 && xhr.status != 200) {
      // Error. Inform the user
    }
  })

  formData.append('upload_preset', 'jmhufdmm')
  formData.append('file', file)
  xhr.send(formData)
}
</script>  
    <script>
////  below searches with keyword to return results which are then filtered
//// see ajax.js to see code that fills table with initial page load results
		////  $(document).ready(function() {
          //      $('##searchForm').bind('submit', function(evt){
//				console.log($('##searchText').val());
//				var searchParam = $('##searchText').val();
//				$('##searchText').jqxGrid('showloadelement');
//				$("##jqxgrid").jqxGrid('clearfilters');
//				var taxasearch =
//				{
//					datatype: "json",
//					datafields:
//					[
//	                { name: 'taxon_name_id', type: 'string' },
//					{ name: 'scientific_name', type: 'string'},
//					{ name: 'phylclass', type: 'string' },
//					{ name: 'suborder', type: 'string' },
//                    { name: 'family', type: 'string' },
//                    { name: 'subfamily', type: 'string' },
//                    { name: 'genus', type: 'string' },
//                    { name: 'species', type: 'string' },
//					{ name: 'valid_catalog_term_fg', type: 'string'},
//					{ name: 'source_authority', type: 'string'},
//					{ name: 'author_text', type: 'string' },
//                    { name: 'tribe', type: 'string' },
//                    { name: 'infraspecific_rank', type: 'string' },
//                    { name: 'taxon_remarks', type: 'string' },
//					{ name: 'phylum', type: 'string'},
//					{ name: 'kingdom', type: 'string'},
//					{ name: 'nomenclatural_code', type: 'string'}
//					],
//					root: 'specimenRecord',
//					id: 'taxon_name_id',
//
//					url: '/redesign/taxonomy-related/component/taxa-records_search.cfc?method=getDataTable&searchText='+ searchParam,
//					async: false
//				}
//				var dataAdapter = new $.jqx.dataAdapter(search, {
//				       beforeLoadEvent: function (){},
//                       downloadComplete: function (data, status, xhr) {},
//                       loadComplete: function (data) { },
//                       loadError: function (xhr, status, error) { },
//			    });
//			$("##jqxgrid").jqxGrid({source: dataAdapter});
//	
//			evt.preventDefault();	
//
//	  		// create buttons, listbox and the columns chooser dropdownlist.
//            // create buttons, listbox and the columns chooser dropdownlist.
//	        // create buttons, listbox and the columns chooser dropdownlist.
//            $("##applyfilter").jqxButton({ theme: theme });
//            $("##clearfilter").jqxButton({ theme: theme });
//			
//            $("##filterbox").jqxListBox({ checkboxes: true,  width: 280, height: 250 });
//            $("##columnchooser").jqxDropDownList({ autoDropDownHeight: true, selectedIndex: 0,  width: 200, height: 25,
//                source: [ 
//				  { label: 'Scientific Name', value: 'scientific_name' },
//				  { label: 'Class', value: 'phylclass' },
//				  { label: 'Suborder', value: 'suborder' },
//                  { label: 'Family', value: 'family' },
//                  { label: 'Subfamily', value: 'subfamily' },
//                  { label: 'Genus', value: 'genus' },
//                  { label: 'Species', value: 'species' },
//				  {	label: 'Taxon Name ID', value: 'taxon_name_id' },
//				  { label: 'Valid for Catalog?', value: 'valid_catalog_term_fg', width: 50},
//				  { label: 'Source Authority', value: 'souce_authority',width: 200},
//				  { label: 'Author Text', value: 'author_text', width: 200},
//				  { label: 'Tribe', value: 'tribe', width: 150},
//				  { label: 'Infraspecific Rank', value: 'infraspecific_rank', width: 150},
//				  { label: 'Taxon Remarks', value: 'taxon_remarks', width: 150},
//				  { label: 'Phylum', value: 'phylum', width: 150},
//				  { label: 'Kingdom', value: 'kingdom', width: 150},
//				  { label: 'Nomenclatural Code', value: 'nomenclatural_code', width: 150}
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
//                $("##filterbox").jqxListBox({ source: uniqueRecords, displayMember: datafield });
//               // $("##filterbox").jqxListBox('checkAll');
//			
//
//            }
//
//            updateFilterBox('phylclass');
//            var handleCheckChange = true;
//            $("##filterbox").on('checkChange', function (event) {
//                if (!handleCheckChange)
//                    return;
//                if (event.args.label != '(Select All)') {
//                    handleCheckChange = false;
//                    $("##filterbox").jqxListBox('checkIndex', 0);
//                    var checkedItems = $("##filterbox").jqxListBox('getCheckedItems');
//                    var items = $("##filterbox").jqxListBox('getItems');
//
//                    if (checkedItems.length == 1) {
//                        $("##filterbox").jqxListBox('uncheckIndex', 0);
//                    }
//                    else if (items.length != checkedItems.length) {
//                        $("##filterbox").jqxListBox('indeterminateIndex', 0);
//                    }
//                    handleCheckChange = true;
//                }
//                else {
//                    handleCheckChange = false;
//                    if (event.args.checked) {
//                        $("##filterbox").jqxListBox('checkAll');
//                    }
//                    else {
//                        $("##filterbox").jqxListBox('uncheckAll');
//                    }
//
//                    handleCheckChange = true;
//                }
//            });
//	         // handle columns selection.
//            $("##columnchooser").on('select', function (event) {
//                updateFilterBox(event.args.item.value);
//            });
//	 
//	 // builds and applies the filter.
//            var applyFilter = function (datafield) {
//                $("##jqxgrid").jqxGrid('clearfilters');
//                var filtertype = 'stringfilter';
//				if (datafield == 'collection_object_id') filtertype = 'numericfilter';
//                var filtergroup = new $.jqx.filter();
//                var checkedItems = $("##filterbox").jqxListBox('getCheckedItems');
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
//                $("##jqxgrid").jqxGrid('addfilter', datafield, filtergroup);
//			
//                $("##jqxgrid").jqxGrid('applyfilters');
//            }
//            $("##clearfilter").click(function (datafield) { 
//				//we added datafield to pass to the function
//                $("##jqxgrid").jqxGrid('clearfilters');
//				$("##filterbox").jqxListBox('uncheckAll');  
//				//we added this line to the code
//            });
//            $("##applyfilter").click(function () { 
//                var dataField = $("##columnchooser").jqxDropDownList('getSelectedItem').value;
//                applyFilter(dataField);
//            });
//
//             var listSource = [	   
//				  { label: 'Taxon Name ID', value: 'taxon_name_id' },
//				  { label: 'Scientific Name', value: 'scientific_name'},
//				  { label: 'Phylclass', value: 'phylclass' },
//                  { label: 'Suborder', value: 'suborder' },
//                  { label: 'Family', value: 'family' },
//                  { label: 'Subfamily', value: 'subfamily' },
//                  { label: 'Genus', value: 'genus' },
//				  { label: 'Species',value: 'species'},
//				  { label: 'Valid for Catalog?', value: 'valid_catalog_term_fg'},
//				  { label: 'Source Authority', value: 'souce_authority'},
//				  { label: 'Author Text', value: 'author_text'},
//				  { label: 'Tribe', value: 'tribe'},
//				  { label: 'Infraspecific Rank', value: 'infraspecific_rank'},
//				  { label: 'Taxon Remarks', value: 'taxon_remarks'},
//				  { label: 'Phylum', value: 'phylum'},
//				  { label: 'Kingdom', value: 'kingdom'},
//				  { label: 'Nomenclatural Code', value: 'nomenclatural_code'}
//             ];
//
//            $("##jqxlistbox2").jqxListBox({ source: listSource, width: 200, height: 200, theme: theme, checkboxes: true });
//	        $("##jqxlistbox2").jqxListBox('checkAll');
//            $("##jqxlistbox2").on('checkChange', function (event) {
//                $("##jqxgrid").jqxGrid('beginupdate');
//                if (event.args.checked) {
//                    $("##jqxgrid").jqxGrid('showcolumn', event.args.value);
//                }
//                else {
//                    $("##jqxgrid").jqxGrid('hidecolumn', event.args.value);
//                }
//                $("##jqxgrid").jqxGrid('endupdate');
//            });
// });
//		  });
</script> 
</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">
