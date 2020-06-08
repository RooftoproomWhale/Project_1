<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.content-one, .content-to {
	border: 1px #D8D8D8 solid;
	height: 200px;
	padding: 0;
	border-radius: 1em;
	margin-bottom: 30px;
}

.content-one ul li {
	padding-left: 10px
}

.content-one
 
ul
 
li
:not
 
(
:last-child
 
){
padding-bottom
:
 
2
px
;

	
border-bottom
:
 
1
px
 
#D8D8D8
 
solid
;


}
.list-unstyled2 li:last-child {
	text-align: center;
	padding-top: 17px
}

#appdown {
	width: 300px;
	height: 75%;
	margin-top: 5px
}
/* 사이드바 래퍼 스타일 */
#page-wrapper {
/* 	padding-left: 250px; */
}

#sidebar-wrapper {
	position: fixed;
 	width: 250px;
 	height: 82%; 
 	margin-left: -250px; 
	background: #fff;
	overflow-x: hidden;
	overflow-y: auto;
	border: 1px #DAD9FF solid;
	margin-top: 79px;
}

#page-content-wrapper {
	width: 100%;
 	padding: 20px; 
	padding-top: 150px;
 	margin-left: 130px; 
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
	background: #808080;
}

.sidebar-nav li:first-child {
	background: #4d4d4d
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
	color: #fff
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #fff;
}
/*현재페이지*/
/*   .sidebar-nav :nth-child(2) a{ color: #fff;background: #B2EBF4; } */
.sidebar-nav li:not (.sidebar-brand ):hover {
	color: #fff;
	background: #B2EBF4;
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

.sidebar-brand {
	background-color: #C2E2E8;
	font-weight: bold;
	margin-top: 0px;
	margin-bottom: 0px;
}

.info {
	font-size: 1.3em;
	line-height: 3em;
}

#main {
	background-color: #B2C7CC;
	width: 100%;
	height: 48px;
	margin: 0px;
	margin-bottom: 9px;
	text-align: center;
	line-height: 48px;
	border-radius: 0.69em 0.69em 0 0;
	color: #5f6368
}

.customerSec {
	float: left;
	height: 215px;
}

.customerSec img {
	vertical-align: top;
}

.customerSec a {
	display: block;
	margin-bottom: 5px;
}

.list-unstyled1 li {
	font-size: 1.2em;
	font-weight: bold;
	color: black;
}

.list-unstyled1 span {
	font-weight: normal;
	color: #A6A6A6;
}

@media all and (min-width:500px) and (max-width:1024px) {
	#sidebar-wrapper {
/*  		left: -250px;  */
	}
	.main {
/*  		left: -150px;  */
	}
	#page-wrapper {
/* 		left: -150px;  */
 		padding-left: 0px; 
 		margin-left: 0px;
	}
	#app {
		display: none
	}
	#appdown {
		width: 90%;
		float: inherit;
		margin-left: 76px;
		margin-top: 0px
	}
}

.list-unstyled1 .list-unstyled2 {
	height: 100%;
	padding-left: 20px;
	width: 100%
}
</style>
<script>

</script>
<div id="page-wrapper" class="container-fluid">

	<div id="sidebar-wrapper" class="col-md-12">
		<h3 class="sidebar-brand"
			style="height: 90px; text-align: center; line-height: 90px; height: 120px">
			<img style="width: 100%; height: 100%"
				src="<c:url value='/img/mypages.PNG'/>">
		</h3>
		<ul class="sidebar-nav">
			<li><span class="glyphicon glyphicon-leaf" style=""><strong>김길동</strong>님</span></li>
			<li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
			<li><a href="<c:url value='/mypage/Yun.hst'/>">복약 관리</a></li>
			<li><a href="<c:url value='/mypage/ReservationList.hst'/>">진료
					예약 현황</a></li>
			<li><a href="#">내 질병 관리</a></li>
			<li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
		</ul>
	</div>

<!-- 	<div class="main row col-md-12" -->
<!-- 		style="margin-top: 82px; padding-bottom: 10px; background-color: #F3F3F3;"> -->
<!-- 		<!-- 첫번째 줄 --> -->

<!-- 		<div class="page content col-md-8" -->
<!-- 			style="padding-right: 50px; left: 60px; top: 60px"> -->

<!-- 			<div class='content-one col-md-5' style=''> -->
<!-- 				<h3 id="main">내정보</h3> -->
<!-- 				<ul class="list-unstyled1"> -->

<!-- 					<li>이름&emsp; &emsp; <span>김길동</span></li> -->
<!-- 					<li>성별&nbsp; &ensp;&emsp; <span>남성</span></li> -->
<!-- 					<li>연락처&nbsp; &ensp;&emsp; <span>010-1234-5678</span></li> -->
<!-- 					<li>E-mail &nbsp; &nbsp; <span>정보없음</span></li> -->
<!-- 					<li>나이&nbsp; &ensp;&emsp; <span>30</span></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->

<!-- 			<div class='content-one col-md-5 col-md-offset-1'> -->
<!-- 				<h3 id="main">신체정보</h3> -->
<!-- 				<ul class="list-unstyled1" style="height: 100%"> -->
<!-- 					<li>키&nbsp; &emsp; &emsp;&emsp; &ensp; <span>180cm</span></li> -->
<!-- 					<li>몸무게 &nbsp; &nbsp; &ensp;&emsp; <span>72kg</span></li> -->
<!-- 					<li>BMI &nbsp; &emsp; &ensp;&emsp; <span id=bmi></span></li> -->
<!-- 					<li>과거력 &nbsp; &ensp;&emsp; <span>수술이력, 천식</span></li> -->
<!-- 					<li>만성 질병 &nbsp; &nbsp; <span>정보없음</span></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<div class='col-md-5'> -->
<!-- 					<input class="btn btn-info" style="width: 100%; height: 50%" -->
<!-- 						type="button" value='회원정보 변경' -->
<%-- 						onclick="location.href='<c:url value='/mypage/ChangeMember.hst'/>'" /> --%>
<!-- 				</div> -->
<!-- 				<div class='col-md-5'> -->
<!-- 					<input class="btn btn-info" -->
<!-- 						style="width: 100%; height: 50%;" type="button" -->
<!-- 						value="비밀번호 변경" -->
<%-- 						onclick="location.href='<c:url value='/mypage/ChangePassword.hst'/>'" /> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</div>



<!-- 오른쪽 사이드 -->
<!-- 		<div class="page con2 col-md-3" style="padding-top: 60px"> -->
<!-- 			<img id="app" style="width: 300px; height: 600px" alt="앱사진" -->
<%-- 				src="<c:url value='/img/1111.png'/>"> <input id="appdown" --%>
<!-- 				class="btn btn-primary" type="button" value="앱 다운로드" -->
<!-- 				onclick="location.href='https://play.google.com/store/search?q=%ED%99%88%EC%8A%A4%ED%94%BC%ED%83%88'" /> -->
<!-- 		</div> -->
<!-- 	</div> -->

<script>
  $(function() {
	var bmi = 72/(180*180)*10000;
	
  $('#bmi').html(bmi.toFixed(2));
    
    });
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>