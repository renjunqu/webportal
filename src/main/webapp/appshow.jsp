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
    <link rel="stylesheet" href="/static/appshow.css" />
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
    </header>
<body>
     <script>
         var currMenu = "menu_3";
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
          <div id="main_content" class="horizon_center_align">
		  <div style="height:100%;width:50%;position:absolute;left:0px;">
			 <div id="appShow_phone1">
			 </div>
			 <div id="appShow_phone2">
			 </div>
		  </div>
		  <div style="height:100%;width:50%;position:absolute;right:0px;">
                       <div id="appShow_actions" class="center_align">
                               <div id="appShow_title" class="horizon_center_align"></div>
			       <div id="appShow_code">
			       </div>
                       </div>
		  </div>
          </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
       $(function(){
        });
   </script>
</body>
</html>
