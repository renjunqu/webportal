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
						  <input id="selfloc_input" type="text" class="thin_input" placeholder="我的位置">
						  </input>
                                                  <div class="autobox" id="result1"></div>
                                                  <div id="result"></div>
					   </div>
					   <div class="desloc_input_div">
						  <input type="text" class="thin_input" placeholder="输入终点">
						  </input>
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
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=103e3fae6c781ad2da0587f2b04a2034"></script>
    <script>
     var marker = new Array();  
var windowsArr = new Array();
var cloudDataLayer;
     //添加marker&infowindow      
function addmarker(i, d) {  
	var lngX; 
	var latY;
	var iName;
	var iAddress;
	if(d.location){
		lngX = d.location.getLng();  
		latY = d.location.getLat();  
	}else{
		lngX = d._location.getLng();  
		latY = d._location.getLat(); 
	}
	if(d.name){
		iName = d.name;
	}else{
		iName = d._name;
	}
	if(d.name){
		iAddress = d.address;
	}else{
		iAddress = d._address;
	}
    var markerOption = {  
        map:map,  
        icon:"http://webapi.amap.com/images/" + (i + 1) + ".png",  
        position:new AMap.LngLat(lngX, latY)  
    };  
    var mar = new AMap.Marker(markerOption);            
    marker.push(new AMap.LngLat(lngX, latY));  
  
    var infoWindow = new AMap.InfoWindow({  
        content:"<h3><font color=\"#00a6ac\">" + (i + 1) + ". " + iName + "</font></h3>" + TipContents(d.type, iAddress, d.tel),  
        size:new AMap.Size(300, 0),   
        autoMove:true,    
        offset:new AMap.Pixel(0,-30)  
    });  
    windowsArr.push(infoWindow);   
    var aa = function (e) {infoWindow.open(map, mar.getPosition());};  
    AMap.event.addListener(mar, "click", aa);  
}
                function addmarker2(i,d){    
    var markerOption = {  
        map:map,               
        icon:"http://webapi.amap.com/images/point.png",    
        position:new AMap.LngLat(d.x,d.y),    
        offset:{x:-8,y:-9}    
    };                
    var mar =new AMap.Marker(markerOption);    
    marker.push(new AMap.LngLat(d.x,d.y));  
    var infoWindow = new AMap.InfoWindow({    
        content:"&nbsp;&nbsp;"+(i+1) + ". "+ d.roadname2 +"和"+d.roadname1+"交叉口"+"<br />",    
        size:new AMap.Size(300,0),    
        autoMove:true  
    });    
    windowsArr.push(infoWindow);    
     
    var aa=function(e){infoWindow.open(map,mar.getPosition());};    
    AMap.event.addListener(mar,"click",aa);    
}  
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
    var str = "&nbsp;&nbsp;地址：" + address + "<br />&nbsp;&nbsp;电话：" + tel + " <br />&nbsp;&nbsp;类型：" + type;  
    return str;  
}  
                //从输入提示框中选择关键字并查询  
		function selectResult(index) {  
		    if (navigator.userAgent.indexOf("MSIE") > 0) {  
			document.getElementById("selfloc_input").onpropertychange = null;  
			document.getElementById("selfloc_input").onfocus = focus_callback;  
		    }  
		    //截取输入提示的关键字部分  
		    var text = document.getElementById("divid" + (index + 1)).innerHTML.replace(/<[^>].*?>.*<\/[^>].*?>/g,"");;  
		    document.getElementById("selfloc_input").value = text;  
		    document.getElementById("result1").style.display = "none";  
		    //根据选择的输入提示关键字查询  
		    map.plugin(["AMap.PlaceSearch"], function() {          
			var msearch = new AMap.PlaceSearch();  //构造地点查询类  
			AMap.event.addListener(msearch, "complete", Search_CallBack); //查询成功时的回调函数  
			msearch.search(text);  //关键字查询查询  
		    });  
		}  
               function onmouseout_MarkerStyle(pointid, thiss) { //鼠标移开后点样式恢复  
			    thiss.style.background = "";  
	        }
                function openMarkerTipById1(pointid, thiss) {  //根据id 打开搜索结果点tip  
		    thiss.style.background = '#CAE1FF';  
		    windowsArr[pointid].open(map, marker[pointid]);  
		} 
                //输入提示框鼠标滑过时的样式  
function openMarkerTipById(pointid, thiss) {  //根据id打开搜索结果点tip    
    thiss.style.background = '#CAE1FF';  
}  
                //回调函数  
		function Search_CallBack(data) {  
		    var resultStr = "";  
		    var poiArr = data.poiList.pois;  
		    var resultCount = poiArr.length;  
		    for (var i = 0; i < resultCount; i++) {  
			resultStr += "<div id='divid" + (i + 1) + "' onmouseover='openMarkerTipById1(" + i + ",this)' onmouseout='onmouseout_MarkerStyle(" + (i + 1) + ",this)' style=\"font-size: 12px;cursor:pointer;padding:0px 0 4px 2px; border-bottom:1px solid #C1FFC1;\"><table><tr><td><img src=\"http://webapi.amap.com/images/" + (i + 1) + ".png\"></td>" + "<td><h3><font color=\"#00a6ac\">名称: " + poiArr[i].name + "</font></h3>";  
			    resultStr += TipContents(poiArr[i].type, poiArr[i].address, poiArr[i].tel) + "</td></tr></table></div>";  
			    addmarker(i, poiArr[i]);  
		    }  
		    map.setFitView();  
		    document.getElementById("result").innerHTML = resultStr;  
		}  
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
                        function autocomplete_CallBack(data){
                                  var resultStr = "";  
				    var tipArr = [];  
				    tipArr = data.tips;  
				    if (tipArr.length>0) {                    
					for (var i = 0; i < tipArr.length; i++) {  
					    resultStr += "<div id='divid" + (i + 1) + "' onmouseover='openMarkerTipById(" + (i + 1)  
							+ ",this)' onclick='selectResult(" + i + ")' onmouseout='onmouseout_MarkerStyle(" + (i + 1)  
							+ ",this)' style=\"background:#ccc;font-size: 13px;cursor:pointer;padding:5px 5px 5px 5px;\">" + tipArr[i].name + "<span style='color:#C1C1C1;'>"+ tipArr[i].district + "</span></div>";  
					}  
				    }  
				    else  {  
					resultStr = " π__π 亲,人家找不到结果!<br />要不试试：<br />1.请确保所有字词拼写正确<br />2.尝试不同的关键字<br />3.尝试更宽泛的关键字";  
				    }  
				     
				    document.getElementById("result1").innerHTML = resultStr;  
				    document.getElementById("result1").style.display = "block"; 
                        }
                  //输入提示  
			function autoSearch() {   
			    var keywords = document.getElementById("selfloc_input").value;  
			    var auto;    
			    var autoOptions = {  
				pageIndex:1,  
				pageSize:10,  
				city: "" //城市，默认全国  
			    };  
			    auto = new AMap.Autocomplete(autoOptions);  
			    //查询成功时返回查询结果  
			    AMap.event.addListener(auto, "complete", autocomplete_CallBack);  
			    auto.search(keywords);  
			} 

                 //加载输入提示插件  
		 map.plugin(["AMap.Autocomplete"], function() {  
			//判断是否IE浏览器  
			if (navigator.userAgent.indexOf("MSIE") > 0) {  
			    document.getElementById("selfloc_input").onpropertychange = autoSearch;  
			}  
			else {  
			    document.getElementById("selfloc_input").oninput = autoSearch;  
			}  
		    }); 
                        			
		})(window);
    </script>
    <script>
       $(function(){
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
        });
   </script>
</body>
</html>
