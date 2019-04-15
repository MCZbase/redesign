<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../images/favicon.ico">
<cfoutput><title>#pageTitle#</title>
</cfoutput>
<link href="/redesign/includes/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/redesign/includes/css/bootstrap-multiselect.css" rel="stylesheet">
<link href="/redesign/includes/images/fontawesome/fontawesome-free-5.5.0-web/css/all.css" rel="stylesheet">
<link href="/redesign/includes/JQWidgets/jqwidgets/styles/jqx.base.css" rel="stylesheet">
<link href="/redesign/includes/css/jquery-ui.css" rel="stylesheet">   <!-- needed for dialog box -->
<script type="text/javascript" src="/redesign/includes/images/fontawesome/fontawesome-free-5.5.0-web/js/all.js"></script>
<script type="text/javascript" src="/redesign/includes/js/jquery-mobile/jquery.mobile-1.4.5.min.js"></script>  
<link href="/redesign/includes/css/custom-styles.css" rel="stylesheet">
<script type="text/javascript" src="/redesign/includes/js/jquery-1.7.1.min.js"></script> <!-- needed for dialog box -->
<script type="text/javascript" src="/redesign/includes/js/popper.js"></script>
<script type="text/javascript" src="/redesign/includes/js/jquery-3.3.1.js"></script>	 <!-- needed for dialog box -->
<script type="text/javascript" src="/redesign/includes/js/jquery-ui-1.12.1.js"></script>  <!-- needed for dialog box -->
<!---<script type="text/javascript" src="/redesign/includes/bootstrap/js/bootstrap.min.js"></script> --->
<script type="text/javascript" src="/redesign/includes/js/bootstrap-multiselect.js"></script>
  <link href="/redesign/includes/css/bootstrap-select.min.css" rel="stylesheet">
<script src="/redesign/includes/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/redesign/includes/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>  
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxwindow.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdatetimeinput.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxdate.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxslider.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxpanel.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxcheckbox.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.grouping.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxgrid.aggregates.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxinput.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/jqwidgets/jqxcalendar.js"></script>
<script type="text/javascript" src="/redesign/includes/JQWidgets/scripts/demos.js"></script>
<cfif pageTitle eq 'search specimens'>
<script type="text/javascript" type="text/javascript" src="/redesign/specimen-details-related/js/ajax.js"></script>
<script type="text/javascript" type="text/javascript" src="/redesign/includes/js/shared-scripts.js"></script>
<script type="text/javascript" type="text/javascript" src="/redesign/specimen-details-related/js/responsive_table.js"></script>
<script type="text/javascript" src="/redesign/includes/js/jquery.multiselect.min.js"></script>
<link rel="stylesheet" href="/redesign/includes/js/jquery-ui-1.12.1/jquery-ui.min.css" />
<link rel="stylesheet" href="/redesign/includes/js/jquery.multiselect.css" />
</cfif> 
<cfif pageTitle eq 'search taxonomy'>
<script type="text/javascript" type="text/javascript" src="/redesign/taxonomy-related/js/taxa-ajax.js"></script>
</cfif> 
<cfif pageTitle eq 'search media'>
<script type="text/javascript" type="text/javascript" src="/redesign/media-related/js/media-ajax.js"></script>
</cfif> 
</head>
<body class="default cbp-spmenu-push" >
<header>
    <div class="branding-container clearfix">
        <div class="branding-left justify-content-start"> <a href="http://www.harvard.edu/" > <img src="https://mcz.harvard.edu/profiles/openscholar/themes/hwpi_basetheme/images/harvard-logo.png" width="235" height="32" alt="University Logo" /></a> </div>
        <div class="branding-right justify-content-end"> <a href="http://www.harvard.edu/" >HARVARD.EDU</a> </div>
    </div>
    <nav class="navbar justify-content-start navbar-expand-md navbar-expand-sm navbar-harvard pt-2 pb-1" style="background-color: ##a51c30;margin-block-end:0px;padding: .5rem .25rem .7rem .5rem">
        <ul class="navbar col-lg-9 col-md-8 col-sm-9 pt-0 pb-0 mb-1">
           <li class="nav-item mcz2"><a href="https://www.mcz.harvard.edu/" target="_blank">Museum of Comparative Zoology</a></li>
           <li class="nav-item mczbase"><a href="/redesign/specimen-search.cfm" target="_blank">MCZbase: Database of Zoological Collections</a></li>
        </ul>
        <ul class="navbar col-lg-3 col-md-8 col-sm-3 pt-0 pb-0 mb-1" style="justify-content: flex-end"> 
        <div class="mcz_logo">
        <li class="nav-item" style="list-style: none;align-content: flex-end">
            <a href="https://mcz.harvard.edu"><img class="mcz_logo_krono" src="includes/images/mcz_logo_white_left.png" width="160"></a>
        </li>
			</div>
		</ul>    
    </nav>
    <nav class="navbar navbar-expand-md navbar-light bg-light py-0" style="border-bottom: 1px solid #f1f1f1;">
        <div class="container" style="padding: 5px;">
            <button class="navbar-toggler" style="z-index:4000;" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav nav-fill w-100">
                    <li class="nav-item dropdown active"> <a class="nav-link dropdown-toggle" href="/redesign/specimen-search.cfm" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Specimen Data</a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown"> 
                        <a class="dropdown-item" href="/redesign/specimens.cfm">Specimens</a> 
                        <a class="dropdown-item" href="/redesign/media.cfm">Media</a> 
                        <a class="dropdown-item" href="/redesign/locality.cfm">Places</a> 
                        <a class="dropdown-item" href="/redesign/publications.cfm">Publications</a> 
                        <a class="dropdown-item" href="/redesign/projects.cfm">Projects</a> <a class="dropdown-item" href="/redesign/taxonomy.cfm">Taxonomy</a>
                      </div>
                    </li>
                    <li class="nav-item dropdown"> 
                      <a class="nav-link dropdown-toggle" href="##" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Data Entry </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown"> 
                          <a class="dropdown-item" href="/redesign/data-entry.cfm">Enter Single Records</a> 
                          <a class="dropdown-item" href="/redesign/bulkloader.cfm">Bulkload Records</a> 
                          <a class="dropdown-item" href="/redesign/bulkload-specimens.cfm">Bulkload Builder</a> 
                          <a class="dropdown-item" href="/redesign/bulkloader.cfm">Browse and Edit</a> 
                          <a class="dropdown-item" href="/redesign/bulkloader-status.cfm">Bulkloader Status</a> 
                          <a class="dropdown-item" href="#">More Bulkloaders</a>
                      </div>
                    </li>
                    <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Transactions </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> 
                            <a class="dropdown-item" href="/redesign/accessions.cfm">Accessions</a> 
                            <a class="dropdown-item" href="/redesign/deaccessions.cfm">Deaccessions</a> 
                            <a class="dropdown-item" href="/redesign/borrows.cfm">Borrows</a> 
                            <a class="dropdown-item" href="/redesign/loans.cfm">Loans</a> 
                            <a class="dropdown-item" href="/redesign/permits.cfm;">Permits</a> </div>
                    </li>
                    <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Reports </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"> 
                            <a class="dropdown-item" href="#">Annual Report</a> 
                            <a class="dropdown-item" href="#">Labels</a> 
                            <a class="dropdown-item" href="#">Data Cleaning</a> 
                            <a class="dropdown-item" href="#">Shared Data</a> 
                            <a class="dropdown-item" href="#">Statistics</a> 
                        </div>
                    </li>
                    <li class="nav-item"> 
                         <a class="nav-link" href="https://code.mcz.harvard.edu/wiki/index.php/Main_Page">Help</a> 
                    </li>
                </ul>
            </div>
        </div>
        <ul id="profiles" class="nav justify-content-end col-sm-2 accn-icons col-md-1 pt-1 " style="">
            <li class="nav-item dropdown"> 
                   <a href="#profileSettings" data-toggle="dropdown" role="button">
                      <i class="fas fa-cog" style="color: #666;"></i> 
                 </a> 
            </li>
            <li class="nav-item dropdown"> 
                <a href="#formLogin" data-toggle="dropdown" role="button">
							<i class="fas fa-user"></i> 
						</a>
         
            </li>
        </ul>
    </nav>
       <div class="dropdown-menu" id="formLogin">
                        <div class="row">
                            <div class="container-fluid">
                                <form class="">
                                    <div class="form-group">
                                        <label class="">Username</label>
                                        <input class="form-control" name="username" id="username" type="text" style="margin:0;">
                                    </div>
                                    <div class="form-group">
                                        <label class="">Password</label>
                                        <input class="form-control" name="password" id="password" type="password" style="margin: 0;">
                                        <br class="">
                                    </div>
                                    <button type="submit" id="btnLogin" class="btn btn-success btn-sm">Login</button>
                                    <button type="submit" id="btnLogin" class="btn btn-sm">Cancel</button>
                                    
                                     <button type="submit" id="btnLogin" class="btn btn-primary btn-sm" style="float:right;">Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                     <div class="dropdown-menu" id="profileSettings">
                        <div class="row">
                            <div class="container-fluid">
                                <form class="">
                                    <div class="form-group">
                                        <label class="">Profile</label>
                                        <input class="form-control form-control-sm" name="username" id="username" type="text" style="margin:0;">
                                    </div>
                                    <div class="form-group">
                                        <label class="">Change Password</label>
                                        <input class="form-control form-control-sm" name="password" id="password" type="password" style="margin: 0;">
                                        <br class="">
                                    </div>
                                    <button type="submit" id="btnLogin" class="btn btn-sm btn-secondary">Save</button>
                                    <button type="submit" id="btnLogin" class="btn btn-sm">Cancel</button>
                                    
                                    
                                </form>
                            </div>
                        </div>
                    </div>
</header>
