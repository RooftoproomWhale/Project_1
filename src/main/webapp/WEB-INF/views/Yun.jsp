<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

.demo {
	padding: 100px 0;
}

.heading-title {
	margin-bottom: 100px;
}

#accordion .panel {
	border: none;
	background: none;
	border-radius: 0;
	box-shadow: none;
}

#accordion .panel-heading {
	padding: 0;
}

#accordion .panel-title a {
	display: block;
	font-size: 16px;
	color: #9c88b9;
	padding: 17px 40px 17px 65px;
	background: #fff;
	border: 1px solid #f3f3f3;
	border-bottom: none;
	position: relative;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed {
	background: #fafafa;
	color: #959595;
}

#accordion .panel-title a.collapsed:hover {
	color: #9c88b9;
}

#accordion .panel-title a:after, #accordion .panel-title a.collapsed:after
	{
	content: "\f068";
	font-family: FontAwesome;
	font-size: 15px;
	color: #fff;
	width: 45px;
	height: 100%;
	line-height: 54px;
	text-align: center;
	position: absolute;
	top: 0px;
	left: -1px;
	background: #9c88b9;
	transition: all .2s;
}

#accordion .panel-title a.collapsed:after {
	content: "\f067";
	color: #959595;
	background: #f4f4f4;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed:hover:after {
	background: #9c88b9;
	color: #fff;
}

#accordion .panel-title a:before {
	content: "";
	position: absolute;
	bottom: -11px;
	left: -1px;
	border-bottom: 12px solid transparent;
	border-right: 12px solid #9c88b9;
}

#accordion .panel-title a.collapsed:before {
	display: none;
}

#accordion .panel-body {
	font-size: 14px;
	color: #b7b7b7;
	padding: 0 65px 15px;
	line-height: 20px;
	margin-left: 12px;
	background: #fff;
	border: 1px solid #f3f3f3;
	border-top: none;
}
/*사이드바*/
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

@import url(https://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(https://fonts.googleapis.com/earlyaccess/nanumgothic.css);
h1, h2, h3, h4 {
  font-family: 'Jeju Gothic';
}
body {
  font-family: 'Nanum Gothic';
}

/* 실질적인 각 내비게이션 메뉴들의 색상 등을 정의 */
#sidebar .list-group-item {
    background-color: #333333;
    color: #acacac;
    border-color: #1c1c1c;
    border-left: 0;
    border-right: 0;
    border-radius: 0;
    white-space: nowrap;
}
/* 내비게이션을 아래 끝까지 나열 */
#sidebar .list-group {
    background-color: #333333;
    min-height: 100vh;
}
/* 메뉴를 선택했을 때  부모의 색상을 변경해 줌 */
#sidebar .list-group .list-group-item[aria-expanded="true"] {
  background-color: #1c1c1c;
}
/* 메뉴를 선택했을 때 자식의 색상을 변경해 줌 */
#sidebar .list-group-item:not(.collapsed) {
    background-color: #1c1c1c;
}
/* 작은 화면일 때 아이콘 선택을 가능케 함 */
#sidebar {
    overflow: hidden;
    z-index: 2;
}

@media (max-width:768px) {
    /* 작은 화면에서는 왼쪽 내비게이션 너비를 정해진 크기로 설정 */
    #sidebar {
        min-width: 35px;
        max-width: 40px;
        overflow-y: auto;
        overflow-x: visible;
        transition: all 0.25s ease;
        transform: translateX(0px);
        position: fixed;
    }
    /* 작은 화면에서 서브 메뉴를 열었을 때 글자가 보이도록 함 */
    #sidebar, #sidebar .list-group {
        min-width: 35px;
        overflow: visible;
    }
    /* 작은 화면에서 서브 메뉴를 열었을 때 정해진 너비로 보이게 함 */
    #sidebar .list-group .collapse.show, #sidebar .list-group .collapsing {
        position: relative;
        z-index: 1;
        width: 190px;
        top: 0;
    }
    /* 작아졌을 때 아이콘을 가운데 정렬해 줌 */
    #sidebar .list-group > .list-group-item {
        text-align: center;
        padding: .75rem .5rem;
    }
    #sidebar::-webkit-scrollbar { width: 0px; }
}

#main {
  height: 100vh;
  overflow-y: scroll;
}

@media (max-width:768px) {
  /* 작은 화면에서는 왼쪽 내비게이션 너비를 정해진 크기로 설정 */
  #main {
      margin-left: 38px;
  }
}

@media (max-width:560px) {
    .mobile {
      display: none;
    }
}

.boardTitle {
  background-color: #efefef;
  padding: 6px;
}

.boardContent {
  background-color: #efefef;
  height: 320px;
  overflow-y: scroll;
  padding: 6px;
}

</style>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row" style="padding-top: 100px">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>복약관리</h1>
				</div>
				<p>3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에 상의하고 사용하도록 합니다</p>
			</div>
		</div>
	</div>
	<div class="demo">
		<div class="row text-center">
			<h1 class="heading-title">복약 GUIDE</h1>
		</div>
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne"> Section 1
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> Section
									2 </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									Section 3 </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
</script>
</html>