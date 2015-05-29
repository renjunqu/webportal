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
    <title>Soda苏打 - 绿色出行,都市自由移动</title>
    <link rel="stylesheet" href="/static/main.css" />
    <link rel="stylesheet" href="/static/interest.css" />
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
    </header>
<body>
     <script>
         var currMenu = "menu_6";
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">

		<div id="main_content" class="horizon_center_align" >
			 <div id="info_submit">
                             <div id="submit_title_icon">
				     <div id="sub_title1">
				     </div>
				     <div id="sub_title2">
				     </div>
                             </div>
                             <div id="submit_info_icon"></div>
                             <div id="submit_button_icon">
                                    <div class="mask_div" style="display:none;">
					   <div id="load_wait_info" class="center_align">
					   </div>
                                    </div>
                            </div>
                             <div id="reset_button_icon">
                                    <div class="mask_div" style="display:none;">
                                    </div>
                             </div>
                             <div id="mobileNo_input_div">
                                   手    机<input id="mobileNo_input" type="text" class="thin_input"></input>
                             </div>
                             <div id="email_input_div">
                                   邮    箱<input id="email_input" type="text" class="thin_input"></input>
                             </div>
                         </div>
			 <div id="app_download">
				 <div id="techbook_download" class="horizon_center_align">
				 </div>
                         </div>
	       </div>
               <div id="info_div">
                    <div id="info_div_content" class="horizon_center_align">
                         <div id="portal_addr">http://www.futuremove.cn</div>
                       <div id="partner_icons">
			     <div id="weibo_icon" class="vertical_center_align"></div>
			     <div id="weixin_icon" class="vertical_center_align"></div>
			     <div id="douban_icon" class="vertical_center_align"></div>
			     <div id="youku_icon" class="vertical_center_align"></div>
			     <div id="zhihu_icon" class="vertical_center_align"></div>
		       </div>  
                    </div>
                    <script>
                         $("#weibo_icon").click(function(){ window.location = "http://weibo.com/p/1006065582024083/home?from=page_100606&mod=TAB#place";}); 
                         $("#weixin_icon").click(function(){ window.location = "http://mp.weixin.qq.com/s?__biz=MzAxNjU2MjgzMQ==&mid=206209637&idx=1&sn=05e7049b43f2311b78c61cb16923b141&scene=4#wechat_redirect";}); 
                         $("#douban_icon").click(function(){ window.location = "http://www.douban.com/people/128345648/";}); 
                         $("#youku_icon").click(function(){ window.location = "http://i.youku.com/u/UMzA3MDk0MzcyOA==";}); 
                         $("#zhihu_icon").click(function(){ window.location = "http://www.zhihu.com/people/su-da-soda-52";}); 
                         $("#techbook_download").click(function(){ window.location = "http://cdn.futuremove.cn/ms/Beehive_Mobility_Network_techinal_paper.pdf";}); 
                    </script> 
               </div>

     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
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

       var uploading = false;
       $(function(){
             $("#portal_addr").click(function(){
                 location.href = "http://www.futuremove.cn";
             });
             $("#submit_button_icon").click(function(){
                  if(uploading)
                     return;
                  var mobileNo = $("#mobileNo_input").val();
                  var email = $("#email_input").val();
                  console.log(mobileNo);
                  if(mobileNo.length==0 && email.length==0) {
                          alert("手机号或者EMAIL请输入其中一个。");
                          return;
                  }

                  if(mobileNo.length>0 && ifPhoneNo(mobileNo)==false)
                  {
                     alert("请输入正确的手机号");
                     return ;
                  }
                  var data = {};
                  data.mobileNo = mobileNo;
                  data.email = email;
                  uploading=true;
                  $(".mask_div").css({"display":"block"});
                 $(this).fadeOut(100).fadeIn(100);
	          $.ajax({
		      
		       url:"fanmgr/addFan.c",
		       "type":'POST',
                       data:data,
		       success:function(data,textStatus,jqXHR){
                               uploading=false;
                               $(".mask_div").css({"display":"none"});
			       if(data.result=="10000"){
				       alert("感谢您的关注。");
				} else {
				       alert("对不起，数据提交失败。");
			       }

		       },
			error:function(){
                           uploading=false;
                           $(".mask_div").css({"display":"none"});
			   alert("服务器错误");
			}
		    });
                
             });
             $("#reset_button_icon").click(function(){
                  if(uploading)
                     return;
                  $(this).fadeOut(100).fadeIn(100);
                  $("#mobileNo_input").val("");
                  $("#email_input").val("");
             });
        });
   </script>
</body>
</html>
