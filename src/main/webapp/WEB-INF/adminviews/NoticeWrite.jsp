<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- SummerNote -->
	<script src="/js/summernote/summernote-bs4.min.js"></script>
    <script src="/js/summernote/lang/summernote-ko-KR.min.js"></script>
    <link rel="stylesheet" href="/css/summernote/summernote-bs4.min.css">
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
		  lang:'ko-KR',
		  height: 500,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true 
	  });
	});
</script>
	<div class="page-container">
		<div class="section__content section__content--p30"
			style="padding-top: 50px">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-10 col-md-push-2">
						<div class="card">
							<div class="card-header">
								<strong>공지사항 작성</strong>
							</div>
							<div class="card-body card-block">
								<form action="" method="post" enctype="multipart/form-data" class="form"> 
									<div class="row form-group">
										<div class="col-12 col-md-12">
											<input type="text" id="title" name="title" placeholder="제목" class="form-control"> 
											<small class="form-text text-muted"></small>
											<input type="hidden" id="user" value="${user }"/>
										</div>
									</div>
									<div class="row form-group">	
										<div class="col-12 col-md-9">
											<label for="file-input" class=" form-control-label">파일첨부</label>
											<input type="file" id="file-input" name="file-input" class="form-control-file">
										</div>
									</div>
									<div class="row form-group">
										<div class="col-12 col-md-12">
											<textarea id="summernote" name="editordata" placeholder="내용"></textarea>
										</div>
									</div>
									<div class="row">
										<a style="color: white;" class="btn btn-primary btn-lg"><i class="fa fa-dot-circle-o"></i> 작성</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>