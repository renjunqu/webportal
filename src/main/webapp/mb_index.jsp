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
    <link rel="stylesheet" href="/static/mb_main.css">
    </header>
<body>
         <div id="mainDiv" style="width:100%;height:100%;">
             <div id="after_main"></div>
          <div id="header">
               <div id="backButton">&lt;&nbsp;返回</div>
	  </div>
          <div id="title">
	  </div>
          <div id="video_div" style="background:#000;">
                  <div id="video_poster"> 
                            <div id="play_button"></div>
                  </div>
		  <video id="indexVideo" class="horizon_center_align" style="position:absolute;width:auto !important;height:100%;!important;position:absolute;top:0px;" controls>
				   <source src="http://cdn.futuremove.cn/video/index.mp4" type="video/mp4">
				   "Your browser does not support html5 video, please visit: "<a href="http://www.baidu.com">www.baidu.com</a>
			     </video>
          </div>
          <div id="feature_show">
                  <div id="fs_container" class="center_align">
			  <div id="feature_1_div">
				  <div id="feature_1" class="center_align">
				  </div>
			  </div>
			  <div id="feature_2_div">
				  <div id="feature_2" class="center_align">
				  </div>
			  </div>
			  <div id="feature_3_div">
				  <div id="feature_3" class="center_align">
				  </div>
			  </div>
			  <div id="feature_4_div">
				  <div id="feature_4" class="center_align">
				  </div>
			  </div>
                  </div>
          </div>
        </div>
         <script>
                $("#play_button").on("tap",function(e){
                     $("#video_poster").css({"display":"none"});
                     $('#indexVideo').trigger('play');
                });

		    $(document).on("scrollstop",function(){
                         if($(document).scrollTop()==100) {
                            window.location = "mb_usage.jsp";
                        }  
		    });

        </script>


</body>
</html>
