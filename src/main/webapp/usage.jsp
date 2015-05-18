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
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
	     <div class="center_align" id="usage_show">
		     <div id="usage_navbar" class="vertical_center_align">
			     <div id="nav_1"></div>
			     <div id="nav_2"></div>
			     <div id="nav_3"></div>
			     <div id="nav_4"></div>
		     </div>
             </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
       var prev_step = null;
       $(function(){
            prev_step = $("#nav_1").get(0);
            $("#header").addClass("bottomShadow");
            var headerHeight = $("#header").height();
            headerHeight -=20;
            $("#header").height(headerHeight);
            var mainTop = $("#main").css("top");
            mainTop = mainTop.replace("px","");
            mainTop = mainTop - 20;
            $("#main").css({"top":mainTop+"px"});
            var appTitleTop = $("#app_title").css("top");
            appTitleTop = appTitleTop.replace("px","");
            appTitleTop = appTitleTop - 20;
            $("#app_title").css({"top":appTitleTop + "px"});
	    $("[id^=nav_]").click(function(e){
		    $(prev_step).css({"background-color":"#f0e4cc"});
		    prev_step = e.target;
		    $(prev_step).css({"background-color":"#e5c267"});
		    var id = $(prev_step).attr("id");
		    id = id.replace("nav_","usage");
		    $("#usage_show").css({"background":"url('/static/images/"+id+".png') no-repeat",
			                  "background-size":"1024px 700px",
                                          "background-position":"0px 0px" 
			    });
            });
        });
   </script>
</body>
</html>
