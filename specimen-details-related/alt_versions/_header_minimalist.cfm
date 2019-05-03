<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../images/favicon.ico">
<cfoutput><title>#pageTitle#</title></cfoutput>
<script src="/redesign/includes/bootstrap/js/bootstrap.min.js"></script> 
<link href="/redesign/includes/css/bootstrap-4.1.3/dist/css/bootstrap.css" rel="stylesheet">
<link href="/redesign/includes/images/fontawesome/fontawesome-free-5.5.0-web/css/all.css" rel="stylesheet">
<link href="/redesign/includes/JQWidgets/jqwidgets/styles/jqx.base.css" rel="stylesheet">
<!---<link href="/redesign/includes/JQWidgets/jqwidgets/styles/jqx.bootstrap.css" rel="stylesheet">--->

<script type="text/javascript" src="/redesign/includes/images/fontawesome/fontawesome-free-5.5.0-web/js/all.js"></script>
<link href="/redesign/includes/css/jquery-ui.css" rel="stylesheet">

<link href="/redesign/includes/css/custom-datatables.css" rel="stylesheet">

<!--- <script type="text/javascript" src="/redesign/includes/JQWidgets/scripts/jquery-1.11.1.min.js"></script>--->
<script src="/redesign/includes/js/jquery-3.3.1.js"></script> 
<script src="/redesign/includes/js/jquery-ui-1.12.1.js"></script> 
<script src="/redesign/includes/bootstrap/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqx-all.js"></script>
<!---<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxeditor.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.columnsreorder.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.grouping.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxprogressbar.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxpanel.js"></script>--->
<script type="text/javascript" src="/redesign/includes/JQWidgets/scripts/demos.js"></script>
<script src="/redesign/includes/js/ajax.js"></script> 


</head>
<body class="default">
<header>



		<div  class="branding-container clearfix">
		  <div class="branding-left justify-content-start">
	       <a href="http://www.harvard.edu/" >
		       <img src="https://mcz.harvard.edu/profiles/openscholar/themes/hwpi_basetheme/images/harvard-logo.png" width="235" height="32" alt="University Logo" />
		   </a>
		  </div>
		  <div class="branding-right justify-content-end"><a href="http://www.harvard.edu/" >HARVARD.EDU</a></div>		
	</div>

<nav class="navbar justify-content-start navbar-expand-md navbar-expand-sm navbar-dark bg-dark navbar-harvard py-2">
<ul class="nav col-md-3 col-sm-2 pr-0"> 
 <li class="nav-item"><img class="mcz_logo_krono" src="includes/images/mcz_logo_white175.png"></li>

</ul>
  <ul class="navbar col-md-6 mcz-center col-sm-2">
   <li class="nav-item mcz" style="list-style: none;font-family:font-family: -apple-system, system-ui, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;">Museum of Comparative Zoology</li>  
	</ul>
   <ul class="nav justify-content-end col-sm-1 accn-icons col-md-3 col-sm-2 pr-0">
		  <li class="nav-item">
			<a class="nav-link cog" href="#" >
			<i class="fas fa-cog"></i></a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link accounts" href="#"><i class="fas fa-user"></i></a>
		  </li>
      </ul>
<!---    <ul class="nav col-md-2 col-sm-2 pr-0" style="flex:.05;"> 
		<li>
		<a href="/" class="navbar-brand">
		<img src="/redesign/includes/images/harvard_logo_sm3.png" class="harvard-shield" alt="harvard shield"/>
		<span class="ml-1">Harvard University</span>
		</a>
		</li>
	</ul>   

    <ul class="nav justify-content-center mr-auto ml-auto col-sm-8 col-md-9" style="flex: 2.5;">
       <li class="nav-item"><img class="mcz_logo_krono" src="includes/images/mcz_logo_white175.png"></li>
       <li class="nav-item py-2 mcz">Museum of Comparative Zoology</li>
	</ul>
    <ul class="nav justify-content-end col-sm-2 col-md-2 pr-0" style="flex: .75;">
		
		  <li class="nav-item">
			<a class="nav-link cog" href="#" >
			<i class="fas fa-cog"></i></a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link accounts" href="#"><i class="fas fa-user"></i></a>
		  </li>
      </ul>   --->
</nav>


<nav class="navbar navbar-expand-md navbar-light bg-light py-1" style="border-bottom: 1px solid #f1f1f1;">
   <div class="container">
    <button class="navbar-toggler"  type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon" style="width: 1em; height: 1em;padding: 1pxpx 3px;"></span> </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <ul class="navbar-nav nav-fill w-100">
            <li class="nav-item dropdown active"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Search</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Specimens</a> <a class="dropdown-item" href="#">Media</a> <a class="dropdown-item" href="#">Places</a> <a class="dropdown-item" href="#">Publications</a> <a class="dropdown-item" href="#">Projects</a> <a class="dropdown-item" href="#">Taxonomy</a></div>
            </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Data Entry </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Enter Single Records</a> <a class="dropdown-item" href="#">Bulkload Records</a> <a class="dropdown-item" href="#">Bulkload Builder</a> <a class="dropdown-item" href="#">Browse and Edit</a> <a class="dropdown-item" href="#">Bulkloader Status</a> <a class="dropdown-item" href="#">More Bulkloaders</a></div>
            </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manage Data </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Manage Agents</a> <a class="dropdown-item" href="#">Manage Location</a> <a class="dropdown-item" href="#">Manage Storage</a> <a class="dropdown-item" href="#">Manage Media</a> <a class="dropdown-item" href="#">Manage Publications</a> <!---<a class="dropdown-item" href="#">Tools</a>--->
                <a class="dropdown-item" href="#">Manage Encumbrances</a>  </div>
            </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Transactions </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Accessions</a> <a class="dropdown-item" href="#">Deaccessions</a> <a class="dropdown-item" href="#">Borrows</a> <a class="dropdown-item" href="#">Loans</a> <a class="dropdown-item" href="#">Permits</a> </div>
            </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Reports </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">  <a class="dropdown-item" href="#">Annual Report</a> <a class="dropdown-item" href="#">Labels</a> <a class="dropdown-item" href="#">Data Cleaning</a> <a class="dropdown-item" href="#">Shared Data</a> <a class="dropdown-item" href="#">Statistics</a> </div>
            </li>
            <li class="nav-item"> <a class="nav-link" href="#">Help</a> </li>
        </ul>
    </div>
	</div>
</nav>



</header>