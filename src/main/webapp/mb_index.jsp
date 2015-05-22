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
    <meta name="viewport" content="
    width=640, 
    minimum-scale=0.01,
    maximum-scale=10.0,
    user-scalable=yes
    ">
    <link rel="stylesheet" href="/static/mobile/jquery.mobile-1.3.2.min.css">
    <script src="/static/jquery-1.11.3.min.js"></script>
    <script src="/static/mobile/jquery.mobile-1.3.2.min.js"></script>
    <link rel="stylesheet" href="/static/mb_main.css">
    <link rel="stylesheet" href="/static/mb_index.css">
    <link rel="stylesheet" href="/static/mb_usage.css">
    <link rel="stylesheet" href="/static/mb_interest.css">
    </header>
<body data-enhanced="fallse" style="background:#fff;">
		  <div data-enhance="false" id="header">
		  </div>
		  <div data-enhance="false" id="title">
		  </div>
		  <div data-enhance="false" id="video_div">
			  <div data-enhance="false" id="video_poster"> 
				    <div class="center_align" data-enhance="false" id="play_button"></div>
			  </div>
		     <video id="indexVideo" class="center_align" style="display:none;height:90%;" controls>
			   <source src="http://cdn.futuremove.cn/video/index.mp4" type="video/mp4">
			   "Your browser does not support html5 video, please visit: "<a href="http://www.baidu.com">www.baidu.com</a>
		     </video>
		  </div>
		  <div data-enhance="false" id="feature_show">
				  <div data-enhance="false" id="feature_1_div">
					  <div data-enhance="false" id="feature_1" class="center_align">
					  </div>
				  </div>
				  <div data-enhance="false" id="feature_2_div">
					  <div data-enhance="false" id="feature_2" class="center_align">
					  </div>
				  </div>
				  <div data-enhance="false" id="feature_3_div">
					  <div data-enhance="false" id="feature_3" class="center_align">
					  </div>
				  </div>
				  <div data-enhance="false" id="feature_4_div">
					  <div data-enhance="false" id="feature_4" class="center_align">
					  </div>
				  </div>
		  </div>
		  <div id="bottom" data-enhance="false">--点击加载更多精彩内容--
                       <div id="load_div" data-enhance="false">
                           <div id="load_wait_info" class="center_align"  data-enhance="false">
                           </div>
                       </div>
                 </div>
         <script>
                var nextPage = 0;
                var pages = ["mb_usage1.jsp","mb_usage2.jsp","mb_usage3.jsp","mb_usage4.jsp","mb_interest.jsp"];
                var loading=false;
                function loadPage() {

                    var page_url = pages[nextPage];
                    if(nextPage==pages.length) return;
                    $("#load_div").css({"display":"block"});
                    loading=true;
                    console.log("next "+nextPage);
		    $.ajax({
			      
			       url:page_url,
			       "type":'GET',
			       success:function(data,textStatus,jqXHR){
                                    loading=false;
				    $("#bottom").before(data);
                                    nextPage++;
                                    if(nextPage==(pages.length)) {
                                       $("#bottom").css({"display":"none"});
                                    } else {
                                       $("#load_div").css({"display":"none"});

                                    }
			       },
				error:function(){
                                   loading=false;
				   alert("服务器错误");
				}
			      });
                }

                $("#play_button").on("tap",function(e){
                     $("#video_poster").css({"display":"none"});
                     $('#indexVideo').css({"display":"block"});
                     $('#indexVideo').trigger('play');
                });
		$("#bottom").on('tap',function(){
                   if(loading==false)
                        loadPage();
                });
		$(document).on("scrollstop",function(){
		      if (loading==false && ($(this).scrollTop() + $(window).height() + 20 >= $(document).height()) ) {
                               loadPage();     
                      }
                });
				     

        </script>


</body>
</html>
