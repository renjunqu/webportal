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
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
    </header>
<body>
     <script>
         var currMenu = "menu_4";
         var currStep = 1;
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
		     <div class="center_align" id="usage_show">
		     </div>
	     <div id="usage_navbar" class="vertical_center_align">
		     <div id="nav_1"></div>
		     <div id="nav_2"></div>
		     <div id="nav_3"></div>
		     <div id="nav_4"></div>
	     </div>
            <div id="scroll_background"></div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
       var prev_step = null;
       var lastScrollTop = 0;
       function changeStep(nowStep) {
              var prevStep = currStep ;
              console.log(currStep);
              currStep = nowStep;
              console.log(currStep);
              var prevStep_id = "nav_" + prevStep;
              var currStep_id = "nav_" + currStep;
              $("#"+prevStep_id).css({"background-color":"#f0e4cc"});
              $("#"+currStep_id).css({"background-color":"#e5c267"});
              $("#usage_show").css({"background":"url('/static/images/usage"+nowStep+".png') no-repeat",
			                  "background-size":"1024px 700px",
                                          "background-position":"0px 0px" 
	    });
              currStep = currStep - 1;
              currStep = currStep + 1;
  
       }

       $(function(){
            
	    $("[id^=nav_]").click(function(e){
		    var id = $(e.target).attr("id");
		    id = id.replace("nav_","");
                    changeStep(id);
            });
            $("#main").scroll(function(){
                  var sTop = $("#main").scrollTop();
                  var scrollHeight = sTop + $("#main").height();
                  var background_height = $("#scroll_background").height();
                //  console.log("sh1 is "+scrollHeight + " sh2 is "+background_height);
                  if(scrollHeight >= 750 && scrollHeight >= background_height && sTop > lastScrollTop) {
                       var nowStep = ((currStep + 1) > 4) ? 1: currStep+1;
                       changeStep(nowStep);
                      $("#main").animate({ scrollTop: 0 }, "fast");
                  }
                 lastScrollTop = sTop;
            });
        });
   </script>
</body>
</html>
