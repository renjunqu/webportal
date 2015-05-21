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
    <link rel="stylesheet" href="/static/mb_interest.css">
    </header>
<body>
		  <div id="after_main"></div>
		  <div id="header">
		       <div id="backButton">&lt;</div>
		  </div>
                  <div id="main_content">
			  <div id="main_title1" class="horizon_center_align">
                                我感兴趣
			  </div>
			  <div id="main_title2" class="horizon_center_align">
                             如果你想了解更多soda最新情况<br/>
                           和体验soda分时共享生活方式请留下
			  </div>
			  <div id="main_title3" class="horizon_center_align">
			  </div>
			  <div id="main_input1"  class="horizon_center_align">
                                <input type="text" data-role="none" class="thin_input"></input>
			  </div>
			  <div id="main_input2" class="horizon_center_align">
                                <input type="text" data-role="none" class="thin_input"></input>
			  </div>
                          <div id="lb_con">
				  <div id="main_button1">
				  </div>
                          </div>
                          <div id="rb_con">
				  <div id="main_button2">
				  </div>
			   </div>
                  </div>
                  <div id="share_con">
                        <div id="share_title"></div>
                        <div id="share_btns">
                              <div id="sbtn1"></div>
                              <div id="sbtn2"></div>
                              <div id="sbtn3"></div>
                        </div>
                  </div>
                  <div id="contact_info_div">
			  <div id="contact_info"> </div>
                  </div>

         <script>
		    $(document).on("scrollstop",function(){
                         if($(document).scrollTop()==100) {
                        }  
		    });

        </script>


</body>
</html>
