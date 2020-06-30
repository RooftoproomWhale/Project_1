<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- Main CSS-->
<link href="<c:url value='/css/theme.css'/>" rel="stylesheet" media="all">

<style>
.sticky-btn {
   position: fixed;
   bottom: 30px;
   right: 50px;
   z-index: 1231234;
   color: #ff0000
}

#fa1:hover {
   color: #ffffff
}

#fa2:hover {
   color: #ff9900
}
</style>
<body>
   <div class="sticky-btn">
      <span class="fa-stack fa-3x" data-toggle="modal"
         data-target="#chat-modal"> <%--          <i class="fa fa-circle fa-stack-2x" style=" color: #ff9900; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
         <%--         <i class="fa fa-user-md fa-stack-1x fa-inverse" style=" color: #ffffff; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
         <i id="fa1" class="fa fa-circle fa-stack-2x" style="color: #ff9900;"></i>
         <i id="fa2" class="fa fa-user-md fa-stack-1x fa-inverse"
         style="color: #ffffff;"></i>
      </span>
   </div>
   <div class="modal fade" id="chat-modal">
      <div class="modal-dialog">
         <div class="col-lg-12">
            <div
               class="au-card au-card--no-shadow au-card--no-pad m-b-40 au-card--border">
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
      </div>
   </div>
</body>
</html>
