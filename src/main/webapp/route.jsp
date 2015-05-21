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
    <meta name=”viewport” content=”width=device-width, initial-scale=1.0, user-scalable=no”/>
    <script type="text/javascript" src="/static/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="/static/main.css" />
    <link rel="stylesheet" type="text/css" href="/static/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="/static/route.css" />
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
	 <script src="/static/jquery.datetimepicker.js"></script>
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
				  <div id="inputDivNav">
					  <div id="prevRoute" class="tooltip" title="前一个路径规划"></div>
					  <div id="nextRoute" class="tooltip" title="下一个路径规划"></div>
				  </div>
                                  <div class="input_item curr_item">
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
						  <script>
						$(".time_input_div input").datetimepicker({
								});
						  </script>
					   </div>
                                   </div>
                                   <div id="inputAction" >
                                        <div id="addRoute_div" title="增加一个出行计划" class="tooltip"></div>
                                        <div id="delRoute_div" title="删除本次出行计划" class="tooltip" class="vertical_center_align"></div>
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
            $(".tooltip").tooltipster();
	    $("#addRoute_div").click(function(){
                   var newRouteDivStr = "<div class=\"input_item\">"+
		                            "<div class=\"selfloc_input_div\">" +  
					         "<input class=\"selfloc_input thin_input\" type=\"text\" placeholder=\"我的位置\"></input>" + 
                                                  "<div class=\"autobox selfloc_result\"></div>" +
					     "</div>" + 
					     "<div class=\"desloc_input_div\">" + 
						  "<input type=\"text\" class=\"desloc_input thin_input\" placeholder=\"输入终点\">" + 
						  "</input>" + 
                                                  "<div class=\"autobox desloc_result\"></div>" + 
					      "</div>" + 
					      "<div class=\"time_input_div\" >" + 
						  "<input type=\"text\" class=\"thin_input\" placeholder=\"出行时间\">" + 
						  "</input>" + 
						  "<script>" + 
						  "$(\".time_input_div input\").datetimepicker({});<\/script>" +
					       "</div>" +
                                         "</div>"; 
		//console.log(newRouteDivStr);
		var currItem = $(".curr_item");
		currItem.after(newRouteDivStr);
		currItem.removeClass("curr_item");
		var newItem = currItem.next();
		newItem.addClass("curr_item");
		$(".input_item").css({"display":"none"});
		$(".curr_item").css({"display":"block"});
		//unbindAutoSearch("selfloc_input");
		//unbindAutoSearch("desloc_input");
		bindAutoSearch("selfloc_input",newItem,autoCompleteSelfLoc);
		bindAutoSearch("desloc_input",newItem,autoCompleteDesLoc);
                $("#prevRoute").css({"display":"block"});
		map.clearMap();
	    });

	    $("#prevRoute").click(function(){
			  var curr_item =   $(".curr_item");
			  var prev_item = curr_item.prev();
			  if(prev_item.hasClass("input_item")) {
			         curr_item.removeClass("curr_item");
                                 prev_item.addClass("curr_item");
				 $(".input_item").css({"display":"none"});
				 $(".curr_item").css({"display":"block"});
		                 map.clearMap();
				 var startmarker = $(".selfloc_input_div",prev_item).data("marker");
				 var endmarker = $(".desloc_input_div",prev_item).data("marker");
                                 if(startmarker) startmarker.setMap(map);
                                 if(endmarker) endmarker.setMap(map);
				 if(startmarker && endmarker) {
				     	drivingRoute(startmarker,endmarker);
				 }
                                 var prev_prev_item = $(".curr_item").prev();
                                 if(prev_prev_item.hasClass("input_item")) {
                                 
                                 } else {
                                     $("#prevRoute").css({"display":"none"});
                                 }
                                 $("#nextRoute").css({"display":"block"});
				 map.setFitView();
			  } else {
			  }
			    
	    });

	    $("#nextRoute").click(function(){
			  var curr_item =   $(".curr_item");
			  var next_item = curr_item.next();
			  if(next_item.hasClass("input_item")) {
			         curr_item.removeClass("curr_item");
                                 next_item.addClass("curr_item");
				 $(".input_item").css({"display":"none"});
				 $(".curr_item").css({"display":"block"});
		                 map.clearMap();
				 var startmarker = $(".selfloc_input_div",next_item).data("marker");
				 var endmarker = $(".desloc_input_div",next_item).data("marker");
                                 if(startmarker) startmarker.setMap(map);
                                 if(endmarker) endmarker.setMap(map);
				 if(startmarker && endmarker) {
				     	drivingRoute(startmarker,endmarker);
				 }
                                 var next_next_item = $(".curr_item").next();
                                 if(next_next_item.hasClass("input_item")) {
                                 
                                 } else {
                                     $("#nextRoute").css({"display":"none"});
                                 }
                                 $("#prevRoute").css({"display":"block"});
				 map.setFitView();
			  } else {
			  }
	    });

	    $("#delRoute_div").click(function(){
			  var curr_item =   $(".curr_item");
			  var next_item = curr_item.next();
			  var prev_item = curr_item.prev();
			  var startmarker = null;
			  var endmarker = null;
			  
			  if(next_item.hasClass("input_item")) {
		                 map.clearMap();
			         curr_item.removeClass("curr_item");
                                 next_item.addClass("curr_item");
				 $(".input_item").css({"display":"none"});
				 $(".curr_item").css({"display":"block"});
				 startmarker = $(".selfloc_input_div",next_item).data("marker");
				 endmarker = $(".desloc_input_div",next_item).data("marker");
				 curr_item.remove();
			  } else if(prev_item.hasClass("input_item")){
		                 map.clearMap();
			         curr_item.removeClass("curr_item");
                                 prev_item.addClass("curr_item");
				 $(".input_item").css({"display":"none"});
				 $(".curr_item").css({"display":"block"});
				 startmarker = $(".selfloc_input_div",prev_item).data("marker");
				 endmarker = $(".desloc_input_div",prev_item).data("marker");
				 curr_item.remove();
			  } else {
			  }
                         var new_curr_item_prev = $(".curr_item").prev();
                         var new_curr_item_next = $(".curr_item").next();
                         if(new_curr_item_prev.hasClass("input_item")) {
                                     $("#prevRoute").css({"display":"block"});
                         } else {
                                     $("#prevRoute").css({"display":"none"});
                         }
                         if(new_curr_item_next.hasClass("input_item")) {
                                     $("#nextRoute").css({"display":"block"});
                         } else {
                                     $("#nextRoute").css({"display":"none"});
                         }
			 if(startmarker) startmarker.setMap(map);
			 if(endmarker) endmarker.setMap(map);
			 if(startmarker && endmarker) {
				drivingRoute(startmarker,endmarker);
			 }
			 map.setFitView();
			    
	    });
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


                function placeSearch(target,pDiv,SCallback){
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
						SCallback(result,pDiv);
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


		function bindAutoSearch(className,pDiv,SCallback){
			if (navigator.userAgent.indexOf("MSIE") > 0) {  
				$("."+className,pDiv).bind("propertychange",function(){
			                        // autoSearch(this,autoComplete_callback);	
						placeSearch(this,pDiv,SCallback);
				});
			}  
			else {  
				$("."+className,pDiv).bind("input",function(){
			                        //autoSearch(this,autoComplete_callback);	
						placeSearch(this,pDiv,SCallback);
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


		function autoCompleteSelfLoc(data,pDiv){
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

			     $(".selfloc_result",pDiv).html(poiElements);
			     $(".selfloc_result",pDiv).css({"display":"block"});
			     //add this tips object to these elemetn dom
			     poiElements.forEach(function(e,i){
					$("#tip"+i,pDiv).data("poi",pois[i]); 
			     });  
			     $(".tip",pDiv).click(function(){
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
		function autoCompleteDesLoc(data,pDiv){
			     //first remove the old tips
			     $(".desloc_result",pDiv).html("");
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

			     $(".desloc_result",pDiv).html(poiElements);
			     $(".desloc_result",pDiv).css({"display":"block"});
			     //add this tips object to these elemetn dom
			     poiElements.forEach(function(e,i){
					$("#tip"+i,pDiv).data("poi",pois[i]); 
			     });  
			     $(".tip",pDiv).click(function(){
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
		        bindAutoSearch("selfloc_input",$(".curr_item"),autoCompleteSelfLoc);
		        bindAutoSearch("desloc_input",$(".curr_item"),autoCompleteDesLoc);
		})(window);
    </script>
</body>
</html>
