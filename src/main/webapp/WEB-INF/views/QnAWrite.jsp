<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>
#footer{
position:absolute;
top: 1300px;
width: 100%;
}
</style>
<script>
$(function() {

$('#next').on('click', function(){

	var user;
	var content;
	var title;

	title = $('#text-input').val();
	content = $('#textarea-input').val();
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
<body>
	<div class="page-container">
		<div class="section__content section__content--p30"
			style="padding-top: 150px;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-10 col-md-push-2">
						<div class="card">
							<div class="card-header">
								<strong>QNA 작성</strong>
							</div>
							<input type="hidden" id="userId" value="${userId }"/>
							<div class="card-body card-block" style="padding-top:100px">
<!-- 								<form action="" method="post" enctype="multipart/form-data" -->
<!-- 									class="form-horizontal"> -->
									<div class="row form-group">
										<div class="col-12 col-md-12">
											<input type="text" id="text-input" name="text-input"
												placeholder="제목" class="form-control"> <small
												class="form-text text-muted"></small>
												<input type="hidden" id="user" value=""/>
										</div>
									</div>
									<div class="row form-group">
										<div class="col-12 col-md-12">
											<textarea name="textarea-input" id="textarea-input" rows="15"
												placeholder="내용" class="form-control"></textarea>
										</div>
									</div>
			
									<div class="">
										<button type="button" id="next" class="btn btn-primary btn-sm" style="position: absolute; right: 20px; bottom: 20px;">
												<i class="fa fa-dot-circle-o"></i> 작성
											</button>
									</div>
<!-- 								</form> -->
							</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
</script>