<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
	
<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/nivo-lightbox/nivo-lightbox.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/nivo-lightbox/default.css'/>">
<link href="<c:url value='/vendor/font-awesome-4.7/css/font-awesome.min.css'/>" rel="stylesheet" media="all">
<link href="<c:url value='/vendor/font-awesome-5/css/fontawesome-all.min.css'/>" rel="stylesheet" media="all">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.24/themes/base/jquery-ui.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
<%-- <script type="text/javascript" src="<c:url value='/js/jquery.1.11.1.js'/>"></script> --%>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>


<script type="text/javascript" src="<c:url value='/js/bootstrap.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
<script type="text/javascript" src="<c:url value='/js/SmoothScroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/nivo-lightbox.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jqBootstrapValidation.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/contact_me.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/js/main.js'/>"></script> --%>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<%--<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>--%>


<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.css'/>">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/fonts/font-awesome/css/font-awesome.css'/>"> --%>
</head>
<body>
<div class="col-lg-12">
            <div class="au-card au-card--no-shadow au-card--no-pad m-b-40 au-card--border">
               <div class="au-card-title"
                  style="background-image: url('images/bg-title-02.jpg');">
                  <div class="bg-overlay bg-overlay--blue"></div>
                  <h3>
                     <i class="zmdi zmdi-comment-text"></i>Chat
                  </h3>
                  <button class="au-btn-plus">
                     <i class="zmdi zmdi-plus"></i>
                  </button>
               </div>
               <div class="au-inbox-wrap">
                  <div class="au-chat au-chat--border">
                     <div class="au-chat__title">
                        <div class="au-chat-info">
                           <div class="avatar-wrap online">
                              <div class="avatar avatar--small">
                                 <img src="<c:url value='/img/logo.png'/>">
                              </div>
                           </div>
                           <span class="nick"> <a href="#">홈스피탈</a>
                           </span>
                        </div>
                     </div>
                     <sec:authorize access="hasRole('ROLE_MEM')">
                     	 <sec:authentication var="principal" property="principal" />﻿
	                     <iframe
	                         style="min-height: 60vh;"
	                         width="100%"
	                         height="90%"
	                         src="https://6196063517c0.ngrok.io?mem_email=${principal.username}">
	                     </iframe>
	                 </sec:authorize>
	                 <sec:authorize access="isAnonymous()">
	                 	<div class="au-chat__content au-chat__content2 js-scrollbar5">
							<div class="recei-mess-wrap">
								<div class="recei-mess__inner">
									<div class="avatar avatar--tiny">
										<img src="<c:url value='/img/logo.png'/>">
									</div>
									<div class="recei-mess-list">
										<div class="recei-mess">안녕하세요 홈스피탈 입니다.</div>
										<div class="recei-mess">챗봇 서비스는 로그인 후에 이용 가능합니다 로그인해주세요!</div>
									</div>
								</div>
							</div>
						</div>
						<div class="au-chat-textfield">
							<form class="au-form-icon">
								<input class="au-input au-input--full au-input--h65"
									type="text" disabled>
								<button class="au-input-icon">
									<i class="far fa-paper-plane"></i>
								</button>
							</form>
						</div>
	                 </sec:authorize>
                  </div>
               </div>
            </div>
         </div>
</body>
</html>