<cfset pageTitle = "search">
<cfinclude template = "/redesign/includes/_header.cfm">

<cfoutput>
    <script type="text/javascript">
  
    </script>
</head>
<body class='default class="cbp-spmenu-push cbp-spmenu-push-toleft"'>
<!---    <div id="loading">
        <div id="jqxProgressBar">
        </div>
    </div>--->

<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">

	<h3>Filters</h3>
		<div class="col-md-3 jumbotron" style="margin-bottom: 3em;padding-left:1em;">
			<h2>Filter Records</h2>

				<div style="float: left;">
					<div>Choose Column:</div>
					<div id="columnchooser"></div>
					<div style="margin-top: 10px;" id="filterbox"></div>
					<div style="margin-top: 10px;">
						<input type="button" id="applyfilter" value="Apply Filter" style="display: inline;"/>
						<input type="button" id="clearfilter" value="Clear Filter" style="display: inline;width: auto;"/>
					</div>
				</div>
				
		<!---
            <div style="float: left;margin-top: 3em;">
                Event Log:
                <div style="border: none;" id="events"> </div>
            </div>--->
        </div>
</nav>
<!-- Class "cbp-spmenu-open" gets applied to menu and "cbp-spmenu-push-toleft" or "cbp-spmenu-push-toright" to the body -->
<!---<div class="container">
	<div class="main">

		<section class="buttonset">
				
			<button id="showRightPush">Show/Hide Right Push Menu</button>
		</section>
	</div>
</div>--->
<cfquery name="getCount" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cfid)#">
	select count(collection_object_id) as cnt from cataloged_item
</cfquery>
<div class="container">
    <br/>
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8 jumbotron">
                            <form id="searchForm" class="card card-sm" style="border: none;">
                               <h2 class="mt-2 mb-1 mx-5">Search Our Collections  <span class="rec_count mx-1">(access to #getCount.cnt# records)</span></h2>
                                <div class="card-body row no-gutters align-items-center py-1">
                                    <div class="col-auto">
                                       
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        <input id="searchText" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search keywords">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg" style="background: ##BAC5C6;" type="submit"> <i class="fas fa-search text-body"></i></button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
                        </div>
                        <!--end of col-->
                    </div>
</div>
<div class="container-fluid">
<div class="row">
    <!---<div class="jumbotron text-left col-md-12">
    <div class="">
              
            <div class="input-group col-md-12">
               <form  class="mx-0" style="width: 94%;">
                <input type="text" name="searchText"  class="form-control border border-right-0" placeholder="Search..." style="float:left;width: 100%;">
                <span class="input-group-append">
                <button class="btn btn-outline-secondary border" id="Search" type="submit">
                    <i class="fa fa-search"></i>
                </button>
                </span>
				</form>
            </div>
		</div>
	</div>--->
		<div class="jumbotron text-left col-md-12">
		 <main role="main">
		   <div style="padding: 0 1em;margin-bottom: 3em;width: 100% !important;">
			   <h3>All Records 	</h3>	
		<button class="btn" id="showRightPush">Show/Hide Filters</button>
				<!-- Class "cbp-spmenu-open" gets applied to menu and "cbp-spmenu-push-toleft" or "cbp-spmenu-push-toright" to the body -->
		
	
			  <div class="row">
				<div id="jqxgrid" class="jqxGrid"> </div>
			
			  </div>
		   </div>
		  </main>
		</div>

		
	</div>
 </div>
 <script>

		  $(document).ready(function() {
			 
			$('##searchForm').bind('submit', function(evt){
				console.log($('##searchText').val());
				var searchParam = $('##searchText').val();

				var search =
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

					url: '/redesign/component/records.cfc?method=getDataTable&searchText='+ searchParam,
					async: false
				}
				 $('##jqxgrid').jqxGrid('source', search);

				  evt.preventDefault();	

			  });
			  
		  });

</script>
</cfoutput>
<cfinclude template="/redesign/includes/_footer.cfm">