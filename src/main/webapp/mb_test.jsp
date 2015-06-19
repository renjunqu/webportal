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
    <script type="text/javascript" src="/static/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/static/jquery-1.11.3.min.js"></script>
</head>
<body>
      <script>
               //alert(location.href.split('#')[0]);
                   var this_url = location.href.split('#')[0];      
                   $.ajax({
                     type:"POST",
                     url:"wxjs/getSignature.c",
                     data:JSON.stringify({
                          url:this_url
                     }),
                     dataType:'json',
                     contentType:"application/json",
                     success:function(data, textStatus, jqXHR){
                                //alert(JSON.stringify(data));
                                wx.config({
			              debug:true,
				      appId:"wx0a6bcdeb9d86bdff",
				      jsApiList:["chooseWXPay"],
                                      timestamp:data.timestamp,
                                      nonceStr:data.noncestr,
                                      signature:data.signature,
                                });
                                wx.ready(function(){
                                    /*
                                    wx.scanQRCode({
					       needResult: 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
					       scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
					       success: function (res) {
					       var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
					     }
					}); */
                                    alert("we chat js config ok!!!");

                                });
                                wx.error(function(res){
                                       alert("qrj config error "+JSON.stringify(res));
                                });
                     },
                     error:function(){
                              alert("error");
                     }
                  });
      </script>
</div>
</body>
</html>
