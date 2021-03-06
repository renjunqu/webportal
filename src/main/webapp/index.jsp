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
    <head>
     
    <script type="text/javascript" src="/static/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="/static/main.css" />
    <link rel="stylesheet" href="/static/index.css" />
    <title>Soda苏打 - 绿色出行,都市自由移动</title>
    </head>
<body>
     <script>
         var currMenu = "menu_1";
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
		     <video id="indexVideo" style=" width:100%    !important;height:auto   !important;position:absolute;top:0px;" controls class="video-js vjs-default-skin">
			   <source src="http://cdn.futuremove.cn/video/index.mp4" type="video/mp4">
                            <p class="vjs-no-js">请允许Javascript 运行，或者不要在IE9以下版本运行以及不要在IE兼容模式下查看此网站，否则网站内容无法正常展示哦</p>
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
				     <div id="rb_login_submit_button" class="horizon_center_align"></div>
			       </div> 
			</div>
                </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
        $("#indexVideo").trigger("play");
        var startX=0;
        var startY=0;
        var start=false;
       function ifPhoneNo(inputtxt)
        {
		  var phoneno = /^\d{11}$/;
		  if((inputtxt.match(phoneno)))
		  {
		      return true;
		  }  else  {
		      return false;
		  }
        }
        var getCode = false;
        $(function(){
     
               $("#rb_login_bottom_code_b").click(function(){
		    //show the wait info
                    if(registering || getCode) return;
                    var phoneNo = $("#rb_login_mobileNo_input input").val(); 
                    if(ifPhoneNo(phoneNo)) {
			    getCode = true;
			    $(this).html("<div id='codeCD'>60秒后在获取</div>");
			    var secCount = 0;
			    var intH = setInterval(function(){
				if(secCount < 60) {
				   $("#codeCD").html((60 - secCount) + "秒后再获取");
				}else {
				   clearInterval(intH);
				   $("#rb_login_bottom_code_b").html("获取验证码");
                                   getCode = false;
				}
				secCount++;
			    },1000);
                            $.args = {"mobileNo":phoneNo};
                            $.ajax({
                                           type:"POST",
                                           url:'http://123.57.151.176:8082/joymove/usermgr/dynamicPwsGen.c',
                                           data:JSON.stringify($.args),
                                           crossDomain: true,
                                           success: function(data,textStatus,jqXHR){
                                                    console.log(data);
                                           },
                                           error: function(request,error){
                                                   alert("获取验证码失败，请稍后重试!");
                                           }
                            });
                    } else {
                         alert("输入正确的手机号");
                    }
               });
               var registering = false; 
               $("#rb_login_submit_button").click(function(){
		    //show the wait info
                    if(registering) return;
                    var phoneNo = $("#rb_login_mobileNo_input input").val(); 
                    var code    = $("#rb_login_bottom_code_input input").val(); 
                    if(ifPhoneNo(phoneNo) && code.length > 0) {
			    $(this).html("<div id='waitRegister'>请稍后..</div>");
                            registering = true;
			   $.args = {"mobileNo":phoneNo,"code":code,"password":phoneNo};
			   $.ajax({
				   type:"POST",
				   url:'http://123.57.151.176:8082/joymove/usermgr/register.c',
				   data:JSON.stringify($.args),
				   crossDomain: true, 
                                   dataType:'json',
				   success: function(data,textStatus,jqXHR){
                                            registering = false;
                                            $("#rb_login_submit_button").html("");
					    if(data.result=="10000"){
					       alert("注册成功，默认登录密码为手机号!,请下载我们的app开始您的智驾之旅");
                                               window.location = "appshow.jsp";
					    } else if(data.errMsg!=null && data.errMsg.length>0) {
					       alert("注册失败,"+data.errMsg);
					    } else {
					       alert("注册失败，发生未知错误");
					    }
				   },
				   error: function(request,error){
                                            registering = false;
                                            $("#rb_login_submit_button").html("");
					    alert("出现内部错误!");
				   }
			   });                
                    } else {
                       alert("请输入正确的手机号以及验证码!"); 
                    }
               });
               $(document).bind("mousemove",function(e){
                    console.log("mouse move");
                            console.log(e.which);
                    if(start) {
                            console.log("yes");
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
                         }
                        
               });
               $(document).bind("mouseup",function(){
                          if(start) {
				   start = false;
				   $('body').css({"cursor":"default"});
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
