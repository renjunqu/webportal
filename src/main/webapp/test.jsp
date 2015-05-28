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
    <script type="text/javascript" src="/static/jweixin-1.0.0.js"></script>
    </head>
<body>
   <script>
      $(function(){
            alert(localtion.href.split('#')[0]);
      });
   </script>
</body>
</html>
