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
                             <div id="submit_button_icon"></div>
                             <div id="reset_button_icon"></div>
                             <div id="mobileNo_input_div">
                                   手    机<input type="text" class="thin_input"></input>
                             </div>
                             <div id="email_input_div">
                                   邮    箱<input type="text" class="thin_input"></input>
                             </div>
                         </div>
			 <div id="app_download"></div>
	       </div>
               <div id="info_div">
                    <div id="info_div_content" class="horizon_center_align">
                         <div id="portal_addr">http://www.futuremove.cn</div>
                       <div id="partner_icons">
			     <div id="weibo_icon" class="vertical_center_align"></div>
			     <div id="weixin_icon" class="vertical_center_align"></div>
			     <div id="facebook_icon" class="vertical_center_align"></div>
			     <div id="flicker_icon" class="vertical_center_align"></div>
			     <div id="linkedin_icon" class="vertical_center_align"></div>
		       </div>  
                    </div>
               </div>

     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
       $(function(){
             $("#portal_addr").click(function(){
                 location.href = "http://www.futuremove.cn";
             });
        });
   </script>
</body>
</html>
