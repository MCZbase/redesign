&nbsp;<br>
<footer class="footer">
    <div class="fixed-bottom bg-inverse">
    <cfif cgi.HTTP_HOST contains "harvard.edu" >
        <div class="helplinks-footer"> <a HREF="mailto:bhaley@oeb.harvard.edu">System Administrator</a> <a href="/info/bugs.cfm">Feedback&#8202;/&#8202;Report Errors</a> <a href="/Collections/index.cfm">Data Providers</a> </div>
        <div class="row copyright_background">
            <div class="footer-col-4-md" align="center;"> 
                  
                    <img alt="Harvard Museum of Comparative Zoology Logo" title="Harvard Museum of Comparative Zoology Logo" class="media-element file-default file-os-files-medium" src="https://mczbase-test.rc.fas.harvard.edu/redesign/includes/images/harvard_museum.png">
                    
                    
                    <p class="agreements"> <a href="https://mcz.harvard.edu/privacy-policy" style="color:#215990">Privacy |</a> <a href="https://mcz.harvard.edu/user-agreement" style="color:#215990">User Agreement</a> </p>
                </div>
            </div>
            <div class="logos"> <a href="http://www.gbif.org/"><img src="https://mczbase-test.rc.fas.harvard.edu/redesign/includes/images/gbiflogo.png" alt="GBIF" class="gbif_logo"></a> <a href="http://www.idigbio.org/"><img src="/images/idigbio.png" alt="herpnet"></a> <a href="http://eol.org"><img src="/images/eol.png" alt="eol" class="eol_logo"></a> <a href="http://vertnet.org"><img src="/images/vertnet_logo_small.png" alt="Vertnet"></a> <a href="https://arctosdb.org/"><img src="/images/arctos-logo.png" class="arctos_logo" ALT="[ Link to home page. ]"></a>
                <p class="tagline">Delivering Data to the Natural Sciences Community &amp; Beyond</p>
            </div>
        </div>
        </div>
        <div class="branding-container">
          <div class="copyright-bottom" style="text-align: center;">
           Copyright © 2018 The President and Fellows of Harvard College.&nbsp; <a href="http://accessibility.harvard.edu/" style="color: white">Accessibility</a> | <a href="http://www.harvard.edu/reporting-copyright-infringements" style="color: white;">Report Copyright Infringement</a>
           </div>
        </div>
    </cfif>
    </div>
</footer>
<script src="/redesign/includes/js/jquery-3.3.1.js"></script> 
<script src="/redesign/includes/js/jquery-ui-1.12.1.js"></script> 
<script src="/redesign/includes/bootstrap/js/bootstrap.min.js"></script> 
<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"></script>
<script src="/redesign/includes/js/jquery.dataTables.min.js"></script> 
<script src="/redesign/includes/datatables/Responsive-2.2.2/js/dataTables.responsive.min.js"></script>
<script src="/redesign/includes/datatables/Responsive-2.2.2/css/responsive.dataTables.css"></script> 
<script src="/redesign/includes/js/dataTables.jqueryui.min.js"></script> 
<script src="/redesign/includes/js/ajax_datatables.js"></script> 
<script type="text/javascript" charset="utf-8">	
$(document).ready(function() {
    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});

	$('#masonry-container').masonry({
        itemSelector: '.item',
        isAnimated: true // the animated makes the process smooth
});
$(window).resize(function() {
    $('#masonry-container').masonry({
        itemSelector: '.item',
        isAnimated: true
    }, 'reload');
});
	</script>
</body>
</html>