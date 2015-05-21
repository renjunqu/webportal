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
    <link rel="stylesheet" href="/static/mobile/jquery.mobile-1.3.2.min.css">
    <script src="/static/jquery-1.11.3.min.js"></script>
    <script src="/static/mobile/jquery.mobile-1.3.2.min.js"></script>
    <link rel="stylesheet" href="/static/mb_usage.css">
    </header>
<body>
         <div id="mainDiv" style="width:100%;height:100%;">
		  <div id="after_main"></div>
		  <div id="header">
		       <div id="backButton">&lt;</div>
		  </div>
                  <div id="title"></div>
                  <div id="usage_show_div">
			  <div id="usage_show" class="center_align">
			  </div>
			   <div id="usage_navbar" class="horizon_center_align">
				     <div id="nav_1" class="selected"></div>
				     <div id="nav_2"></div>
				     <div id="nav_3"></div>
				     <div id="nav_4"></div>
			   </div>
                  </div>
           </div>

         <script>
                    var currStep = 1;
                    function changeStep(nextStep){
                       $("#nav_"+currStep).removeClass("selected");
                       $("#nav_"+nextStep).addClass("selected");
                       $("#usage_show").css({"background":"url('/static/mobile/images/usage_"+nextStep+".png') no-repeat center center"});
                       currStep = nextStep;
                    }
		    $(document).on("scrollstop",function(){
                         if($(document).scrollTop()==100) {
                           window.location = "mb_interest.jsp";
                        }  
		    });
                    $(document).on('swipeleft',function(){
                          var nextStep = currStep -1 ;
                          if(nextStep==0) nextStep = 4;
                          changeStep(nextStep);
                    });
                    $(document).on('swiperight',function(){
                          var nextStep = currStep +1 ;
                          if(nextStep==5) nextStep = 1;
                          changeStep(nextStep);
                    });

        </script>


</body>
</html>
