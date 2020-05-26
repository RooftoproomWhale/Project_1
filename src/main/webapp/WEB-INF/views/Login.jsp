<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*custom font*/
@import url(https://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {margin: 0; padding: 0;}

html {
   height: 100%;
   /*Image only BG fallback*/
   
   /*background = gradient + image pattern combo*/
   background: #white;
}

body {
   font-family: montserrat, arial, verdana;
   padding-top:120px;
}
/*form styles*/
#msform {
   width: 1000px;
   margin: 60px auto;
   text-align: center;
   position: relative;
}
#msform fieldset {
   background: #white;
   border: 0 none;
   border-radius: 3px;
   box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
   padding: 20px 30px;
   box-sizing: border-box;
   width: 80%;
   margin: 0 10%;
   
  
   /*stacking fieldsets above each other*/
   position: relative;
}

/*inputs*/
#msform input[type="text"],#msform input[type="password"] {
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 70%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 25px;
   height: 60px;
}


/*buttons*/
#msform .action-button {
   width: 70%;
   background: #608dfd;
   font-weight: bold;
   font-size: 30px;
   color: white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
   height: 60px;
   border-radius : 7px 7px 7px 7px;
}
#msform .action-button:hover, #msform .action-button:focus {
   
   box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
   font-size: 50px;
   text-transform: uppercase;
   color: #2C3E50;
   margin-bottom: 30px;
}

.text-center {
	text-align: center;
	padding-bottom: 5px;
}

.hr-style {
	background-color: #e2e2e2;
	width: 100%;
	
}


</style>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&autoLogAppEvents=1&version=v7.0&appId=273273647151212"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.test.js"></script>

<div class="container">
	<!-- multistep form -->
	<form id="msform" action="#" method="post">
	  <fieldset>
		<img style="width:80px;height:80px;padding-bottom: 10px" src="<c:url value="/img/logo.png"/>">
		<h1 class="fs-title" style="display:inline;vertical-align: middle;font-weight: bold;">홈스피탈</h2>
	       <input type="text" id="id" name="id" placeholder="아이디" />
	       <span id="span1"></span>
	       <input type="password" id="pass" name="pass" placeholder="비밀번호" />
	       <span id="span2"></span>
	       <input type="submit" class="action-button" name="login" value="로그인" />
	       <hr class="hr-style" noshade />
			<div class="text-center">
				<div id="naver_id_login"></div>
				<!-- <a href="${ naver_url }"><img width="300" src='<c:url value="/img/naver.png"/>' alt="네이버 로그인"></a>  -->
			</div>
			<div class="text-center">
				<a href="${ google_url }"><img width="300" he src='<c:url value="/img/google.png"/>' alt="구글 로그인"></a>
			</div>
			<div class="text-center">
				<a href="javascript:FB.login()"><img width="300" src='<c:url value="/img/facebook.png"/>' alt="페이스북 로그인"></a>
			</div>
			<div id="status">
			</div>
		</fieldset>
	</form>
</div>

<script type="text/javascript" src='<c:url value="/js/naver_login.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/facebook_login.js"/>'></script>
