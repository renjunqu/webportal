<%--
  Created by IntelliJ IDEA.
  User: qurj
  Date: 15/5/13
  Time: 上午11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page
        import="java.util.*,org.springframework.context.ApplicationContext"%>
<%@ page
        import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <header>
    <script type="text/javascript" src="/static/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="/static/main.css" />
    <link rel="stylesheet" href="/static/usage.css" />
    <title>Soda苏打 - 绿色出行,都市自由移动</title>
    </header>
<body>
     <script>
         var currMenu = "menu_4";
         var currStep = 1;
         var blocking = false;
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
		     <div class="center_align" id="div_usage_show">
                                 <div id="us_container">
				     <div id="usage_1">
				     </div>
				     <div id="usage_2">
				     </div>
				     <div id="usage_3">
				     </div>
				     <div id="usage_4">
				     </div>
                                  </div>
		     </div>
	     <div id="usage_navbar" class="vertical_center_align">
		     <div id="nav_1"></div>
		     <div id="nav_2"></div>
		     <div id="nav_3"></div>
		     <div id="nav_4"></div>
	     </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
       function changeStep(nowStep) { 
              if(blocking==false) {
                      blocking =  true;
		      var prevStep = currStep;
		      currStep = nowStep;
		      var prevStep_id = "nav_" + prevStep;
		      var currStep_id = "nav_" + currStep;
		      $("#"+prevStep_id).css({"background-color":"#f0e4cc"});
		      $("#"+currStep_id).css({"background-color":"#e5c267"});
		      var currTop = (1-currStep) * 700;
		      $("#us_container").animate({"top":currTop+"px"},500,function(){blocking=false;});
              }
       }

       $(function(){
	    $("[id^=nav_]").click(function(e){
		    var id = $(e.target).attr("id");
		    id = parseInt(id.replace("nav_",""));
                    changeStep(id);
            });
        });
        var MOUSE_OVER = false;
	$('body').bind('mousewheel', function(e){
          //console.log("mousewheel");
	  if(MOUSE_OVER){
	    if(e.preventDefault) { e.preventDefault(); } 
	    e.returnValue = false; 
	    return false; 
	  }
	});
	$('#div_usage_show').mouseenter(function(){ MOUSE_OVER=true; });
	$('#div_usage_show').mouseleave(function(){ MOUSE_OVER=false; });

	$('#div_usage_show').bind('mousewheel', function(e){
                      var delta = 0;
		if (!event) /* For IE. */
			event = window.event;
		if (event.wheelDelta) { /* IE/Opera. */
			delta = event.wheelDelta/120;
		} else if (event.detail) { /** Mozilla case. */
			/** In Mozilla, sign of delta is different than in IE.
			 * Also, delta is multiple of 3.
			 */
			delta = -event.detail/3;
		}
                if(delta>0 &&  currStep>1) {
                    changeStep(currStep-1);
               }  else if(currStep < 4) {
                    changeStep(currStep+1);
               }
                
	}); 
   </script>
</body>
</html>
