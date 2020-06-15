<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
<html>
<style>
#footer 
 	{ 
		position: absolute; 
		width:100%; 
		left:0px; 
 		bottom:0px; 
 		background-color:#474747;
 		height: 150px
 		
 	} 
</style>
<head>
<meta charset="utf-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/sidebar.css">
</head>
<body>
	<div class="container" style=" padding-top:88px;" >
		<div class="row ">
			<main id="main">
				<div class="page-header board-util-text color-red">
					<h2 style="color:blue">공지사항</h2>
				</div>
				<p class="lead">홈스피탈 공지사항</p>
				<table class="table table-striped" style="max-width: 1300px;">
					<thead>
						<tr>
							<th scope="col" class="" style="width: 55px; text-align: center;">번호</th>
							<th scope="col" class="" style="text-align: center;">제목</th>
							<th scope="col" class="" style="width: 80px; text-align: center;">작성자</th>
							<th scope="col" class="" style="width: 120px; text-align: center;">날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="" style="text-align: center;">9</th>
							<td><a href="<c:url value='/Homespital/NoticeSubmit.hst'/>" style="color: #000000;">2020-04-22 병원 회원 개인정보처리방침 변경 안내 (시행일 : 2020-05-06)</a></td>
							<td class="" style="text-align: center;">윤승중</td>
							<td class="" style="text-align: center;">2018-01-05</td>
						</tr>
						<tr>
							<th scope="row" class="" style="text-align: center;">6</th>
							<td><a href="./boardView.html" style="color: #000000;">	2020-04-22 일반 회원 이용약관 변경 안내 (시행일 : 2020-05-06)</a></td>
							<td class="" style="text-align: center;">윤승중</td>
							<td class="" style="text-align: center;">2018-01-05</td>
						</tr>
						<tr>
							<th scope="row" class="" style="text-align: center;">5</th>
							<td><a href="./boardView.html" style="color: #000000;">	개정 전 개인정보 취급방침</a></td>
							<td class="" style="text-align: center;">윤승중</td>
							<td class="" style="text-align: center;">2018-01-05</td>
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
				<div style="max-width: 1300px; text-align: right;">
<%-- 		 			 <a href="<c:url value='/Notice/QnA.hst'/>" class="btn btn-primary float-right">Q&A</a> --%>
<%-- 		 			<a href="<c:url value='/Notice/Noticewrite.hst'/>" class="btn btn-primary float-right">글쓰기</a> --%>
<%-- 					<a href="<c:url value='/Admin/TEST2.hst'/>" class="btn btn-primary float-right">작성</a> --%>
				
				</div>
				<!-- 검색용 UI -->
				<div class="row">
					<div class="text-center">
						<form class="form-inline" method="post" action="" style="margin-bottom: 20px;">
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

</body>
</html>


