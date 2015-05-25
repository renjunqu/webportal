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
</head>
<body>
  <style>
      .swipe {
  overflow: hidden;
  visibility: hidden;
  position: relative;
}
.swipe-wrap {
  overflow: hidden;
  position: relative;
}
.swipe-wrap > div {
  float:left;
  width:100%;
  position: relative;
}
  </style>
   <div id='slider' class='swipe'>
	  <div class='swipe-wrap'>
		    <div></div>
		    <div></div>
		    <div></div>
	  </div>
    <script>
      window.mySwipe = new Swipe(document.getElementById('slider'), {
		  startSlide: 2,
		  speed: 400,
		  auto: 3000,
		  continuous: true,
		  disableScroll: false,
		  stopPropagation: false,
		  callback: function(index, elem) {},
		  transitionEnd: function(index, elem) {}
	});
    </script>
</div>
</body>
</html>
