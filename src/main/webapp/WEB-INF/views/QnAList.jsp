<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top:1000px;
	background-color: #474747;
	height: 150px
}
.jumbotron{
  	background-size: cover;
  	text-shadow: black 0.2em 0.2em 0.2em;
  	color:white;
}
#table{
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
}
img{
	width:200px;
	height:200px;
	float:right;
}
</style>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top: 88px;">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: black">Q&A</h2>
				</div>
				<p class="lead">[ 궁금하신 점이 있으신가요? ]</p>
				<br />
				<div class="container">
				<img src="../img/111.jpg" align="right">
					<div class="jumbotron" style="background-color: white">
						<h1 style="color: #e0dada"> Homespital
						</h1>
					</div>
					<div class="row" style="margin-bottom: 10px">
						<div class="col-md-12 text-right">
							<a href="<c:url value='/QnA/ToInsertForm.hst'/>" class="btn btn-success">작성하기</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table id="table"class="table table-bordered table-hover text-center">
								<tr>
									<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
									<th style="border: hidden;" class="col-md-1 text-center">번호</th>
									<th style="border: hidden;" class="text-center">제목</th>
									<th style="border: hidden;" class="col-md-1 text-center">작성자</th>
									<th style="border: hidden;" class="col-md-2 text-center">등록일</th>
								</tr>
								<c:if test="${empty list}" var="isEmpty">
									<tr>
										<td colspan="4">등록된 게시물이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not isEmpty}">
									<c:forEach items="${list}" var="item" varStatus="loop">
										<tr class="line">
											<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
											<td style="border: hidden;">${item.qna_no}</td>
											<td style="border: hidden;" class="text-left"><a href='<c:url value="/QnA/QnAView.hst?no=${item.qna_no}"/>'>${item.title}</a></td>
											<td style="border: hidden;">${item.mem_email}</td>
											<td style="border: hidden;">${item.q_date}</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<!-- column -->
					</div>
					<!-- row -->
					<!-- 페이징 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a href="<c:url value='/QnA/QnA.hst?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="<c:url value='/QnA/QnA.hst?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="<c:url value='/QnA/QnA.hst?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div>
					<!-- 검색용 UI -->
					<div class="row">
						<div class="text-center">
							<form class="form-inline" method="post"
								action="<c:url value=''/>">
								<div class="form-group">
									<select name="searchColumn" class="form-control">
										<option value="title">제목</option>
										<option value="name">작성자</option>
										<option value="content">내용</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="searchWord" class="form-control" />
								</div>
								<button type="submit" class="btn btn-primary">검색</button>

							</form>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</html>