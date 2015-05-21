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

		  <div data-enhance="false"  id="us_header">
		  </div>
                  <div data-enhance="false"  id="us_title"></div>
                  <div data-enhance="false"  id="usage_show_div">
			   <div data-enhance="false"  id="usage_navbar" class="horizon_center_align">
				     <div data-enhance="false"  id="nav_1" class="selected"></div>
				     <div data-enhance="false"  id="nav_2"></div>
				     <div data-enhance="false"  id="nav_3"></div>
				     <div data-enhance="false"  id="nav_4"></div>
			   </div>
                  </div>
           </div>

         <script>
                 
                    var currStep = 1;
                    function changeStep(nextStep){
                       $("#nav_"+currStep).removeClass("selected");
                       $("#nav_"+nextStep).addClass("selected");
                       $("#usage_show_div").css({"background":"url('/static/mobile/images/usage_"+nextStep+".png') no-repeat center center"});
                       currStep = nextStep;
                    }
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


