<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
	<link href="<c:url value="/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
   <!--   <link href="<c:url value="/bootstrap/css/default.css"/>" rel="stylesheet" type="text/css" media="all" />
	<link href="<c:url value="/bootstrap/css/font.css"/>" rel="stylesheet" type="text/css" media="all" />
   -->
    <script src="<c:url value="/bootstrap/js/script.js"/>"></script>
    <script src="https://code.jquery.com/ui/1.12.3/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
<style>
@font-face {
	font-family: 'DWImpactamin';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/DWImpactamin.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none
}



header {
	width: 100%;
	height: 150px; /* 상단바 크기조정 */
	background-color: #2056ac;
}

.container {
	width: 1200px;
	height: 50px;
	margin: 0 auto;
	position: relative;
}

.nav {
	float: left;
	width: 100%;
	padding-top: 100px;
	margin-left: 60px; /* 메뉴 위치 조정 왼쪽기준 공간 */
}

.nav>li {
	float: left;
	width: 200px; /* 메뉴 진짜 넓이 */
	box-sizing: border-box;
	mar
}

.nav>li>a {
	display: block;
	width: 200px; /* 메뉴 */
	text-align: center;
	line-height: 3.4;
	color: #fff;
	font-size: 15px;
	font-family: DWImpactamin;
}

.nav>li>a:hover {
	border-radius: 7px 7px 0px 0px; /* 메뉴에 마우스 올렸을때  윗부분 둥글게 처리*/
	color: black;
	background-color: #fff; /* 메뉴에 마우스 올렸을때 색*/
	transition-duration: 0.4s;
	font-family: 'DWImpactamin';
}

.sub {
	width: 200px; /* 메뉴 마우스 안올렸을때  */
	margin: 0 auto;
	position: absolute;
	top: 50px;
	left: 0;
	z-index: 1;
	display: none;
}

.sub>li {
	width: 200px; /* 메뉴 */
	height: 50px;
	border-bottom: 1px solid #000;
	color: #fff;
	background-color: #2056ac;
	box-sizing: border-box;
	font-family: 'DWImpactamin';
}

.sub>li:last-child {
	border-radius: 0px 0px 7px 7px; /* 서브메뉴 마지막꺼에 모서리 마감처리*/
		
}
.sub>li:last-child:hover {
	border-radius: 0px 0px 7px 7px; /* 서브메뉴 마지막꺼에 모서리 마감처리*/

}

.sub>li>a:hover {
	background-color: #fff; /* 서브메뉴 내용물에 마우스 올렸을때 */
	color: black; /* 글자색 */
	transition-duration: 0.4s;
	font-family: 'DWImpactamin';
	text-decoration: none;
/*	border: 2px solid #2056ac; */

}
.sub>li:hover{
	border:medium;
	border-color: black;
	
}
.sub>li>a {
	display: block; /* 서브메뉴 내려왔을때 내용물 */
	width: 200px;
	text-align: center;
	line-height: 3.4;
	font-size: 15px;
	font-weight: 500;
	color: white; /* 글자색*/
	font-family: 'DWImpactamin';
	
}
</style>
	
<script>
$(function(){

	$(".nav li").hover(function() {

        $(this).children("ul").stop().slideToggle(200);
        })

});
</script>

<header>
<div id="">
	<div class="container" id="">
		<ul class="nav">
			<li><a href="">메뉴1</a>
				<ul class="sub sub1">
					<li><a href="#">메뉴1-1</a></li>
					<li><a href="#">메뉴1-2</a></li>
					<li><a href="#">메뉴1-3</a></li>
				</ul></li>
			<li><a href="">메뉴2</a>
				<ul class="sub sub2">
					<li><a href="#">메뉴2-1</a></li>
					<li><a href="#">메뉴2-2</a></li>
					<li><a href="#">메뉴2-3</a></li>
				</ul></li>
			<li><a href="">메뉴3</a>
				<ul class="sub sub3">
					<li><a href="#">메뉴3-1</a></li>
					<li><a href="#">메뉴3-2</a></li>
					<li><a href="#">메뉴3-3</a></li>
				</ul></li>
			<li><a href="">메뉴4</a>
				<ul class="sub sub4">
					<li><a href="#">메뉴4-1</a></li>
					<li><a href="#">메뉴4-2</a></li>
					<li><a href="#">메뉴4-3</a></li>
				</ul></li>
			<li><a href="">메뉴5</a>
				<ul class="sub sub5">
					<li><a href="#">메뉴5-1</a></li>
					<li><a href="#">메뉴5-2</a></li>
					<li><a href="#">메뉴5-3</a></li>
				</ul></li>	
		
		
		</ul>
		
	</div>
</div>
<div style="padding-bottom: 200px"></div>
</header>


<script>
	
</script>