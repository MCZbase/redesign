 $(document).ready(function () {  
	 
        var divElement = document.getElementById('viz1555509433495');                    
	    var vizElement = divElement.getElementsByTagName('object')[0];                   
	         if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} 
	         else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} 
	         else { vizElement.style.width='400px';vizElement.style.height='1200px';}                    
	    var scriptElement = document.createElement('script');                    
	    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    
	    vizElement.parentNode.insertBefore(scriptElement, vizElement);               

             
         
//	 
//	         var divElement = document.getElementById('viz1555509433495');                    
//	    var vizElement = divElement.getElementsByTagName('object')[0];                   
//	         if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} 
//	         else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} 
//	         else { vizElement.style.width='1014px';vizElement.style.height='827px';}                    
//	    var scriptElement = document.createElement('script');                    
//	    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    
//	    vizElement.parentNode.insertBefore(scriptElement, vizElement);    
	 
	 
	 
});





  