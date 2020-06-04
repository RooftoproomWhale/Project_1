<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div class="container" style="padding-top: 200px;padding-bottom: 300px;">
	
	<!-- 작성하기 버튼 -->
	<div class="row" style="margin-bottom: 10px">
		<c:if test="" var="admin">
		<div class="col-md-12 text-right">
			<a href="<c:url value='#'/>"
				class="btn btn-default">등록</a>
		</div>
		</c:if>
	</div>
	<div class="row" >
		<div class="col-md-12">
			<table class="table table-hover text-center">
				<tr>
					
					<th class="col-md-1 text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="col-md-1 text-center">작성자</th>
					<th class="col-md-2 text-center">등록일</th>
				</tr>
				<c:if test="${empty list}" var="isEmpty">
					<tr>
						<td colspan="4">등록된 공지가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty}">
					<c:forEach items="${list}" var="item" varStatus="loop">
=======
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
<html>
<head>
<title>게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/sidebar.css">
</head>
<body>
	<div class="container" style=" padding-top:88px;" >
		<div class="row ">
			<main id="main">
				<div class="page-header">
					<h2>자유게시판</h2>
				</div>
				<p class="lead">홈스피탈 게시판</p>
				<div style="max-width: 1300px; text-align: right;">
					<a href="./boardWrite.html" class="btn btn-primary float-right">글쓰기</a>
				</div>
				<hr>
				<table class="table table-striped" style="max-width: 1300px;">
					<thead>
>>>>>>> branch 'master' of https://github.com/RooftoproomWhale/Project_1.git
						<tr>
							<th scope="col" class="mobile" style="width: 55px; text-align: center;">번호</th>
							<th scope="col" class="mobile" style="text-align: center;">제목</th>
							<th scope="col" class="mobile" style="width: 80px; text-align: center;">작성자</th>
							<th scope="col" class="mobile" style="width: 120px; text-align: center;">날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">5</th>
							<td><a href="./boardView.html" style="color: #000000;">윤승중</a></td>
							<td class="mobile" style="text-align: center;">윤승중</td>
							<td class="mobile" style="text-align: center;">2018-01-05</td>
						</tr>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">4</th>
							<td><a href="./boardView.html" style="color: #000000;">윤승중</a></td>
							<td class="mobile" style="text-align: center;">윤승중</td>
							<td class="mobile" style="text-align: center;">2018-01-05</td>
						</tr>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">3</th>
							<td><a href="./boardView.html" style="color: #000000;">윤승중</a></td>
							<td class="mobile" style="text-align: center;">윤승중</td>
							<td class="mobile" style="text-align: center;">2018-01-05</td>
						</tr>
						<tr>
							<th class="mobile" scope="row" style="text-align: center;">2</th>
							<td><a href="./boardView.html" style="color: #000000;">윤승중</a></td>
							<td class="mobile" style="text-align: center;">윤승중</td>
							<td class="mobile" style="text-align: center;">2018-01-04</td>
						</tr>
						<tr>
							<th class="mobile" scope="row" style="text-align: center;">1</th>
							<td><a href="./boardView.html" style="color: #000000;">윤승중.</a></td>
							<td class="mobile" style="text-align: center;">윤승중</td>
							<td class="mobile" style="text-align: center;">2018-01-03</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;">
					<ul class="pagination">
						<li class="page-item"><span class="page-link">&laquo;</span>
						</li>
						<li class="page-item"><a class="page-link mobile" href="#">1</a></li>
						<li class="page-item"><a class="page-link mobile" href="#">2</a></li>
						<li class="page-item"><a class="page-link mobile" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div>
				<!-- 검색용 UI -->
				<div class="row">
					<div class="text-center">
						<form class="form-inline" method="post" action="">
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
			</main>
		</div>
	</div>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>


