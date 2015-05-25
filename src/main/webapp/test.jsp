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
	@-webkit-keyframes webkit-rotate {

	  from {
		    transform: rotate(0deg);
            }

	  to {
		    transform: rotate(360deg);
	  }
	}
	@-moz-keyframes moz-rotate {
	  from {
		    transform: rotate(0deg);
            }

	  to {
		    transform: rotate(360deg);
	  }
	}
	@-o-keyframes old-rotate {
	  from {
		    transform: rotate(0deg);
            }

	  to {
		    transform: rotate(360deg);
	  }
	}
	@keyframes rotate {
	  from {
		    transform: rotate(0deg);
            }

	  to {
		    transform: rotate(360deg);
	  }
	}
	.rotating {

 	  -webkit-animation: webkit-rotate 2s infinite; /* Safari 4+ */
	
          -moz-animation:    moz-rotate    2s infinite; /* Fx 5+ */
	
          -o-animation:      old-rotate    2s infinite; /* Opera 12+ */
	  
          animation:         rotate        2s infinite; /* IE 10+, Fx 29+ */
	}
 
    </style>
    </head>
<body>
     <div id="main" style="width:87px;height:87px;border:0px solid;background:url('/static/mobile/images/sina_icons.png') no-repeat;background-size:87px 1700px;background-position:100% -201px;" class="rotating">
     </div>
</body>
</html>
