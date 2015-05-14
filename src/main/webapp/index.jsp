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
    <link rel="stylesheet" href="/static/index.css" />
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
    </header>
<body>
     <%@ include file="header.jsp"%> 
     <div id="main">
             <video id="indexVideo" style=" width:100%    !important;height:auto   !important;position:absolute;bottom:0px;" controls>
                   <source src="/static/video/index.mp4" type="video/mp4">
                   "Your browser does not support html5 video, please visit: "<a href="http://www.baidu.com">www.baidu.com</a>
             </video>
             <div id="indexRightBar" >
                <div id="resizeBar"></div>
                <div style="position:absolute;left:5px;right:0px;top:0px;height:100%;overflow:hidden;">
                       <div id="rightBar_close"></div> 
                       <div id="rightBar_joinSuda">
                            <div id="rightBar_joinTitle"></div>
                            <div id="rightBar_joinAction">
                                 <div id="joinAction_1">
                                 </div>
                                 <div id="joinAction_2">
                                        122
                                 </div>
                                 <div id="joinAction_3">
                                 </div>
                                 <div id="joinAction_4">
                                        652
                                 </div>
                                 <div style="clear:both;"></div>
                            </div>
                       </div> 
                       <div id="rightBar_login">
                             <div style="height:36px;width:265px;position:absolute;top:0px">
                                  <div id="rb_login_top_icon" style="float:left;"></div>
                                  <div id="rb_login_mobileNo_input" style="float:left;">
                                       <input type="text" placeholder="手机号" class="thin_input"></input>
                                  </div>
                             </div>
                             <div style="height:36px;width:265px;position:absolute;bottom:0px">
                                  <div id="rb_login_bottom_icon" style="float:left;"></div>
                                  <div id="rb_login_bottom_code_input" style="float:left;">
                                       <input type="text" placeholder="验证码" class="thin_input"></input>
                                  </div>
                                  <div id="rb_login_bottom_code_b" style="float:left;">
                                        获取验证码
                                  </div>
                             </div>
                       </div> 
                </div>
             </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
        $("#indexVideo").get(0).play();
        var startX=0;
        var startY=0;
        var start=false;
        $(function(){
               $(document).bind("mousemove",function(e){
              //      console.log("start 123");
                    if(start) {
                            if(e.which==1) {
				    var  currX = e.pageX;
				    var  currY = e.pageY;
				    var diffX = currX - startX;
				    var currWidth = $("#indexRightBar").width();
				    if(diffX != 0) {
					currWidth = currWidth - 1;
					currWidth = currWidth - (diffX) + 1;
					if(currWidth<=10) {
                                             currWidth = 10;
					} else if(currWidth >=283) {
                                             currWidth = 283;
					}
					 $("#indexRightBar").width(currWidth);
                                         startX = e.pageX;
                                         startY = e.pageY;
				   }
                        } else {
                           $('body').css({"cursor":"default"});
                           start=false;
                        }
                    }
               });
               $("#resizeBar").mousedown(function(e){
                 //console.log("start");
                 startX = e.pageX;
                 startY = e.pageY;
                 start=true;
                 $('body').css({"cursor":"ew-resize"});
               });
               $("#rightBar_close").click(function(e){
                    $("#indexRightBar").css({"display":"none"});
               });
        }); 
       $(document).bind("mousemove",function(){
             //console.log("mousemove");
        });
   </script>
</body>
</html>
