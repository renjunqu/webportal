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
    <link rel="stylesheet" href="/static/feature.css" />
         <!--[if lt IE 9]>
	  <script src="/static/html5shiv.js"></script>
	  <script src="/static/respond.min.js"></script>  
	<![endif]-->
    </header>
<body>
     <script>
         var currMenu = "menu_2";
     </script>
     <%@ include file="header.jsp"%> 
     <div id="main">
        <div id="feature_title">
             <div id="feature_title_content" class="center_align">
             </div>
        </div>
		<div id="feature_show" class="horizon_center_align">
			<div style="position:absolute;top:0px;left:0px;width:50%;height:50%;">
			    <div id="feature_1" class="center_align">
			    </div>
			</div>
			<div style="position:absolute;top:0px;right:0px;width:50%;height:50%;">
			    <div id="feature_2" class="center_align">
			    </div>
			</div>
			<div style="position:absolute;bottom:0px;left:0px;width:50%;height:50%;">
			    <div id="feature_3" class="center_align">
			    </div>
			</div>
			<div style="position:absolute;bottom:0px;right:0px;width:50%;height:50%;">
			    <div id="feature_4" class="center_align">
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
