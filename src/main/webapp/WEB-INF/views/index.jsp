<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
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
	<div id="about">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<img src="<c:url value='/img/about.jpg'/>" class="img-responsive" alt="">
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="about-text">
						<h2>About Us</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem
							ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua.</p>
						<h3>Why Choose Us?</h3>
						<div class="list-style">
							<div class="col-lg-6 col-sm-6 col-xs-12">
								<ul>
									<li>Lorem ipsum dolor</li>
									<li>Tempor incididunt</li>
									<li>Lorem ipsum dolor</li>
									<li>Incididunt ut labore</li>
								</ul>
							</div>
							<div class="col-lg-6 col-sm-6 col-xs-12">
								<ul>
									<li>Aliquip ex ea commodo</li>
									<li>Lorem ipsum dolor</li>
									<li>Exercitation ullamco</li>
									<li>Lorem ipsum dolor</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
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
				<div class="col-md-4">
					<i class="fa fa-language"></i>
					<div class="service-desc">
						<h3></h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante
							facilisis bibendum dolor feugiat at.</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-calendar"></i>
					<div class="service-desc">
						<a href="<c:url value='/Calendar/calendar.bbs'/>"><h3>달력</h3></a>
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