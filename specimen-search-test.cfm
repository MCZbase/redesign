<cfinclude template = "/redesign/includes/_header.cfm">

<cfquery name="getCount" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	select count(collection_object_id) as cnt from cataloged_item
</cfquery>
<cfquery name="getCollectors" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	select collectors as colls from flat
</cfquery>
<main role="main" style="clear:both;">
 <div class="album py-5 bg-light" style="min-height: 700px;">
        <div class="container">
  <section class="jumbotron text-center">
        <div class="container">
<h1 class="jumbotron-heading">Search Our Collections</h1>
 <ul class="nav nav-tabs" role="tablist">

  <li class="nav-item">
    <a class="nav-link fonty" href="#buzz" role="tab" data-toggle="tab">Keyword Search</a>
  </li>
  <li class="nav-item">
    <a class="nav-link fonty" href="#references" role="tab" data-toggle="tab">Simple to Complex </a>
  </li>
     <li class="nav-item">
    <a class="nav-link fonty" href="#querybuilder" role="tab" data-toggle="tab">Query Builder</a>
  </li>
    <li class="nav-item">
    <a class="nav-link fonty" href="#profile" role="tab" data-toggle="tab">Browse All </a>
  </li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<div role="tabpanel" class="tab-pane fadein active" id="start"><p class="lead text-muted">The Museum of Comparative Zoology was founded in 1859 on the concept that collections are an integral and fundamental component of zoological research and teaching. This more than 150-year-old commitment remains a strong and proud tradition for the MCZ. The present-day MCZ contains over 21-million specimens in collections which comprise one of the world's richest and most varied resources for studying the diversity of life. </p>
	
<cfoutput>
		<p>Access to #getCount.cnt# records.</p>
		</cfoutput>
	</div>
  <div role="tabpanel" class="tab-pane fade in" id="profile">
	
	<div class="tabs">
		<div class="container">
			<div class="row">
			
				<div class="col-xl-3">
					<ul class="nav nav-pills nav-stacked flex-column">
						<li class="active"><a href="#tab_a" data-toggle="pill">Cryogenic Collections</a></li>
						<li><a href="#tab_b" data-toggle="pill">Entomology</a></li>
						<li><a href="#tab_c" data-toggle="pill">Herpetology</a></li>
						<li><a href="#tab_d" data-toggle="pill">Herpetology Observations</a></li>
						<li><a href="#tab_e" data-toggle="pill">Ichthyology</a></li>
						<li><a href="#tab_f" data-toggle="pill">Invertebrate Paleontology</a></li>
						<li><a href="#tab_g" data-toggle="pill">Invertebrate Zoology</a></li>
						<li><a href="#tab_h" data-toggle="pill">Malacology</a></li>
						<li><a href="#tab_i" data-toggle="pill">Mammalogy</a></li>
						<li><a href="#tab_j" data-toggle="pill">MCZ Collections</a></li>
						<li><a href="#tab_k" data-toggle="pill">Ornithology</a></li>
						<li><a href="#tab_l" data-toggle="pill">Special Collections</a></li>
						<li><a href="#tab_m" data-toggle="pill">Vertebrate Paleontology</a></li>
					</ul>
				</div>
				<div class="col-xl-8">
					<div class="tab-content">
			
						<div class="tab-pane active" id="tab_a">
							<h3>Cryogenic Collection</h3>
							<img src="https://pim-resources.coleparmer.com/item/l/thermo-scientific-nunc-376589-cryotube-vial-holder-03755-71-0375571.jpg"/><br>
							<label>Search Cryogenic Collection</label> <input type="email" class="form-control mb-2 mr-sm-2" placeholder="catalog number" id="email">
							<input type="email" class="form-control mb-2 mr-sm-2" placeholder="container ID" id="email">
					
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
						<div class="tab-pane" id="tab_b">
						<img src="includes/images/acanthoproctus_cervinus_0.jpg" width="300">
							<h3>Entomology</h3>
							<label>Search Entomology</label> <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="email">
							<p>We maintain a reputation for effective communication and collaboration between our 
								team and clients to minimize surprises and ensure precise project delivery. Lorem ipsum 
								dolor sit amet, consectetur adipiscing elit. Aenean euismod 
								bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra 
								justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque 
							penatibus et magnis dis parturient montes.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
						<div class="tab-pane" id="tab_c">
							<h3>Herpetology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
							<div class="tab-pane" id="tab_d">
							<h3>Herpetology Observations</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
						<div class="tab-pane" id="tab_e">
							<h3>Ichthyology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
						<div class="tab-pane" id="tab_f">
							<h3>Invertebrate Paleontology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
						<div class="tab-pane" id="tab_g">
							<h3>Invertebrate Zoology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
						
								<div class="tab-pane" id="tab_h">
							<h3>Malacology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
								<div class="tab-pane" id="tab_i">
							<h3>Mammalogy</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
								<div class="tab-pane" id="tab_j">
							<h3>MCZ Collections</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
									<div class="tab-pane" id="tab_k">
							<h3>Ornithology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
									<div class="tab-pane" id="tab_l">
							<h3>Special Collections</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
									<div class="tab-pane" id="tab_m">
							<h3>Vertebrate Paleontology</h3>
							<p>Thank you for taking the time to consider American Builders Inc. as your general
								contractor for any and all of your commercial, residential, insurance restoration and metal 
								building needs. Please feel free to explore our website, and be sure to click on the
							Facebook link at the bottom of this page and like us on Facebook.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod 
							bibendum laoreet.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>
	<div role="tabpanel" class="tab-pane fade" id="querybuilder">
	<div id="builder"></div>

<script>
  $('#builder').queryBuilder({
    filters: [ {} ]
  });
</script>
	</div>
  <div role="tabpanel" class="tab-pane fade" id="buzz">





 <form class="form-inline" action="/keyword-search-results.cfm">
 <div class="fields" style="margin-bottom: 3em;width: 100%;padding: 1em 2em;margin-top:-1.5em;border: 1px solid white;">
	 <input style="padding: 1em;width: 100%;margin-top: 3em;" type="recordnumber" class="form-control mb-2 mr-sm-2" placeholder="Search taxonomy, location, collector, date" id="cat_num">
<cfoutput>
 #getCollectors.colls#
	 </cfoutput>
  <div class="form-check mb-2 mr-sm-2" style="float: right;margin-top: 1em;">
    <label class="form-check-label" style="margin-left: 1em;">
      <input class="form-check-input" type="checkbox"> Require Media
    </label>
      <button type="submit" class="btn btn-primary mb-2" style="margin-left: 1em;text-align:right;">Submit</button>
  </div>
  
	 </div>

</form>

	</div>
	
	 <!--Advanced Search Tab Panel -- 3rd tab -->
	
  <div role="tabpanel" class="tab-pane fade" id="references" style="background-color: white;padding-top:17px;">
	<div class="container" style="padding-bottom: 2em;margin-bottom: 2em;">
   
   
    <!--Search Accordion wrapper-->
<div class="accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
 <div class="panel panel-default">
 <h4>Record Identifiers</h4>
   <div class="top-field">  
	<input type="email" class="form-control mb-2 mr-sm-2" placeholder="catalog number" id="email"></div>
    <div class="panel-heading" role="tab" id="headingOne">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="trigger collapsed">
		more record identifiers  
        </a>
      </h5>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      <div class="fields">  
		   <input type="text" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="other_id_type">
           <input type="text" class="form-control mb-2 mr-sm-2" placeholder="other identifier number" id="other_id_number">
           <input type="text" class="form-control mb-2 mr-sm-2" placeholder="accession" id="accession">
           <input type="text" class="form-control mb-2 mr-sm-2" placeholder="accession agency" id="accession_agency">
		</div>
      </div>
    </div>
  </div>
   
    <div class="panel panel-default">
		<h4>Specimen Identification and Taxonomy</h4>
     <div class="top-field">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="scientific name (or any name in higher taxonomy)" id="email"></div>
    <div class="panel-heading" role="tab" id="headingTwo">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="trigger collapsed">
          more ID and taxonomy
        </a>
      </h5>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
              <div class="fields">  
		   <input type="text" class="form-control mb-2 mr-sm-2" placeholder="scientific_name" id="scientific_name">
           <input type="text" class="form-control mb-2 mr-sm-2" placeholder="class" id="class">
           <input type="text" class="form-control mb-2 mr-sm-2" placeholder="genus" id="genus">
           <input type="text" class="form-control mb-2 mr-sm-2" placeholder="species" id="species">
 			<input type="text" class="form-control mb-2 mr-sm-2" placeholder="subspecies" id="subspecies">
           </div>
      </div>
    </div>
  </div>
  
     <div class="panel panel-default">
      <h4>Locality</h4>
     <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="place name" id="email"></div>
    <div class="panel-heading" role="tab" id="headingThree">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree" class="trigger collapsed">
        more locality fields
        </a>
      </h5>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
                <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier number" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession agency" id="email">

           </div>
      </div>
    </div>
  </div>
  
       <div class="panel panel-default">
        <h4>Collecting Event</h4>
     <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="collector or date collected" id="email" style="border: 2px solid #ccc;"></div>
    <div class="panel-heading" role="tab" id="headingFour">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger collapsed">
       more collecting event fields
        </a>
      </h5>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
              <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier number" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession agency" id="email">

           </div>
      </div>
    </div>
  </div>
  
  
         <div class="panel panel-default">
         <h4>Biological Individual</h4>
     <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="part name" id="email"></div>
    <div class="panel-heading" role="tab" id="headingFour">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger collapsed">
      more biological attribute fields
        </a>
      </h5>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
              <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier number" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession agency" id="email">

           </div>
      </div>
    </div>
  </div>
  
         <div class="panel panel-default">
           <h4>Specimen Usage</h4>
     <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="basis of citation" id="email"></div>
    <div class="panel-heading" role="tab" id="headingFour">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger collapsed">
        more usage fields
        </a>
      </h5>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
              <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier number" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession" id="email">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession agency" id="email">

           </div>
      </div>
    </div>
  </div>
  
         <div class="panel panel-default">
          <h4>Curatorial</h4>
     <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="catalog number" id="email"></div>
    <div class="panel-heading" role="tab" id="headingFour">
      <h5 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger collapsed">
        more curatorial fields
        </a>
      </h5>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
              <div class="fields">  
		   <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier type" id="otherIdentifierType">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="other identifier number" id="otherIdentifierNumber">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession" id="accession">
           <input type="email" class="form-control mb-2 mr-sm-2" placeholder="accession agency" id="accessionAgency">

           </div>
      </div>
    </div>
  </div>
</div>

  	
  </div>
</div>
        </div>
      </section>

        </div>
      </div>

    </main>
 

<cfinclude template="/redesign/includes/_footer.cfm">
