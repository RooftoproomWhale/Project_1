<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- SummerNote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src='<c:url value="/js/summernote/lang/summernote-ko-KR.js"/>'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top: 1000px;
	background-color: #474747;
	height: 150px
}
</style>
<script>
$(function() {

$('#next').on('click', function(){

	var user;
	var content;
	var title;

	title = $('#text-input').val();
	content = $('#summernote').val();
	user = $('#userId').val();
	
	console.log("user"+user)
	console.log("content"+content)
	console.log("title"+title)
	
	$.ajax({
		url: "<c:url value='/QnA/QnaInsert.hst'/>",
		data: {
			"title" : title,
			"content" : content,
			"user" : user
				}, //넘길 파라미터 
		dataType: 'html',
		async: true, // true:비동기, false:동기 
		success: function(data){ 
			console.log('성공');
			window.location.href = "<c:url value='/QnA/QnA.hst'/>";
		},
		error:function(request,status,error){
			console.log('실패');
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		} 
	});
});
});
</script>
</head>
</html>
<body>
	<div class="container" style="padding-top: 88px;">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: blue">Q&A</h2>
				</div>
				<p>회원님의 궁금증을 풀어드립니다.</p>
				<br />
				<div class="container">
					<div class="jumbotron">
						<h1>
							Homespital &nbsp;<small>Write page</small>
						</h1>
					</div>
					<div style="width: 60%; margin: auto;">
						<form method="post" action="/write">
							<input type="hidden" id="userId" value="${userId }" /> 
							<input type="text" id="text-input" name="title" style="width: 40%;" placeholder="제목" />
							<br> <br>
							<textarea id="summernote" name="content"></textarea>
							<input id="next" type="button" value="글 작성" style="float: right;" />
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>