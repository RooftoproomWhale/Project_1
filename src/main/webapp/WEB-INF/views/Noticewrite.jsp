<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
</head>
<body>
	<div class="container" style="padding-top:88px">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color:blue">글 쓰기</h2>
				</div>
				<p class="lead">게시글을 작성합니다.</p>
				<hr>
				<form class="pt-3 md-3" style="max-width: 1300px">
					<div class="form-group">
						<label>제목</label> <input type="text" class="form-control" placeholder="제목을 입력하세요.">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" placeholder="내용을 입력하세요." style="height: 320px;"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">글 쓰기</button>
				</form>
			</main>
		</div>
	</div>
</body>
</html>