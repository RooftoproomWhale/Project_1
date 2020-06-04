<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>

/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
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
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999;
}
/*현재페이지*/
.sidebar-nav :nth-child(6) a {
	color: #fff;
	background: #B2EBF4;
}

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
	margin-bottom: 0.5px;
	font-weight: bold;
}

.info {
	font-size: 1.3em;
	line-height: 3em;
}

.color-red {
	color: red;
}

.table-wrapper .line {
	border-left: 1px solid #dadada;
}

.box-default {
	font-size: 15px;
	color: #115bab;
	background-color: #D5D5D5;
	height: 70px;
	text-align: center;
	line-height: 70px;
	width: 100%
}

.table-wrapper .table-default thead .write {
	text-align: left;
	color: #6e7179;
}

.table-wrapper .table-default tbody tr td {
	position: relative;
	padding-right: 0;
	padding-left: 0;
}

.table-wrapper .table-default tbody tr td .input-conut-limit {
	position: absolute;
	bottom: 9px;
	right: 22px;
}

.table-default tr th, .table-default tr td {
	font-size: 13px
}

.default-info-heading {
	margin-bottom: 20px;
}

.button-blue {
	background: #57a5df;
}

table {
	border-top: 3px #D5D5D5 solid;
	border-bottom: 3px #D5D5D5 solid;
	width: 100%;
	margin: 10px;
	height: 220px
}

.board-util-right {
	float: right;
	height: 50px
}

.board-util {
	height: 48px;
	top: 9px;
}

.board-util button {
	height: 48px;
	width: 100px
}

#regForm {
	width: 1200px
}

#contents {
	margin-top: 140px;
	padding-left: 200px;
	margin-bottom: 167px
}

caption {
	font-size: 15px;
	font-weight: bold;
}

@media all and (min-width:500px) and (max-width:1024px) {
	#sidebar-wrapper {
		left: -250px;
	}
	.main {
		left: -150px;
	}
	#page-wrapper {
		left: -150px;
		padding-left: 0px;
		margin-left: 0px
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
	#contents {
		padding-left: 20px;
		margin-left: 20px
	}
	.board-util-right {
		float: left;
	}
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="page-wrapper" class="container-fluid">
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#">마이페이지</a></li>
			<li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
			<li><a href="#">복약 관리</a></li>
			<li><a href="#">진료 예약 현황</a></li>
			<li><a href="#">내 질병 관리</a></li>
			<li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
		</ul>
	</div>
	<div class="main row" style="margin-top: 82px; padding-bottom: 15px;">
		<div class="col-md-12"
			style="background-color: #C2E2E8; height: 54.6px; bottom: 3px"></div>
	</div>
</div>
</html>