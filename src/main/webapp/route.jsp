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
    <link rel="stylesheet" href="/static/route.css" />
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
    </header>
<body>
     <script>
         var currMenu = "menu_5";
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
          <div id="topTitle">
		  <div class="center_align">
                  </div>
         </div>
          <div id="mainContent">
		  <div id="inputDiv">
                           <div id="inputContainer">
                                   <div>
					   <div class="selfloc_input_div">
						  <input class="selfloc_input thin_input" type="text" placeholder="我的位置">
						  </input>
                                                  <div class="autobox selfloc_result"></div>
					   </div>
					   <div class="desloc_input_div">
						  <input type="text" class="desloc_input thin_input" placeholder="输入终点">
						  </input>
                                                  <div class="autobox desloc_result"></div>
					   </div>
					   <div class="time_input_div" >
						  <input type="text" class="thin_input" placeholder="出行时间">
						  </input>
					   </div>
                                   </div>
                                   <div id="inputAction" >
                                        <div id="addRoute_div"></div>
                                        <pre>确     定</pre>
                                   </div>
                           </div>
                   </div>
		  <div id="mapDiv">
			  <div id="mapContainer">
			      <div id="couponGet"></div>
                          </div>
		  </div>
                  <div id="bottomTitle"></div>
          </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
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
   </script>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=103e3fae6c781ad2da0587f2b04a2034"></script>
    <script>

                function placeSearch(){
		    var MSearch;
		    AMap.service(["AMap.PlaceSearch"], function() {       
		        MSearch = new AMap.PlaceSearch({ //构造地点查询类
		            pageSize:10,
		            pageIndex:1,
		            city:"021" //城市
		        });
		        //关键字查询
		        MSearch.search('东方明珠', function(status, result){
		        	if(status === 'complete' && result.info === 'OK'){
		        		keywordSearch_CallBack(result);
		        	}
		        }); 
		    });
		}


		function bindAutoSearch(className,autoComplete_callback){
			if (navigator.userAgent.indexOf("MSIE") > 0) {  
				$("."+className).bind("propertychange",function(){
			                         autoSearch(this,autoComplete_callback);	
				});
			}  
			else {  
				$("."+className).bind("input",function(){
			                         autoSearch(this,autoComplete_callback);	
				});
			    
			}  
		}

		function unbindAutoSearch(className){
			if (navigator.userAgent.indexOf("MSIE") > 0) {  
				$("."+className).unbind("propertychange");
	                }  
			else {  
				$("."+className).unbind("input");
			}  
		}

                
               //自己位置输入提示  
		function autoSearch(target,autoComplete_callback) {   
		    var keywords = $(target).val();  
		    if(keywords.length > 0 ) {
		    var auto;    
		    var autoOptions = {  
			pageIndex:1,  
			pageSize:10,  
			city: "0010" //城市，默认全国  
		    };  
		    auto = new AMap.Autocomplete(autoOptions);  
		    //查询成功时返回查询结果  
		    AMap.event.addListener(auto, "complete", autoComplete_callback);  
		    auto.search(keywords);  
		    } else {
			    $(target).next().html("");
			    $(target).next().css({"display":"none"});
		    }
		} 

		function autoCompleteSelfLoc(data){
			//first remove the old tips
			$(".selfloc_result").html("");
			if(data.info == "OK" && data.count > 0 ) {
                             var tips = data.tips;
			     //
			     //add the tips
			     var tipElements = [];
			     tips.forEach(function(tip,index){
			           try {
				   var tElement = "<div id=\"tip"+index+"\" class=\"tip\"><pre>"+tip.name+"  </pre><span style=\"color:#ccc\">"+tip.district+"</span></div>";
				   } catch(e) {
				      console.log(e); 
				   }
			           tipElements.push(tElement);		  
		             });

			     $(".selfloc_result").html(tipElements);
			     $(".selfloc_result").css({"display":"block"});
			     //add this tips object to these elemetn dom
			     tipElements.forEach(function(e,i){
			         	$("#tip"+i).data("tip",tips[i]); 
			     });  
			     $(".tip").click(function(){
			             //$.thisTip = $(this).data("tip");
				     $(this).parent().prev().data("selfloc",$(this).data("tip"));
				     $(this).parent().prev().val($("pre",this).html().trim());
				     //$(this).parent().prev().data("tip",thisTip);
			     	     $(this).parent().html("");
			     	     $(this).parent().css({"display":"none"});
			             //console.log($(this).val()); 
			     });

			} else {
			
			}
		}
		function autoCompleteDesLoc(data){
			//first remove the old tips
			$(".desloc_result").html("");
			if(data.info == "OK" && data.count > 0 ) {
                             var tips = data.tips;
			     //
			     //add the tips
			     var tipElements = [];
			     tips.forEach(function(tip,index){
			           try {
				   var tElement = "<div id=\"dtip"+index+"\" class=\"tip\"><pre>"+tip.name+"  </pre><span style=\"color:#ccc\">"+tip.district+"</span></div>";
				   } catch(e) {
				      console.log(e); 
				   }
			           tipElements.push(tElement);		     
		             });
			     $(".desloc_result").html(tipElements);
			     $(".desloc_result").css({"display":"block"});
			     tipElements.forEach(function(e,i){
			         	$("#dtip"+i).data("tip",tips[i]); 
			     });  
			     $(".tip").click(function(){
				     $(this).parent().prev().data("desloc",$(this).data("tip"));
				     $(this).parent().prev().val($("pre",this).html().trim());
			     	     $(this).parent().html("");
			     	     $(this).parent().css({"display":"none"});
			             //console.log($(this).val()); 
			     });

			} else {
			
			}
		}

	     	var marker = new Array();  
		var windowsArr = new Array();
		var cloudDataLayer;
                var map=null;
        	(function(exports){
			
			map = new AMap.Map('mapContainer', {
				resizeEnable: true,
				rotateEnable: true,
				dragEnable: true,
				zoomEnable: true,
				//设置可缩放的级别
				zooms: [3,18],
                                view: new AMap.View2D({
					center: new AMap.LngLat(116.510756,39.894255),
					zoom: 12
				})
			});
                        map.plugin(['AMap.ToolBar'],function(){
                              var toolBar = new AMap.ToolBar();
                              map.addControl(toolBar);
                        });
                 	//加载输入提示插件  
		 	map.plugin(["AMap.Autocomplete"], function() {  
			//判断是否IE浏览器  
		        bindAutoSearch("selfloc_input",autoCompleteSelfLoc);
		        bindAutoSearch("desloc_input",autoCompleteDesLoc);
		    }); 
                        			
		})(window);
    </script>
</body>
</html>
