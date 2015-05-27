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

		  <div id="mi_header">
		  </div>
                  <div id="mi_main_content">
			  <div id="mi_main_title1" class="horizon_center_align">
			  </div>
			  <div id="mi_main_title2" class="horizon_center_align">
			  </div>
			  <div id="mi_main_input1"  class="horizon_center_align">
                                <input id="mobileNo_input" type="text" data-role="none" class="thin_input"></input>
			  </div>
			  <div id="mi_main_input2" class="horizon_center_align">
                                <input id="email_input" type="text" data-role="none" class="thin_input"></input>
			  </div>
                          <div id="mi_lb_con">
				  <div id="mi_main_button1">
					    <div class="mask_div" style="display:none;">
						   <div id="load_wait_submit" class="center_align">
						   </div>
					    </div>
				  </div>
                          </div>
                          <div id="mi_rb_con">
				  <div id="mi_main_button2">
                                    <div class="mask_div" style="display:none;">
                                    </div>
				  </div>
			   </div>
                  </div>
                  <div id="mi_share_con">
                        <div id="mi_share_title" class="horizon_center_align">分享到</div>
                        <div id="mi_share_line" class="horizon_center_align"></div>
                        <div id="mi_share_btns" class="horizon_center_align">
                              <div id="mi_sbtn1"></div>
                              <div id="mi_sbtn2" class="horizon_center_align"></div>
                              <div id="mi_sbtn3"></div>
                        </div>
                  </div>
                  <div id="mi_contact_info_div">
			  <div id="mi_contact_info" > 
                                <div id="mi_weixin_code_div">
					<div id="mi_weixin_code">
					</div>
                                </div>
                                <div id="mi_weibo_code_div">
					<div id="mi_weibo_code">
					</div>
                                </div>
                                <div id="fingerprint_div">
                                               <div class="sliding_bar"> </div>
                                </div>
                          </div>
			 <div id="popup_bar"> 
                                <div>
					<div class="popup_button" id="pb_save">收藏</div>
					<div class="popup_button" id="pb_savePic">保存图片</div>
					<div class="popup_button" id="pb_scanCode">关注苏打Soda微信公众号</div>
					<div class="popup_button" id="pb_cancel">取消</div>
                                </div>
			 </div>
                  </div>
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
       $(".sliding_bar").animate({"top":"+=160px"},1800);
       setInterval(function(){
           $(".sliding_bar").css({"top":"0px"});
           $(".sliding_bar").animate({"top":"+=160px"},2000);
       },2100);
       $(function(){
             $("#mi_main_button1").click(function(){
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
             $("#mi_main_button2").click(function(){
                  if(uploading)
                     return;
                  $(this).fadeOut(100).fadeIn(100);
                  $("#mobileNo_input").val("");
                  $("#email_input").val("");
             });
             $("#fingerprint_div").on("taphold",function(){
                 $("#popup_bar").css({"display":"block"});
                 $("#popup_bar").css({"height":"0px"});
                 $("#popup_bar").animate({"height":"260px"},500);
             });
             $("#pb_cancel").on("tap",function(){
                alert("hello");
             });
             $(".popup_button").on("tap",function(){
		    $("#popup_bar").css({"display":"none"});
                    $("#popup_bar").css({"height":"0px"});
             });
        });
   </script>
