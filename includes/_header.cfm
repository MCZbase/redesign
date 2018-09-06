<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../images/favicon.ico">
<title>Specimen Search</title>
<link href="/redesign/includes/css/bootstrap-reboot.css" rel="stylesheet">
<link href="/redesign/includes/css/bootstrap-grid.css" rel="stylesheet">
<link href="/redesign/includes/css/bootstrap.css" rel="stylesheet">
<link href="/redesign/includes/css/custom.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
<link href="/redesign/includes/css/dataTables.jqueryui.min.css" rel="stylesheet">
<link href="/redesign/includes/css/dataTables.searchPane.css" rel="stylesheet">
<link rel="stylesheet" href="/redesign/includes/css/jquery-ui.css">

<style>
  #myScrollspy {
      position: relative;
  }
  dd ul.nav-pills {
      top: 10px;
      position: absolute;
  }
  div.col-8 div {
      height: 500px;
  }
	dd ul.nav-pills
  </style>

</head>

<body>

 <nav class="navbar navbar-toggleable-md fixed-top navbar-inverse bg-inverse">
     <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
		  </button>
      <div class="shield-container">
       <div class="navbar-harvard navbar-toggler-left">
		   <ul><li><img src="/redesign/includes/images/harvard_logo_sm.png" alt="harvard shield"/></li><li>Harvard University</li></ul>
      </div>
	 </div>
      <div class="navbar-brand">
      <a  href="#">
      <img class="navbar-brandK" src="/redesign/includes/images/website_logo_with_text.png"/></a>
	 </div>
      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto" style="text-align: center;">
          <li class="nav-item">
            <a class="nav-link dropdown-toggle" href="/redesign/specimen-search.cfm" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Search</a>
              <div class="dropdown-menu" style="top:94px;" aria-labelledby="dropdown01">
                 <a class="dropdown-item" href="/redesign/specimen-search.cfm">Specimens</a>
                  <a class="dropdown-item" href="/redesign/media-search.cfm">Media</a>
                  <a class="dropdown-item" href="/redesign/locality-search.cfm">Places</a>
                  <a class="dropdown-item" href="/redesign/project-search.cfm">Projects</a>
                  <a class="dropdown-item" href="/redesign/publication-search.cfm">Publications</a>
                  <a class="dropdown-item" href="/redesign/taxonomy-search.cfm">Taxonomy</a>
            </div>
          </li>
              <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Data Entry</a>
                 <div class="dropdown-menu" aria-labelledby="dropdown01">
                      <a class="dropdown-item" href="/redesign/specimen-search.cfm">Enter Specimen Data</a>
                      <a class="dropdown-item" href="/redesign/locality-search.cfm">Bulkloader</a>
                      <a class="dropdown-item" href="/redesign/publication-search.cfm">Batch Tools</a>

                  </div>
          </li>
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manage Data</a>
                  <div class="dropdown-menu" aria-labelledby="dropdown01">
                      <a class="dropdown-item" href="/redesign/specimen-search.cfm">Location</a>
                      <a class="dropdown-item" href="/redesign/media-search.cfm">Agents</a>
                      <a class="dropdown-item" href="/redesign/locality-search.cfm">Object Tracking</a>
                      <a class="dropdown-item" href="/redesign/publication-search.cfm">Media</a>
                      <a class="dropdown-item" href="/redesign/project-search.cfm">Metadata</a>
                      <a class="dropdown-item" href="/redesign/publication-search.cfm">Publications</a>
                      <a class="dropdown-item" href="/redesign/publication-search.cfm">Tools</a>
                      
                      
                  </div>
          </li>
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Transactions</a>
                 <div class="dropdown-menu" aria-labelledby="dropdown01">
                      <a class="dropdown-item" href="/redesign/specimen-search.cfm">Accessions</a>
                      <a class="dropdown-item" href="/redesign/locality-search.cfm">Borrows</a>
                      <a class="dropdown-item" href="/redesign/publication-search.cfm">Deaccessions</a>
                      <a class="dropdown-item" href="/redesign/media-search.cfm">Loans</a>
                      <a class="dropdown-item" href="/redesign/project-search.cfm">Permits</a>
                  </div>
          </li>
                   <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reports</a>
                 <div class="dropdown-menu" aria-labelledby="dropdown01">
                      <a class="dropdown-item" href="/redesign/media-search.cfm">Annual Reports</a>
                      <a class="dropdown-item" href="/redesign/locality-search.cfm">Data Cleaning</a>
                      <a class="dropdown-item" href="/redesign/specimen-search.cfm">Labels</a>
                      <a class="dropdown-item" href="/redesign/project-search.cfm">Shared Data</a>
                      <a class="dropdown-item" href="/redesign/publication-search.cfm">Statistics</a>
                      
                  </div>
          </li>
            <li class="nav-item active">
            <a class="nav-link" href="#">Help</span></a>
          </li>
        </ul>
      </div>
 </nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="top:105px;">
  <button class="navbar-toggler navbar-toggler-right account_head" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <i class="fa .fa-lg fa-user"></i>
	  </button>
  <div class="collapse navbar-collapse positioning" id="navbarNavDropdown">
   	<div class="col-lg-12"  style="height: auto;" id="user-account">
   	<div class="container-fluid">
    	<div class="row">
    	<div class="col-md-2" style="background-color:palegoldenrod">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
						<div class="col-md-12" >
							<a href="#" class="active" id="login-form-link">Login</a>
							or
							<a href="#" id="register-form-link">Register</a>
						</div>
					    </div>
					 </div>
				</div>
				<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form id="login-form1" action="https://phpoll.com/login/process" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="log-username" id="log-username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="log-password" id="log-password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="text-center">
									<!--	<input type="checkbox" tabindex="3" class="" name="log-remember" id="log-remember">
										<label for="remember"> Remember Me</label>-->
									</div>
									<div class="form-group">
									<div class="text-center">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-primary my-2" value="Log In"  style="width: 70%;">
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form3" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="reg-username1" id="reg-username1" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="reg-email1" id="reg-email1" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="reg-password1" id="reg-password1" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password1" id="reg-confirm-password1" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
									<div class="text-center">
												<input type="submit" name="register-submit1" id="register-submit1" tabindex="4" class="form-control btn btn-register my-2" value="Log In"  style="width: 70%;">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
						<div class="col-md-12" >
							<p><strong>Site Profile</strong></p>
						</div>
					    </div>
					 </div>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form id="login-form2" action="https://phpoll.com/login/process" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="first_name" id="first_name" tabindex="1" class="form-control" placeholder="First Name" value="">
									</div>
									<div class="form-group">
										<input type="text" name="last_name" id="last_name" tabindex="2" class="form-control" placeholder="Last Name">
									</div>
									<div class="form-group">
										<input type="text" name="affiliation" id="affiliation" tabindex="2" class="form-control" placeholder="Affiliation">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email_address" tabindex="2" class="form-control" placeholder="Email">
									</div>
								</form>
								<form id="register-form1" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="reg-username" id="reg-username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="reg-email" id="reg-email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="reg-password" id="reg-password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="reg-confirm-password" id="reg-confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
									<div class="text-center">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register my-2" value="Register"  style="width: 70%;">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			<div class="col-md-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
						<div class="col-md-12" >
							<p><strong>Site Settings</strong></p>
						</div>
					    </div>
					 </div>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form id="login-form3" action="https://phpoll.com/login/process" method="post" role="form" style="display: block;">
									<div class="form-group">
									<span>Suggest Browse</span> &nbsp;<select name="block_suggest1" id="block_suggest1" onchange="blockSuggest1(this.value)">
			<option value="0">Allow</option>
			<option value="1" selected="selected">Block</option>
		</select>

									</div>
										<div class="form-group">
									<span>Include Observations</span> &nbsp;<select name="block_suggest2" id="block_suggest2" onchange="blockSuggest2(this.value)">
			<option value="0">Yes</option>
			<option value="1" selected="selected">No</option>
		</select>

									</div>
								<div class="form-group">
									<span>Specimen and Taxonomy Records per page</span> &nbsp;<select name="block_suggest3" id="block_suggest3" onchange="blockSuggest3(this.value)">
			<option value="0">100</option>
			<option value="1" selected="selected">10</option>
		</select>
		</div>
		<div class="form-group">
			<span>Other Identifier</span> &nbsp;<select name="block_suggest4" id="block_suggest4" onchange="blockSuggest4(this.value)">
			<option value="0">Collector Number</option>
			<option value="1" selected="selected">Previous Number</option>
		</select>
						<br/><br/>
							<div class="form-group">
									<div class="text-center">
												<input type="submit" name="save_submit" id="save_submit" tabindex="4" class="form-control btn btn-register my-2" value="Save"  style="width: 70%;">
										</div>
									</div>
								</form>
								<form id="register-form2" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="set_username" id="set_username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="set_email" id="set_email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="set_password" id="set_password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm_password" id="confirm_password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
									<div class="text-center">
												<input type="submit" name="register_submit" id="register_submit" tabindex="4" class="form-control btn btn-register my-2" value="Log In"  style="width: 70%;">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</nav>


