<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page
        import="java.util.*,org.springframework.context.ApplicationContext"%>
<%@ page
        import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.us_header {
 position:relative;
 background:url("/static/mobile/images/header.png") no-repeat center center;
 height:100px;
 width:100%;
 border-width:1px 0px 0px 0px;
 border-top:solid #cfcfcf;
}
.us_title {
  position:relative;
  height:111px;
  width:100%;
  background:url("/static/mobile/images/usage_title.png") no-repeat center center;
}

#usage_show_div {
  position: relative;
  width:640px;
  height:911px;
}

.swipe {
  overflow: hidden;
  visibility: hidden;
  position: relative;
}
.swipe-wrap {
  overflow: hidden;
  position: relative;
  width:640px;
  background:#fff;
  height:911px;
}
.swipe-wrap > div {
  float:left;
  width:640px;
  background:#fff;
  height:911px;
  position: relative;
}

#susage_1 {
 background: url("/static/mobile/images/usage_1.png") no-repeat center center;
 background-size:100% 100%; 
}
#susage_2 {
 background: url("/static/mobile/images/usage_2.png") no-repeat center center;
 background-size:100% 100%; 
}
#susage_3 {
 background: url("/static/mobile/images/usage_3.png") no-repeat center center;
 background-size:100% 100%; 
}
#susage_4 {
 background: url("/static/mobile/images/usage_4.png") no-repeat center center;
 background-size:100% 100%; 
}

/* END required styles */

#us_navbar {
   height:20px;
   position:absolute;
   bottom:20px;
   width:200px;
   z-index:100;
}
div[id^=us_nav_] {
   position:absolute;
   width:20px;
   height:20px;
   border-radius:20px;
   border:#3da2c9 1px solid;
   background-color:#fff; 
}
#us_nav_1 {
  left:0px;
}
#us_nav_2 {
  left:60px;

}
#us_nav_3 {
  left:120px;

}
#us_nav_4 {
  left:180px;
}

.selected {
 background:#3da2c9 !important;
}

</style>
<div data-enhance="false"  class="us_header">
</div>
<div data-enhance="false"  class="us_title"></div>
<div id="usage_show_div">
	<div id="us_navbar" class="horizon_center_align">
	      <div id="us_nav_1" class="selected">
	      </div>
	      <div id="us_nav_2">
	      </div>
	      <div id="us_nav_3">
	      </div>
	      <div id="us_nav_4">
	      </div>
	</div>
	<div data-enhanced="false" id='mySwipe' class='swipe'>
	  <div data-enhanced="false" class='swipe-wrap'>
	    <div data-enhanced="false" id="susage_1"></div>
	    <div data-enhanced="false" id="susage_2"></div>
	    <div data-enhanced="false" id="susage_3"></div>
	    <div data-enhanced="false" id="susage_4"></div>
	  </div>
	</div>
</div>



<script src='/static/swipe.js'></script>
<script>
var currUsage = 1;
// pure JS
var elem = document.getElementById('mySwipe');
window.mySwipe = Swipe(elem, {
  // startSlide: 4,
  // auto: 3000,
   continuous: false,
  // disableScroll: true,
  // stopPropagation: true,
  callback: function(index, element) {
        $("#us_nav_"+currUsage).removeClass("selected"); 
        currUsage = (index+1);
        $("#us_nav_"+currUsage).addClass("selected"); 
  },
  // transitionEnd: function(index, element) {}
});

// with jQuery
// window.mySwipe = $('#mySwipe').Swipe().data('Swipe');

</script>
