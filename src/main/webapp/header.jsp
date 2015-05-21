
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
<link rel="stylesheet" href="/static/header.css" />
<link rel="stylesheet" type="text/css" href="/static/tooltipster.css" />
<script type="text/javascript" src="/static/lib.js"></script>
<script type="text/javascript" src="/static/jquery.tooltipster.min.js"></script>
<div id="header">
    
     <div id="app_title"></div>
     <div id="menuBar" class="center_align">
            <div id="menu_1">
                   <div style="position:relative;">
			   <div class="menu_icon icon-01"></div>
	           </div>
            </div>
			 <div class="menu_split"></div>
            <div id="menu_2">
                   <div style="position:relative;">
                   <div class="menu_icon icon-02"></div>
                   </div>
            </div>
			 <div class="menu_split"></div>
            <div id="menu_3">
                   <div style="position:relative;">
                   <div class="menu_icon icon-03"></div>
                   </div>
            </div>
			 <div class="menu_split"></div>
            <div id="menu_4">
                   <div style="position:relative;">
                   <div class="menu_icon icon-04"></div>
                   </div>
            </div>
			 <div class="menu_split"></div>
            <div id="menu_5">
                   <div style="position:relative;">
                   <div class="menu_icon icon-05"></div>
                   </div>
            </div>
			 <div class="menu_split"></div>
            <div id="menu_6">
                   <div style="position:relative;">
                   <div class="menu_icon icon-06"></div>
                   </div>
            </div>
            <div style="clear:both;"></div>
     </div>
     <div id="header_rightToolBar">
          <div id="header_register_b"></div>
          <div id="header_login_b"></div>
          <div id="header_web_b"></div>
     </div>
</div>
<script> 
   
   $( function() {
		   if(currMenu !="menu_1") {
			    //add spec view to the main content, if not the index.jsp
			    $("#header").addClass("bottomShadow");
			    var headerHeight = $("#header").height();
			    headerHeight -=60;
			    $("#header").height(headerHeight);
			    var mainTop = $("#main").css("top");
			    mainTop = mainTop.replace("px","");
			    mainTop = mainTop - 60;
			    $("#main").css({"top":mainTop+"px"});
			    var appTitleTop = $("#app_title").css("top");
			    appTitleTop = appTitleTop.replace("px","");
			    appTitleTop = appTitleTop - 40;
			    $("#app_title").css({"top":appTitleTop + "px"});
                            $("#header_web_b").css({"display":"none"});
                             
		   }
	     $("[id^=menu_]").each(function(){
                        console.log("hello"+$(this).attr("id"));
                   if($(this).attr("id")!=currMenu) {
			   $(".menu_icon",$(this)).hover(
				    function(){
					$(this).addClass("menu_selected");
				     },
				    function(){
					$(this).removeClass("menu_selected");
				     }
			   );
                   } else {
			   $(".menu_icon",$(this)).addClass("menu_selected");
                   }
	     });;
	     $("#menu_1").click(function(){
		 console.log("menu_1");
		 window.location = "index.jsp";
	     });
	     $("#menu_2").click(function(){
		 console.log("menu_2");
		 window.location = "feature.jsp";
	     });
	     $("#menu_3").click(function(){
		 console.log("menu_3");
		 window.location = "appshow.jsp";
	     });
	     $("#menu_4").click(function(){
		 console.log("menu_4");
		 window.location = "usage.jsp";
	     });
	     $("#menu_5").click(function(){
		 console.log("menu_5");
		 window.location = "route.jsp";
	     });
	     $("#menu_6").click(function(){
		 console.log("menu_6");
		 window.location = "interest.jsp";
	     });
  });
</script>
