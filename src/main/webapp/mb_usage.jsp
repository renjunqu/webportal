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
                           <div id="usage_container">
				     <div data-enhance="false"  id="usage_1"></div>
				     <div data-enhance="false"  id="usage_2"></div>
				     <div data-enhance="false"  id="usage_3"></div>
				     <div data-enhance="false"  id="usage_4"></div>
                           </div>

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
                    var startChange = false;
                    var lastX = null;
                    function changeStep(nextStep){
                    }
                    $("#usage_show_div").on("touchstart",function(e){
                         console.log("start");
                         startChange = true;
                         lastX = e.originalEvent.targetTouches[0].pageX;
                   });
                    $(document).on('touchmove',function(e){
                          if(startChange) {
                                 var newX = e.originalEvent.targetTouches[0].pageX;
                                 var diffX = newX - lastX;
                                 var currLeft =  $("#usage_container").css("left");
                                 currLeft = currLeft.replace("px","");
                                 currLeft = currLeft - 1;
                                 currLeft = currLeft + diffX +1;
                                 if(currLeft<-1920)
                                     currLeft = -1920;
                                 if(currLeft>0)
                                      currLeft = 0;
                                 $("#usage_container").css({"left":currLeft+"px"});
                                 lastX = newX;

                          }
                    });
                    $(document).on('touchend',function(e){
                           if(startChange) {
                                 startChange = false;
                                 var currLeft =  $("#usage_container").css("left");
                                 currLeft = currLeft.replace("px","");
                                 currLeft = (currLeft - 1) * (-1) + 1;
                                 
                                 var oldLeft = (currStep *640) - 640;
                                 var newStep = currStep;
                                 console.log("curr "+currLeft);
                                 console.log("old "+oldLeft);
                                 if(oldLeft < currLeft) {
                                     if(newStep<4) newStep++;
                                       
                                 } else if(currLeft < oldLeft) {
                                     if(newStep>1) newStep--;
                                 }
                                 if(newStep != currStep) { 
					 $("#nav_"+currStep).removeClass("selected");
					 $("#nav_"+newStep).addClass("selected");
					 currStep = newStep;
                                         var newLeft = newStep * (-640) + 640;
					 //$("#usage_container").css({"left":newLeft+"px"}); 
					 $("#usage_container").animate({"left":newLeft+"px"},"fast"); 
                                 } 
                           }
                    });
                    
        </script>


