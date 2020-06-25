<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<div class="container" style="padding-top: 88px">
		<div class="row ">
			<main id="main">
				<div class="page-header board-util-text color-red">
					<h2 style="color: blue">상세보기</h2>
				</div>
				<p class="lead">홈스피탈 상세보기 페이지 입니다.</p>
				<div class="table table-responsive">
					<table class="table">
						<tr>
							<th class="info" style="text-align: center;">글번호</th>
							<td>${list[0].noti_no}</td>
						</tr>
						<tr>
							<th class="info" style="text-align: center;">작성자</th>
							<td>${list[0].mem_email}</td>

						</tr>
						<tr>
							<th class="info" style="text-align: center;">작성일</th>
							<td>${list[0].postdate}</td>
						</tr>
						<tr>
							<th class="info" style="text-align: center;">제목</th>
							<td colspan="3">${list[0].title}</td>
						</tr>

						<tr>
							<th class="info" style="width: 200px; height: 200px; text-align: center;">글 내용</th>
							<td colspan="3">${list[0].content}</td>
						</tr>

						<div class="row">
							<div class="col-md-offset-2 col-md-8">
								<ul id="pillMenu" class="nav nav-pills center-block"
									style="width: 205px; margin-bottom: 10px">
									<c:if test="${!isEmpty}">
										<li>
										<a href="<c:url value='/Admin/NoticeEdit.hst?no=${list[0].noti_no}&title=${list[0].title}&content=${list[0].content}'/>"
											type="button" class="btn btn-warning">수정</a></li>
										<li>
										<a href="<c:url value='/Admin/NoticeDelete.hst?no=${list[0].noti_no}'/>"
											type="button" class="btn btn-danger">삭제</a></li>
									</c:if>
										<li>
										<a href="<c:url value='/Admin/Notice.hst?no=${list[0].noti_no}'/>"
											type="button" class="btn btn-primary">목록</a></li>
								</ul>
							</div>
						</div>
					</table>
				</div>
			</main>
		</div>
	</div>
</body>
</html>