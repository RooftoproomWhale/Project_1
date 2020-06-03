<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/nivo-lightbox/nivo-lightbox.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/nivo-lightbox/default.css'/>">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) 및 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
<%-- <script type="text/javascript" src="<c:url value='/js/jquery.1.11.1.js'/>"></script> --%>

<script type="text/javascript" src="<c:url value='/js/bootstrap.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
<script type="text/javascript" src="<c:url value='/js/SmoothScroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/nivo-lightbox.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jqBootstrapValidation.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/contact_me.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/main.js'/>"></script>
	

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.css'/>">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/fonts/font-awesome/css/font-awesome.css'/>"> --%>


<style>
.dropdown:hover .dropdown-menu {display: block;}
.dropdown-menu:hover .dropdown-toggle {background-color: #3e8e41;}
</style>
	
<script>

</script>
	
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll"
				href='<c:url value="/Home/ToHomePage.hst"/>'>홈스피탈</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href='<c:url value="/Notice/BBS/NoticeList.hst"/>'>Notice</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false"> Services <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/Homespital/Map.hst'/>">병원/약국
								찾기</a></li>
						<li class="divider"></li>
						<li><a href='#'>복약 관리</a></li>
						<li class="divider"></li>
						<li><a href='<c:url value="/Homespital/MedicineForm.hst"/>'>안전상비의약품</a></li>
						<li class="divider"></li>
						<li><a href="<c:url value='/Calendar/calendar.hst'/>">일정
								관리</a></li>
						<li class="divider"></li>
						<li><a href="#">예방 정보</a></li>
					</ul></li>

				<c:if test="${USER == NULL}" var="result">
					<li><a href="<c:url value='/User/Login.hst'/>"
						class="page-scroll">Login</a></li>
					<li><a href="<c:url value='/Account/SignForm.hst'/>">SignUp</a></li>
				</c:if>
				<c:if test="${!result }">
					<li><a href="<c:url value='/User/Logout.hst'/>">Logout</a></li>
					<li><a href="<c:url value='/Account/ToMypage.hst'/>">MyPage</a></li>
				</c:if>
				<!-- 				<li><a href="#FAQ" class="page-scroll">FAQ</a></li> -->
			</ul>
		</div>


	</div>


</nav>
</html>