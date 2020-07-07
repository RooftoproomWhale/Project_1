<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
#footer{
position:absolute;
top: 1300px;
width: 100%;
}
}
</style>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<div class="container" style="padding-top: 150px">
		<div class="top-button" style="padding-bottom: 5px;">
			<div class="left-area">
			</div>
			<div class="right-area" style="float:right;">
				<a class="btn btn-default" href="<c:url value='/Admin/NoticeDetail.hst?no=${list[0].noti_no -1}'/>"><span class="glyphicon glyphicon-chevron-up"></span> 이전글</a>
				<a class="btn btn-default" href="<c:url value='/Admin/NoticeDetail.hst?no=${list[0].noti_no +1}'/>"><span class="glyphicon glyphicon-chevron-down"></span> 다음글</a>
				<a class="btn btn-default" href="<c:url value='/Admin/Notice.hst'/>"><span class="glyphicon glyphicon-th-list"></span> 목 록</a>
			</div>
			<p style="clear: both;"></p> 
		</div>
		<div class="row" style="border:1px solid gray; padding: 10px 10px; border-radius: 1%;min-height: 600px;'">
			<div class="page-header" style="margin-top: 20px"> 
				<div>
					<p style="color: blue">[공지사항]</p>
					<h3>${list[0].title}</h3>
				</div>
				<div>
					<p>${list[0].mem_email}</p>
					<span>${list[0].postdate}</span>
					<span> 조회  ${list[0].hit}</span>
				</div>
			</div>
			<div class="page-body">
				<div>
					<c:if test="${not empty list[0]['file_addr']}">
					<p><img src='<c:url value="/Upload/${list[0]['file_addr']}"/>' alt="이미지"></p>
					</c:if>
					${list[0].content}
				</div>
			</div>
		</div>
		<sec:authorize access="hasRole('ROLE_ADM')">
			<a class="btn btn-default" style="float:right;" href="<c:url value='/Admin/NoticeDelete.hst?no=${list[0].noti_no}'/>">
			<span class="glyphicon glyphicon-trash" ></span> 삭제 </a>
		</sec:authorize>
	</div>
</body>
</html>