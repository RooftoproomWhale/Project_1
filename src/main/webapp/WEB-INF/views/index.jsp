<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<style>

        /*jssor slider bullet skin 057 css*/
        .jssorb057 .i {position:absolute;cursor:pointer;}
        .jssorb057 .i .b {fill:none;stroke:#fff;stroke-width:2200;stroke-miterlimit:10;stroke-opacity:0.4;}
        .jssorb057 .i:hover .b {stroke-opacity:.7;}
        .jssorb057 .iav .b {stroke-opacity: 1;}
        .jssorb057 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 051 css*/
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
    
</style>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Interact</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
    <script src="<c:url value="/js/jquery-1.11.3.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jssor.slider-28.0.0.min.js"/>" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<!-- Navigation
    ==========================================-->

	<!-- Header -->
	<header id="header">
		<div class="intro">
			<div class="overlay">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 intro-text">
							<h1> We Are Interact</h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Duis sed dapibus leo nec ornare diam sed commodo nibh ante
								facilisis bibendum.</p>
							<a href="#features" class="btn btn-custom btn-lg page-scroll">LearnMore</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- About Section -->
	 <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:680px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        
        <div class="img-thumbnail" data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:680px;height:380px;overflow:hidden;">
            <div data-p="680">
                <img  data-u="image" src="<c:url value="/img/1.jpg"/>" />
                
            </div>
            <div data-p="680">
              <img  data-u="image" src='<c:url value="/img/2.jpg"/>' />
              
            
            </div>
            <div data-p="680">
                <a href="https://www.naver.com"><img  data-u="image" src="<c:url value="/img/3.jpg"/>" /></a>
              </div>
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb057" style="position:absolute;bottom:16px;right:16px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:14px;height:14px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5000"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora051" style="width:65px;height:65px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora051" style="width:65px;height:65px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>


    </div>
	
	
	<!-- Services Section -->
	<div id="services" class="text-center">
		<div class="container">
			<div class="section-title">
				<h2>Our Services</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit duis sed dapibus leonec.</p>
			</div>
			<div class="row">
				<div class="col-md-4">
					<i class="fa fa-plus-square"></i>
					<div class="service-desc">
						<h3>약국 찾기</h3>
						<p>
							알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서
							찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-hospital-o"></i>
					<div class="service-desc">
						<h3>병원 찾기</h3>
						<p>	
							알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서
							찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서 찾아가 알아서
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-medkit"></i>
					<div class="service-desc">
						<h3>복용 관리</h3>
						<p>
							알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서
							먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서 먹어라 알아서
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4" style="cursor:pointer" onclick="location.href='<c:url value='/Calendar/calendar2.bbs'/>'">
					<i class="fa fa-language"></i>
					<div class="service-desc">
						<h3></h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante
							facilisis bibendum dolor feugiat at.</p>
					</div>
				</div>
				<div class="col-md-4" style="cursor:pointer" onclick="location.href='<c:url value='/Calendar/calendar.bbs'/>'">
					<i class="fa fa-calendar"></i>
					<div class="service-desc">
						<h3>달력</h3>
						<p>
							달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~달력이다~
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-pie-chart"></i>
					<div class="service-desc">
						<h3></h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante
							facilisis bibendum dolor feugiat at.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script type="text/javascript" src="js/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/SmoothScroll.js"></script>
	<script type="text/javascript" src="js/nivo-lightbox.js"></script>
	<script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="js/contact_me.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>