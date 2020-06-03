<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css" rel="stylesheet">
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&autoLogAppEvents=1&version=v7.0&appId=273273647151212"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.test.js"></script>
<script src='<c:url value="/js/kakao.js"/>'></script>

<style>
body{
	padding-top: 70px;
}
.main-content{
	width: 50%;
	border-radius: 20px;
	box-shadow: 0 5px 5px rgba(0,0,0,.4);
	margin: 5em auto;
	display: flex;
}
.company__info{
	background-color: #5ca9fb;
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	color: #fff;
}
.fa-android{
	font-size:3em;
}
@media screen and (max-width: 640px) {
	.main-content{width: 90%;}
	.company__info{
		display: none;
	}
	.login_form{
		border-top-left-radius:20px;
		border-bottom-left-radius:20px;
	}
}
@media screen and (min-width: 642px) and (max-width:800px){
	.main-content{width: 70%;}
}
.row > h2{
	color:#5ca9fb;
	
}
.login_form{
	background-color: #fff;
	border-top-right-radius:20px;
	border-bottom-right-radius:20px;
	border-top:1px solid #ccc;
	border-right:1px solid #ccc;
}
form{
	padding: 0 2em;
}
.form__input{
	width: 100%;
	border:0px solid transparent;
	border-radius: 0;
	border-bottom: 1px solid #aaa;
	padding: 1em .5em .5em;
	padding-left: 2em;
	outline:none;
	margin:1em auto;
	transition: all .5s ease;
}
.form__input:focus{
	border-bottom-color: #5ca9fb;
	box-shadow: 0 0 5px rgba(0,80,80,.4); 
	border-radius: 4px;
}
.btn{
	transition: all .5s ease;
	width: 100%;
	border-radius: 30px;
	color:#5ca9fb;
	font-weight: 600;
	background-color: #fff;
	border: 1px solid #5ca9fb;
	margin-top: 1.5em;
	margin-bottom: 1em;
}
.btn:hover, .btn:focus{
	background-color: #5ca9fb;
	color:#fff;
}
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 20px;
	margin: 8px 0px;
}
.hr-sect::before,
.hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

</style>
<div class="container-fluid">
		<div class="row main-content bg-success text-center">
			<div class="col-md-4 text-center company__info">
				<span style="width: 150px;height: 150px;align-self: center;" class="company__logo"><img style="width: 100%; height: auto;" class="img-responsive" src='<c:url value="/img/logo.png"/>' alt="로고이미지"></span></h2></span>
				<h4 class="company_title">홈스피탈</h4>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
				<div class="container-fluid">
					<div class="row">
						<h2 style="margin-bottom: 0;margin-top: 20px;">로그인</h2>
					</div>
					<div class="row">
						<form id="login" control="#" class="form-group">
							<div class="row">
								<input type="text" name="id" id="id" class="form__input" placeholder="아이디">
							</div>
							<div class="row">
								<!-- <span class="fa fa-lock"></span> -->
								<input type="password" name="pass" id="pass" class="form__input" placeholder="비밀번호">
							</div>
							<div class="checkbox">
								<label for="remember_me">
									<input type="checkbox" name="saveId" id="saveId">
									아이디 저장
								</label>
							</div>
							<div class="row">
								<button class="btn" onclick="login();">로그인</button>
							</div>
						</form>
						<div class="row">
						<p>Don't have an account? <a href="#">Register Here</a></p>
					</div>
					</div>
					<div class="hr-sect">or</div>
					<div class="row">
                        <ul class="list-unstyled list-social">
                            <li style="display: inline;padding-right: 70px">
                                <div style="display: inline;" id="naver_id_login"></div>
                            </li>
                            <li style="display: inline;padding-right: 70px">
                                <a id="kakao" href="javascript:Kakao.Auth.login()">
                                    <img width="60" src='<c:url value="/img/kakao.png"/>' alt="카카오 로그인">
		                        </a>
                            </li>
                            <li style="display: inline;">
                                <a id="facebook" href="javascript:FB.login()">
                                   <img width="60" src='<c:url value="/img/facebook.png"/>' alt="페이스북 로그인">
		                        </a>
                            </li>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
	</div>
<script>
	function login(){
		var id = $('#id');
		var pass = $('#pass');
		if($.trim(id.val()) == '') {
			alert('아이디를 입력해 주세요.');
			id.focus();
			return;
		}
		if($.trim(pass.val()) == '') {
			alert('비밀번호를 입력해 주세요.');
			pass.focus();
			return;
		}
		
		$('#login').submit();
	}

</script>
	
	
<script>
	$(function(){
		Kakao.init('c0e6cc61e58211222f29b50be0f8c221');
		Kakao.isInitialized();
		

	$('#kakao').click(function() {
			Kakao.Auth.login({
				scope : 'account_email,gender',
				success : function(response) {
					console.log(response);
				},
				fail : function(error) {
					console.log(error);
				},
			});
		})

	})
</script>

<script type="text/javascript" src='<c:url value="/js/naver_login.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/facebook_login.js"/>'></script>


