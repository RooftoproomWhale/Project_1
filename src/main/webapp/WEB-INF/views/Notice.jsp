<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
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
<script type="text/javascript">
	/* $(function() {
	 $('#notice').on('click', function(){
	 var no = $(this).children().eq(0).text().trim();
	 console.log(no);
	 $.ajax({
	 url: "<c:url value='/Admin/NoticeDetail.hst'/>",
	 data: {
	 "no" : no
	 }, //넘길 파라미터 
	 dataType: 'html',
	 async: true, // true:비동기, false:동기 
	 success: function(data){ 
	 console.log('성공');
	
	 },
	 error:function(request,status,error){
	 console.log('실패');
	 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	 } 
	 });
	 });
	 }); */
</script>
<head>

<meta charset="utf-8">
<title>공지사항</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/sidebar.css">
</head>
<body>
	<div class="container" style="padding-top: 88px;">
		<div class="row ">
			<main id="main">
				<div class="page-header board-util-text color-red">
					<h2 style="color: blue">공지사항</h2>
				</div>
				<p class="lead">홈스피탈 공지사항</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="" style="width: 55px; text-align: center;">번호</th>
							<th scope="col" class="" style="text-align: center;">제목</th>
							<th scope="col" class="" style="width: 120px; text-align: center;">작성자</th>
							<th scope="col" class="" style="width: 120px; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}" var="isEmpty">
							<tr>
								<td colspan="4">등록된 공지사항이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!isEmpty }">
							<c:forEach items="${list}" var="item">
								<tr id="notice" style="text-align: center">
									<td>${item.noti_no }</td>
									<td style="text-align: left;"><a href='<c:url value="/Admin/NoticeDetail.hst?no=${item.noti_no}"/>'>${item.title }</td>
									<td>${item.mem_email }</td>
									<td>${item.postdate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a href="<c:url value='/Admin/Notice.hst?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="<c:url value='/Admin/Notice.hst?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="<c:url value='/Admin/Notice.hst?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div>
				<!-- 검색용 UI -->
				<div style="max-width: 1300px; text-align: right;"></div>
				<!-- 검색용 UI -->
				<div class="row">
					<div class="text-center">
						<form class="form-inline" method="post" action=""
							style="margin-bottom: 20px;">
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

