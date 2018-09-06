<cfinclude template = "/redesign/includes/_header.cfm">
<body>
<cfquery name="getCount" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	select count(collection_object_id) as cnt from cataloged_item
</cfquery>

<main role="main">
    <div class="album py-5 bg-light">
    <div class="container">
    <section class="jumbotron text-center">
        <h1 class="jumbotron-heading" style="font-variant: small-caps;">Museum of Comparative Zoology</h1>
		<h4 style="font-size: 16px; font-variant: small-caps;margin-top: -1em;margin-bottom: 3em;">Search Our Collections</h4>
		    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item1"> <a class="nav-link fonty" href="#tab1_kws" role="tab" data-toggle="tab">Keyword Search</a> </li>
        <li class="nav-item1"> <a class="nav-link fonty" href="#tab2_s2c" role="tab" data-toggle="tab">Complex Search </a> </li>
        <li class="nav-item1"> <a class="nav-link fonty" href="#tab3_qb" role="tab" data-toggle="tab">Query Builder</a> </li>
        <li class="nav-item1"> <a class="nav-link fonty" href="#tab4_ba" role="tab" data-toggle="tab">Browse All </a> </li>
    </ul>
       <div class="tab-content">
        <div role="tabpanel" class="tab-pane fadein active" id="start">
            <p class="lead text-muted">The Museum of Comparative Zoology was founded in 1859 on the concept that collections are an integral and fundamental component of zoological research and teaching. This more than 150-year-old commitment remains a strong and proud tradition for the MCZ. The present-day MCZ contains over 21-million specimens in collections which comprise one of the world's richest and most varied resources for studying the diversity of life. </p>
            <cfoutput>
                <p>Access to #getCount.cnt# records.</p>
            </cfoutput>
        </div>


           <div role="tabpanel" class="tab-pane fade" id="tab1_kws">
            <form class="form-inline" name='myForm' method="post" action="keyword-search-results.cfm">
                <div class="fields simple_search">
                    <input style="padding: 1em;width: 100%;margin-top: 3em;" type="text" class="form-control mb-2 mr-sm-2" placeholder="type keyword" name="someText" id="searchParam" value="">
                    <div class="form-check mb-2 mr-sm-2" style="float: right;margin-top: 1em;">
                        <label class="form-check-label" style="margin-left: 1em;">
                            <input class="form-check-input" type="checkbox">
                            Require Media </label>
                        <button type="submit" class="btn btn-primary mb-2" style="margin-left: 1em;text-align:right;">Submit</button>
                    </div>
                </div>
            </form>
        </div>


            <div role="tabpanel" class="tab-pane fade" id="tab2_s2c" style="background-color: white;padding-top:17px;">
            <div class="container" style="padding-bottom: 2em;margin-bottom: 2em;">
                <!--Search Accordion wrapper-->
                <div class="accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <h4>Record Identifiers</h4>
                        <div class="top-field">
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="catalog number" id="catalog-number">
                        </div>
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="trigger collapsed"> more record identifiers </a> </h5>
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
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="scientific name (or any name in higher taxonomy)" id="scientific_name">
                        </div>
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="trigger collapsed"> more ID and taxonomy </a> </h5>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="fields">
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
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="place name" id="locality">
                        </div>
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree" class="trigger collapsed"> more locality fields </a> </h5>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <div class="fields">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="continent or ocean" id="continent_ocean">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="country" id="country">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="island group" id="island_group">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="island" id="island">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="geology attribute" id="geology_attribute">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="geology attribute value" id="geology_att_value">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="traverse geology hierarchies" id="traverse_geology_hierarchy">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <h4>Collecting Event</h4>
                        <div class="fields">
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="collector or date collected" id="collector_date">
                        </div>
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger collapsed"> more collecting event fields </a> </h5>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                <div class="fields">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="collected on or after" id="collected_on_after">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="collected on or before" id="collected_on_before">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="verbatim date" id="verbatim_date">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="chronological extent" id="chrono_extent">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="collecting source" id="collecting_source">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="verbatim locality" id="verbatim_locality">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <h4>Biological Individual</h4>
                        <div class="fields">
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="part name" id="part_name">
                        </div>
                        <div class="panel-heading" role="tab" id="headingFive">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive" class="trigger collapsed"> more biological attribute fields </a> </h5>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                            <div class="panel-body">
                                <div class="fields">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="preserve method" id="preserve_method">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="relationship" id="relationship">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="derived relationship" id="derived_relations">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="part attribute" id="part_attribute">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <h4>Specimen Usage</h4>
                        <div class="fields">
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="basis of citation" id="basis_of_citation">
                        </div>
                        <div class="panel-heading" role="tab" id="headingSix">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseSix" aria-expanded="true" aria-controls="collapseSix" class="trigger collapsed"> more usage fields </a> </h5>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                            <div class="panel-body">
                                <div class="fields">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="media type" id="media_type">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="contributed by project" id="contributed_by_project">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="used by project" id="used_by_project">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="project sponsor" id="project_sponsor">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <h4>Curatorial</h4>
                        <div class="fields">
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="barcode" id="barcode">
                        </div>
                        <div class="panel-heading" role="tab" id="headingSeven">
                            <h5 class="panel-title"> <a role="button" data-toggle="collapse" href="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven" class="trigger collapsed"> more curatorial fields </a> </h5>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                            <div class="panel-body">
                                <div class="fields">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="unique identifier" id="unique_id">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="loan number" id="loan_number">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="permit issued by" id="permit_issued_by">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="permit issued to" id="permit_issued_to">
                                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="permit number" id="permit_number">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="tab3_qb">
            <div id="builder" style="width: 100%; background-color: white;"><img src="includes/images/jquery_builder_demo.PNG" alt="placeholder for jquery builder"/></div>
        </div>

         <div role="tabpanel" class="tab-pane" id="tab4_ba" style="background-color: white;overflow: hidden;">
            <pre id=result> </pre>
            <div class="flowers-wrap"  style="margin-left: 2em;font-size:12px;">
                <h3 style="font-size:14px; font-weight:normal;">Collectors</h3>
                <p style="font-size:12px;"><strong>Filter records by collector:</strong></p>
 <form>
    <div class="checkbox">
     <label for="c1">Fred Parker <input type="checkbox" name="fl-colour" value="fred-parker" id="fred-parker"></label>
    </div>
  <div class="checkbox">
  <label for="c2">Stephan G. Tilley <input type="checkbox" name="fl-colour" value="alexander-agassiz" id="alexander-agassiz"></label>
  </div>
  <div class="checkbox">
    <label for="c3">Ernest E. Williams <input type="checkbox" name="fl-colour" value="samuel-henshaw" id="samuel-henshaw"></label>
  </div>

	 <div class="checkbox">
    <label for="c4">James Draper Lazell Jr. <input type="checkbox" name="fl-colour" value="thomas-barbour" id="thomas-barbour"></label>
  </div>

   <div class="checkbox">
    <label for="c5">Stephan P. Cover <input type="checkbox" name="fl-colour" value="alred-romer" id="alred-romer" ></label>
  </div>

     <div class="checkbox">
    <label for="c6">David Lubertazzi <input type="checkbox" name="fl-colour" value="ernst-mayr" id="ernst-mayr" ></label>
  </div>

   <div class="checkbox">
    <label for="c7">James K. Wetterer <input type="checkbox" name="fl-colour" value="aw-compton" id="awcompton"></label>
  </div>

  <div class="checkbox">
    <label for="c8">Gary D. Alpert <input type="checkbox" name="fl-colour" value="james-mccarthy" id="james-mccarthy"></label>
  </div>
  <div class="checkbox">
    <label for="c8">William Morton Wheeler
 <input type="checkbox" name="fl-colour" value="james-hanken" id="james-hanken"></label>
  </div>
   <div class="checkbox">
    <label for="c8">R. Stiles <input type="checkbox" name="fl-colour" value="john-power" id="john-power"></label>
  </div>
   <div class="checkbox">
    <label for="c9">R. Stiles <input type="checkbox" name="fl-colour" value="john-power" id="john-power"></label>
  </div>
</form>
      <div class="flowers-wrap">
    <h3 style="font-size:14px; font-weight:normal;text-align:center;margin-top: 1em;width: 185px;">Dates</h3>
    <p style="font-size:12px;width: 200px"><strong>Filter records by collection date:</strong></p>
 <form>
  <div class="checkbox">
    <label for="c8">prior to 1900 <input type="checkbox" name="fl-colour" value="prior-1900" id="prior-1900"></label>
  </div>

  <div class="checkbox">
    <label for="c8">1900-1950 <input type="checkbox" name="fl-colour" value="1900-1950" id="1900-1950"></label>
  </div>

<div class="checkbox">
    <label for="c8"> 1951-2000 <input type="checkbox" name="fl-colour" value="1951-2000" id="1951-2000"></label>
  </div>

    <div class="checkbox">
    <label for="c8"> 2001-2009 <input type="checkbox" name="fl-colour" value="2001-2009" id="2001-2009"></label>
  </div>
  <div class="checkbox">
    <label for="c8">  2010-present <input type="checkbox" name="fl-colour" value=" 2010-present" id=" 2010-present"></label>
					</div>
</form>
            </div>
			 </div>
            <div class="continents-wrap">
                <h3 style="font-size:14px; font-weight:normal;">Available Continents</h3>
                  <p style="font-size:12px;"><strong>Filter records by continents:</strong></p>
                <div class="continents" style="font-size:12px;">
                   <div class="checkbox">
    <label for="cc1">Africa <input type="checkbox" name="fl-cont" value="africa" id="africa"></label>
  </div>
  <div class="checkbox">
    <label for="cc2">Europe <input type="checkbox" name="fl-cont" value="europe" id="europe"></label>
  </div>

  <div class="checkbox">
    <label for="cc3">Asia <input type="checkbox" name="fl-cont" value="asia" id="asia"></label>
  </div>
  <div class="checkbox">
    <label for="cc4">North America <input type="checkbox" name="fl-cont" value="north-america" id="north-america"></label>
  </div>
   <div class="checkbox">
    <label for="cc4">South America <input type="checkbox" name="fl-cont" value="south-america" id="south-america"></label>
  </div>
  <div class="checkbox">
    <label for="cc4">Antarctica <input type="checkbox" name="fl-cont" value="antarctica" id="antarctica"></label>
  </div>
       <div class="checkbox">
    <label for="cc4">Oceania <input type="checkbox" name="fl-cont" value="oceania" id="oceania"></label>
  </div>

	<div class="continents-wrap">
			<h3 style="font-size:14px; font-weight:normal;">citations/media</h3></div>          

                </div>
            </div>
            <div class="flowers">
                <div class="flower" data-id="aloe" data-category="fred-parker oceania medium africa">Scincidae</div>
                <div class="flower" data-id="lavendar" data-category="purple green medium africa europe">Lavender</div>
                <div class="flower" data-id="stinging-nettle" data-category="green large africa europe asia">Stinging Nettle</div>
                <div class="flower" data-id="gorse" data-category="green yellow large europe">Gorse</div>
                <div class="flower" data-id="hemp" data-category="green large asia">Hemp</div>
                <div class="flower" data-id="titan-arum" data-category="purple other giant asia">Titan Arum</div>
                <div class="flower" data-id="golden-wattle" data-category="green yellow large australasia">Golden Wattle</div>
                <div class="flower" data-id="purple-prairie-clover" data-category="purple green other medium north-america">Purple Prairie Clover</div>
                <div class="flower" data-id="camellia" data-category="pink other large north-america">Camellia</div>
                <div class="flower" data-id="scarlet-carnation" data-category="red medium north-america">Scarlet Carnation</div>
                <div class="flower" data-id="indian-paintbrush" data-category="red medium north-america">Indian Paintbrush</div>
                <div class="flower" data-id="moss-verbena" data-category="purple other small south-america">Moss Verbena</div>
                <div class="flower" data-id="climbing-dayflower" data-category="blue tiny south-america">Climbing Dayflower</div>
                <div class="flower" data-id="antarctic-pearlwort" data-category="green yellow large antarctica">Antarctic Pearlwort</div>
            </div>



		</div>
   </section>


	</div>
	</div>
</main>

<cfinclude template="/redesign/includes/_footer.cfm">
