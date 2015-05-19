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
    <style type="text/css">
div#main {
   position:absolute;
   top:0px;
   left:0px;
   bottom:0px;
   right:0px;
   overflow:auto;
}
       
    </style>
    </head>
<body>
     <div id="main">
     <div id="test" style="z-index:-19;height:110%;width:100%;border:0px solid;">
     </div>
     </div>
    <!-- <%@ include file="footer.jsp"%>  -->
    <script>
             $(function(){
		      $(window).scroll(function(){
			   console.log("scroll");
		      });
             });
             $(function(){
		      $("#main").scroll(function(){
			   console.log("scroll main");
		      });
             });
   </script>
</body>
</html>
