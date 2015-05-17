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
			      <div id="routeResult"></div>
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
	function drivingRoute(startmarker,endmarker) {
			var MDrive;
			AMap.service(["AMap.Driving"], function() {
				var DrivingOption = {
					//驾车策略，包括 LEAST_TIME，LEAST_FEE, LEAST_DISTANCE,REAL_TRAFFIC
					policy: AMap.DrivingPolicy.LEAST_TIME 
				};        
		        MDrive = new AMap.Driving(DrivingOption); //构造驾车导航类 
		        //根据起终点坐标规划驾车路线
		        MDrive.search(startmarker.getPosition(), endmarker.getPosition(), function(status, result){
		        	if(status === 'complete' && result.info === 'OK'){
		        		showRouteResult(result);
		        	}else{
		        		alert(result);
		        	}
		        }); 
		    });
		}

		var driveLine = null;
		var currPathLine = null;
		var steps = null;

			//绘制驾车导航路段
		function driveDrawFoldline(num) {
			var drawpath1 = new Array();
			drawpath1 = steps[num].path;
			if(currPathLine!= null) {
				currPathLine.setMap(null);
			}
			currPathLine = new AMap.Polyline({
					map: map,
					path: drawpath1,
					strokeColor: "#FF3030",
					strokeOpacity: 0.9,
					strokeWeight: 4,
					strokeDasharray: [10, 5]
				});
		
			map.setFitView(currPathLine);
		}



		//绘制驾车导航路线
		function showRouteResult(result) {
			steps = result.routes[0].steps;
			var route_count = steps.length;
			//行车距离（米）
		        var distance = result.routes[0].distance;
			var route_text = "";
			var drawpath = new Array(); 
			for(var s=0; s<steps.length; s++) {
				route_text += "<div id=\"routeStep"+s+"\" onMouseover=\"driveDrawFoldline('" + s + "')\">" + s +"." +steps[s].instruction  + "</div>";
				var plength = steps[s].path.length;
				for (var p=0; p < plength; p++) {
					drawpath.push(steps[s].path[p]);
				}
			}
			//输出行车路线指示
			//document.getElementById("result").innerHTML = route_text;
			$("#routeResult").html(route_text);
			//remove the old one
			if(currPathLine!=null) 
			   currPathLine.setMap(null);
		        if(driveLine!= null)
				driveLine.setMap(null);
			driveLine = new AMap.Polyline({
				map: map,
				path: drawpath,
				strokeColor: "#9400D3",
				strokeOpacity: 0.7,
				strokeWeight: 4,
				strokeDasharray: [10, 5]
			});
			map.setFitView();
		}



                //infowindow显示内容
		function TipContents(type, address, tel) {  //窗体内容
		    if (type == "" || type == "undefined" || type == null || type == " undefined" || typeof type == "undefined") {
		        type = "暂无";
		    }
		    if (address == "" || address == "undefined" || address == null || address == " undefined" || typeof address == "undefined") {
		        address = "暂无";
		    }
		    if (tel == "" || tel == "undefined" || tel == null || tel == " undefined" || typeof address == "tel") {
		        tel = "暂无";
		    }
		    var str = "  地址：" + address + "<br />  电话：" + tel + " <br />  类型：" + type;
		    return str;
		}


                function placeSearch(target,SCallback){
		    var keywords = $(target).val();  
		    if(keywords.length > 0 ) {
			    var MSearch;
			    AMap.service(["AMap.PlaceSearch"], function() {       
				MSearch = new AMap.PlaceSearch({ //构造地点查询类
				    pageSize: 100,
				    pageIndex:1,
				    city:"0010" //城市
				});
				//关键字查询
				MSearch.search(keywords, function(status, result){
					if(status === 'complete' && result.info === 'OK'){
						SCallback(result);
				        } else {
						    $(target).next().html("");
						    $(target).next().css({"display":"none"});
					}
				}); 
			    });
		    } else {
			    $(target).next().html("");
			    $(target).next().css({"display":"none"});
		    }
		}


		function bindAutoSearch(className,SCallback){
			if (navigator.userAgent.indexOf("MSIE") > 0) {  
				$("."+className).bind("propertychange",function(){
			                        // autoSearch(this,autoComplete_callback);	
						placeSearch(this,SCallback);
				});
			}  
			else {  
				$("."+className).bind("input",function(){
			                        //autoSearch(this,autoComplete_callback);	
						placeSearch(this,SCallback);
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


		function autoCompleteSelfLoc(data){
			     //first remove the old tips
			     $(".selfloc_result").html("");
			     var pois = data.poiList.pois;
			     //
			     //add the tips
			     var poiElements = [];
			     pois.forEach(function(poi,index){
				   try {
				   var pElement = "<div id=\"tip"+index+"\" class=\"tip\"><pre>"+poi.name+"  </pre><pre style=\"color:#ccc\">"+poi.address+"</pre></div>";
				   } catch(e) {
				      console.log(e); 
				   }
				   poiElements.push(pElement);		  
			     });

			     $(".selfloc_result").html(poiElements);
			     $(".selfloc_result").css({"display":"block"});
			     //add this tips object to these elemetn dom
			     poiElements.forEach(function(e,i){
					$("#tip"+i).data("poi",pois[i]); 
			     });  
			     $(".tip").click(function(){
			             var poi = $(this).data("poi");
				     var lngX = poi.location.getLng();
		                     var latY = poi.location.getLat();
				     var infoWindow = new AMap.InfoWindow({
						content:"<h3><font color=\"#00a6ac\">  "  + poi.name + "</font></h3>" + TipContents(poi.type, poi.address, poi.tel),
						size:new AMap.Size(250, 0),
						autoMove:true, 
						offset:new AMap.Pixel(0,-30)
				    });
				     //first get the previous marker
				     //console.log($(this).parent().parent().attr("id"));
				     var prevMarker = $(this).parent().parent().data("marker");
				     if(prevMarker) {
				             prevMarker.setMap(null); 
				     }
				     var sicon = new AMap.Icon({
						image: "http://cache.amap.com/lbs/static/jsdemo002.png",
						size:new AMap.Size(44,44),
						imageOffset: new AMap.Pixel(-334, -180)
				     });
				     var markerOption = {
					map:map,
					icon:sicon,
					position:new AMap.LngLat(lngX, latY),
					offset : {
							x : -16,
							y : -40
				             }
				     };
				     var newMarker = new AMap.Marker(markerOption);
				     $.m = this;
				     $(this).parent().parent().data("marker",newMarker);
				     newMarker.setMap(map);
    				     var aa = function (e) {infoWindow.open(map, newMarker.getPosition());};
				     AMap.event.addListener(newMarker,"mouseover",aa);
                                     var startmarker = newMarker;
                                     var endmarker = $(this).parent().parent().next().data("marker");
				     if(startmarker && endmarker) {
				     	drivingRoute(startmarker,endmarker);
				     }
				     map.setFitView();
				     $(this).parent().prev().val($("pre",this).html().trim());
				     $(this).parent().html("");
				     $(this).parent().css({"display":"none"});
				     //marker.set
			     });

		}
		function autoCompleteDesLoc(data){
			     //first remove the old tips
			     $(".desloc_result").html("");
			     var pois = data.poiList.pois;
			     //
			     //add the tips
			     var poiElements = [];
			     pois.forEach(function(poi,index){
				   try {
				   var pElement = "<div id=\"tip"+index+"\" class=\"tip\"><pre>"+poi.name+"  </pre><pre style=\"color:#ccc\">"+poi.address+"</pre></div>";
				   } catch(e) {
				      console.log(e); 
				   }
				   poiElements.push(pElement);		  
			     });

			     $(".desloc_result").html(poiElements);
			     $(".desloc_result").css({"display":"block"});
			     //add this tips object to these elemetn dom
			     poiElements.forEach(function(e,i){
					$("#tip"+i).data("poi",pois[i]); 
			     });  
			     $(".tip").click(function(){
			             var poi = $(this).data("poi");
				     var infoWindow = new AMap.InfoWindow({
						content:"<h3><font color=\"#00a6ac\">  "  + poi.name + "</font></h3>" + TipContents(poi.type, poi.address, poi.tel),
						size:new AMap.Size(250, 0),
						autoMove:true, 
						offset:new AMap.Pixel(0,-30)
				    });


				     var lngX = poi.location.getLng();
		                     var latY = poi.location.getLat();
				     //first get the previous marker
				     var prevMarker = $(this).parent().parent().data("marker");
				     if(prevMarker) {
				             prevMarker.setMap(null); 
				     }
				    var eicon = new AMap.Icon({
						image: "http://cache.amap.com/lbs/static/jsdemo002.png",
						size:new AMap.Size(44,44),
						imageOffset: new AMap.Pixel(-334, -134)
				     });

				     var markerOption = {
					map:map,
					icon:eicon,
					position:new AMap.LngLat(lngX, latY),
					offset : {
						x : -16,
						y : -40
				          }
				     };
				     var newMarker = new AMap.Marker(markerOption);
				     $(this).parent().parent().data("marker",newMarker);
				     newMarker.setMap(map);
    				     var aa = function (e) {infoWindow.open(map, newMarker.getPosition());};
				     AMap.event.addListener(newMarker,"mouseover",aa);
                                     var startmarker = $(this).parent().parent().prev().data("marker");
                                     var endmarker = newMarker;
				     if(startmarker && endmarker)
				     	drivingRoute(startmarker,endmarker);
				     map.setFitView();
				     //marker.set
				     $(this).parent().prev().val($("pre",this).html().trim());
				     $(this).parent().html("");
				     $(this).parent().css({"display":"none"});
			     });

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
		        bindAutoSearch("selfloc_input",autoCompleteSelfLoc);
		        bindAutoSearch("desloc_input",autoCompleteDesLoc);
		    }); 
                        			
		})(window);
    </script>
</body>
</html>
