<cfset pageTitle = "New Specimen Search Page/Home Page">
<cfinclude template = "/redesign/includes/_header.cfm">

	<style>
	.ui-panel-closed {
    visibility: visible !important;  
    width: 100px !important; 
    left: 160px !important;
    overflow: visible !important;
}

.ui-content {
    padding: 0 15px 15px 15px !important;
}

#tick-button {
    position: absolute;
    top: 100px;
    right: -27px;    
    width: 25px;
    height: 100px;
    margin: 0 0 !important;
    border-radius: 0 1em 1em 0;
}
#tick-button .ui-btn-inner {
    padding: 0 0 !important;
    height: 100% !important;
    font:10px 'Courier New', 'Verdana',serif;     
    line-height: 100px;
    color: #555;
    text-shadow: 1px 1px #fff;   
}
	</style>

<body>




        <div data-role="page" id="index">
            <div data-theme="b" data-role="header">              
                <h1>Index page</h1>
            </div>

            <div data-role="content">

            </div>

            <div data-role="panel" id="left-panel" data-display="overlay" data-position="left" data-theme="c">
                <img src="/redesign/includes/images/Amber_Orchid_Bee_nsf3.jpg" /><!-- click here to open the panel -->
                <nav id="indice">
                    <!-- content here -->
                </nav>
                <div data-role="button" id="tick-button">>></div>                
            </div>            
        </div>  
        	<script>
		$(document).on('pagebeforeshow', '#index', function(){ 
    $(document).on('click tap', '#tick-button', function(){ 
        $("#left-panel").panel( "open");       
    });      
});
	</script>
<cfinclude template="/redesign/includes/_footer.cfm">