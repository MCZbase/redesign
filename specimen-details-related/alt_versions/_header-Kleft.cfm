<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../images/favicon.ico">
<cfoutput>
    <title>#pageTitle#</title>
</cfoutput>
<!---<script src="/redesign/includes/bootstrap/js/bootstrap.min.js"></script>--->
<link href="/redesign/includes/css/bootstrap-4.1.3/dist/css/bootstrap.css" rel="stylesheet">
<link href="/redesign/includes/images/fontawesome/fontawesome-free-5.5.0-web/css/all.css" rel="stylesheet">
<link href="/redesign/includes/JQWidgets/jqwidgets/styles/jqx.base.css" rel="stylesheet">
<script type="text/javascript" src="/redesign/includes/images/fontawesome/fontawesome-free-5.5.0-web/js/all.js"></script>
<link rel="stylesheet" href="/redesign/includes/js/jquery.mobile-1.4.5.min.css" />
<script src="/redesign/includes/js/jquery.mobile-1.3.1.min.js"></script>  
<link href="/redesign/includes/css/jquery-ui.css" rel="stylesheet">
<link href="/redesign/includes/css/custom-datatables.css" rel="stylesheet">
<script src="/redesign/includes/js/jquery-3.3.1.js"></script>
<script src="/redesign/includes/js/jquery-ui-1.12.1.js"></script>
<script src="/redesign/includes/bootstrap/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.grouping.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/scripts/demos.js"></script>
<script src="/redesign/includes/js/ajax.js"></script>
<script type="text/javascript">
  $(document).on('pagebeforeshow', '#index', function(){ 
    $(document).on('click tap', '#showRightPush', function(){ 
        $("#cbp-spmenu-s2").panel( "open");       
    });      
});
</script>
</head>
<body class="default cbp-spmenu-push">

<header>
    <div class="branding-container clearfix">
        <div class="branding-left justify-content-start"> <a href="http://www.harvard.edu/" > <img src="https://mcz.harvard.edu/profiles/openscholar/themes/hwpi_basetheme/images/harvard-logo.png" width="235" height="32" alt="University Logo" /> </a> </div>
        <div class="branding-right justify-content-end"> <a href="http://www.harvard.edu/" >HARVARD.EDU</a> </div>
    </div>
    <nav class="navbar justify-content-start navbar-expand-md navbar-expand-sm navbar-harvard pt-2 pb-1" style="background-color: #a51c30;margin-block-end:0px;">
        <ul class="nav col-lg-3 col-md-4 col-sm-6">
           <div class="mcz_logo">
            <li class="nav-item"><img class="mcz_logo_krono" src="includes/images/mcz_logo_white175.png" width="160"></li>
            <li class="nav-item mcz2">Museum of Comparative Zoology</li>
			</div>
        </ul>
        <ul class="navbar col-lg-6 col-md-8 mcz-center col-sm-6 pt-0 pb-0 mb-1">
            <li class="nav-item mczbase">MCZbase: Database of Zoological Collections</li>
        </ul>
    </nav>
    <nav class="navbar navbar-expand-md navbar-light bg-light py-0" style="border-bottom: 1px solid #f1f1f1;">
        <div class="container" style="padding: 5px;">
            <button class="navbar-toggler" style="z-index:4000;" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav nav-fill w-100">
                    <li class="nav-item dropdown active"> <a class="nav-link dropdown-toggle" href="https://mczbase-dev.rc.fas.harvard.edu/redesign/specimen-search.cfm" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Search</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Specimens</a> <a class="dropdown-item" href="#">Media</a> <a class="dropdown-item" href="#">Places</a> <a class="dropdown-item" href="#">Publications</a> <a class="dropdown-item" href="#">Projects</a> <a class="dropdown-item" href="#">Taxonomy</a></div>
                    </li>
                    <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Data Entry </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Enter Single Records</a> <a class="dropdown-item" href="#">Bulkload Records</a> <a class="dropdown-item" href="#">Bulkload Builder</a> <a class="dropdown-item" href="#">Browse and Edit</a> <a class="dropdown-item" href="#">Bulkloader Status</a> <a class="dropdown-item" href="#">More Bulkloaders</a></div>
                    </li>
                    <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manage Data </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Manage Agents</a> <a class="dropdown-item" href="#">Manage Location</a> <a class="dropdown-item" href="#">Manage Storage</a> <a class="dropdown-item" href="#">Manage Media</a> <a class="dropdown-item" href="#">Manage Publications</a> <!---<a class="dropdown-item" href="#">Tools</a>---> 
                            <a class="dropdown-item" href="#">Manage Encumbrances</a> </div>
                    </li>
                    <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Transactions </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Accessions</a> <a class="dropdown-item" href="#">Deaccessions</a> <a class="dropdown-item" href="#">Borrows</a> <a class="dropdown-item" href="#">Loans</a> <a class="dropdown-item" href="#">Permits</a> </div>
                    </li>
                    <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Reports </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Annual Report</a> <a class="dropdown-item" href="#">Labels</a> <a class="dropdown-item" href="#">Data Cleaning</a> <a class="dropdown-item" href="#">Shared Data</a> <a class="dropdown-item" href="#">Statistics</a> </div>
                    </li>
                    <li class="nav-item"> <a class="nav-link" href="#">Help</a> </li>
                </ul>
            </div>
        </div>
        <ul class="nav justify-content-end col-sm-2 accn-icons col-md-1 pt-1">
            <li class="nav-item"> <a class="nav-link cog" href="#settings" > <i class="fas fa-cog" style="color: #666;"></i> </a> </li>
            <li class="nav-item"> <a class="nav-link accounts" href="#account"> <i class="fas fa-user" style="color:#666;"></i> </a> </li>
        </ul>
    </nav>
</header>
