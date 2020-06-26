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
	bottom: 0px;
	background-color: #474747;
	height: 150px
}
</style>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top: 88px;">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: blue">Q&A</h2>
				</div>
				<p class="lead">회원님의 궁금증을 풀어드립니다.</p>
				<br />
				<div class="container">
					<!-- 점보트론(Jumbotron) -->
					<div class="jumbotron">
						<h1>
							한줄 메모 게시판<small>목록 페이지</small>
						</h1>
					</div>
					<!-- 작성하기 버튼 -->
					<div class="row" style="margin-bottom: 10px">
						<div class="col-md-12 text-right">
							<a href="<c:url value='/QnAWrite.hst'/>" class="btn btn-success">등록</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table class="table table-bordered table-hover text-center">
								<tr>
									<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
									<th class="col-md-1 text-center">번호</th>
									<th class="text-center">제목</th>
									<th class="col-md-1 text-center">작성자</th>
									<th class="col-md-2 text-center">등록일</th>
								</tr>
								<c:if test="${empty list}" var="isEmpty">
									<tr>
										<td colspan="4">등록된 게시물이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not isEmpty}">
									<c:forEach items="${list}" var="item" varStatus="loop">
										<tr>
											<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
											<td>${item.qna_no}</td>
											<td class="text-left"><a
												href='<c:url value="/Notice/QnAView?no=${item.qna_no}"/>'>${item.title}</a>
												<span class="badge">${item.commentCount}</span></td>
											<td>${item.mem_email}</td>
											<td>${item.q_date}</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<!-- column -->
					</div>
					<!-- row -->
					<!-- 페이징 -->
					<div class="row">
						<div class="col-md-12 text-center">${pagingString}</div>
					</div>
					<!-- 검색용 UI -->
					<div class="row">
						<div class="text-center">
							<form class="form-inline" method="post"
								action="<c:url value='/OneMemo/BBS/List.bbs'/>">
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