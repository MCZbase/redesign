 <footer class="footer" style="margin-left:0;bottom:0 !important">
                <div class="fixed-bottom bg-inverse">
                    <cfif cgi.HTTP_HOST contains "harvard.edu" >
                        <div class="helplinks" ><a HREF="mailto:bhaley@oeb.harvard.edu">System Administrator</a> <a href="/info/bugs.cfm">Feedback&#8202;/&#8202;Report Errors</a> <a href="/Collections/index.cfm">Data Providers</a> </div>
                       <div class="logos" style="padding-top: 0;">
                           <div align="center" style="padding:.75em 0 0 0;background-color:#BAC5C6"><img src="includes/images/harvard_logo_footer.png" class="harvard_logo"/></div>
                        <div class="copyright">
                       <!-- <p class="copyright_c" style="margin-bottom:.25em;font-size: 14px;padding: 0 2em;color: #1e1e1e;">Database content: &copy; Copyright 2017
                            President and Fellows of Harvard College</p>-->
                        <a href="http://www.mcz.harvard.edu/privacy/index.html" style="display: inline;">Privacy Statement</a> <span>|</span> <a href="http://www.mcz.harvard.edu/privacy/user_agreement.html">User Agreement</a> </div>
                             <a href="http://www.gbif.org/"><img src="/images/gbiflogo.png" alt="GBIF" class="gbif_logo"></a> <a href="http://www.idigbio.org/"><img src="/images/idigbio.png" alt="herpnet"></a> <a href="http://eol.org"><img src="/images/eol.png" alt="eol" class="eol_logo"></a>
                             <a href="http://vertnet.org"><img src="/images/vertnet_logo_small.png" alt="Vertnet"></a>
                             <a href="https://arctosdb.org/"><img src="/images/arctos-logo.png" class="arctos_logo" ALT="[ Link to home page. ]"></a>
                            <p class="tagline">Delivering Data to the Natural Sciences Community &amp; Beyond</p>
                        </div>
                    </cfif>
                  </div>
            </footer>


<script src="/redesign/includes/js/jquery.min.js"></script>
<!--<script src="/redesign/includes/js/jquery-3.3.1.js"></script>
<script src="/redesign/includes/js/jquery-1.12.4.js"></script>-->
<script src="/redesign/includes/js/jquery-ui-1.12.1.js"></script>
<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<!--  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
<!--<script type="text/javascript" language="javascript" src="/redesign/includes/js/bootstrap.min.js"></script>-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript" src="/redesign/includes/js/accordion.js"></script>
<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script type="text/javascript" language="javascript" src="/redesign/includes/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="/redesign/includes/js/dataTables.jqueryui.min.js"></script>
<script type="text/javascript" language="javascript" src="/redesign/includes/js/dataTables.searchPane.js"></script>
<script type="text/javascript" language="javascript" src="/redesign/includes/js/query-builder.standalone.min.js"></script>

<script type="text/javascript" charset="utf-8">

	
// needed for results pages
if ( $.fn.dataTable.isDataTable( '#example' ) ) {
    table = $('#example').DataTable({
	    searchPane: {
            container: '.searchPanes'
					}})
}
else {
    table = $('#example').DataTable( {
        paging: true,
		searchPane: {
            container: '.searchPanes'
					}
    } );
}
// needed for results pages
$(document).ready(function() {
	$(".filter-button").click(function() {
		var value = $(this).attr('data-filter');
		if(value == "all") {
			$('.filter').show('1000');
		} else {        
			 $(".filter").not('.'+value).hide('3000');
			 $('.filter').filter('.'+value).show('3000');
		}
	});

	if ($(".filter-button").removeClass("active")) {
		$(this).removeClass("active");
	}
	$(this).addClass("active");
});
// needed for all pages -- account and login button
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
	
// needed for home page searh tabs
$(document).ready(function() {
    $('.nav-tabs').on('shown.bs.pills', 'a', function(e) {
        console.log(e.relatedTarget);
        if (e.relatedTarget) {
            $(e.relatedTarget).removeClass('active');
        }
    });    
});

$('#accordionGroup').scrollspy({ target: 'dd.Accordion-panel' })
</script>

            <script>
document.addEventListener("DOMContentLoaded", function() {
			
	var $filterCheckboxes = $('input[type="checkbox"]');

$filterCheckboxes.on('change', function() {

  var selectedFilters = {};

  $filterCheckboxes.filter(':checked').each(function() {

    if (!selectedFilters.hasOwnProperty(this.name)) {
      selectedFilters[this.name] = [];
    }

    selectedFilters[this.name].push(this.value);

  });

  // create a collection containing all of the filterable elements
  var $filteredResults = $('.flower');

  // loop over the selected filter name -> (array) values pairs
  $.each(selectedFilters, function(name, filterValues) {

    // filter each .flower element
    $filteredResults = $filteredResults.filter(function() {

      var matched = false,
        currentFilterValues = $(this).data('category').split(' ');

      // loop over each category value in the current .flower's data-category
      $.each(currentFilterValues, function(_, currentFilterValue) {

        // if the current category exists in the selected filters array
        // set matched to true, and stop looping. as we're ORing in each
        // set of filters, we only need to match once

        if ($.inArray(currentFilterValue, filterValues) != -1) {
          matched = true;
          return false;
        }
      });

      // if matched is true the current .flower element is returned
      return matched;

    });
  });

  $('.flower').hide().filter($filteredResults).show();

});

		});
		
		function removeA(arr) {
			var what, a = arguments, L = a.length, ax;
			while (L > 1 && arr.length) {
				what = a[--L];
				while ((ax= arr.indexOf(what)) !== -1) {
					arr.splice(ax, 1);
				}
			}
			return arr;
		}
						   
					   
				</script>

</body>
</html>