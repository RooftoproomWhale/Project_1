<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 수정/삭제/목록 버튼 사이 간격 주기 */
.btn-success {
	margin-right: 5px;
}

#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top: 1000px;
	background-color: #474747;
	height: 150px 
}

.jumbotron {
	background-size: cover;
	text-shadow: black 0.2em 0.2em 0.2em;
	color:white;
}
img{
	width:200px;
	height:200px;
	float:right;
}
</style>
<script>
	$(function() {
		//현재 글번호에 대한 코멘트 목록을 가져오는 함수-Ajax로 처리 

		//페이지 로드시 코멘트 목록 뿌려주기]		
		/* showComments(); */

		//코멘트 입력 및 수정처리]
		$('#submit').click(function() {
			if ($(this).val() == '등록') {
				var action = "<c:url value='/QnA/InsertAnswer.hst'/>";
				var answer = $('#answer').val();
				var no = $('#no').html();
			} else {
				var action = "<c:url value='/QnA/comEdit.hst'/>";
				var answer = $('#answer').val();
				var no = $('#no').html();
			}

			//ajax로 요청]
			console.log("answer: " + answer);
			console.log("no: " + no);
			$.ajax({
				url : action,
				data : {
					"answer" : answer,
					"no" : no
				},
				dataType : 'text',
				type : 'get',
				success : function(data) {
					console.log("성공");
					console.log(data);
					window.location.href = "<c:url value='/QnA/QnAView.hst?no=" + no + "'/>";
				},
				error : function(request, status, error) {
					console.log('실패');
					alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		});
	});///$(function(){})
</script>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top: 88px">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: black">Q&A</h2>
				</div>
				<p class="lead">[ 궁금하신 점이 있으신가요? ]</p>
				<br />
				<div class="container" >
				<img src="../img/111.jpg" align="right">
					<div class="jumbotron" style="background-color: white">
						<h1 style="color: #e0dada"> Homespital </h1>
					</div>

					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<table class="table table-bordered table-striped">
								<tr>
									<th class="col-md-2 text-center" style="border: hidden;">번호</th>
									<td style="border: hidden;" id="no">${list[0].qna_no}</td>
								</tr>
								<tr>
									<th class="text-center" style="border: hidden;">제목</th>
									<td style="border: hidden;">${list[0].title}</td>
								</tr>
								<tr>
									<th class="text-center" style="border: hidden;">작성자</th>
									<td style="border: hidden;">${list[0].mem_email}</td>
								</tr>
								<tr>
									<th class="text-center" style="border: hidden;">등록일</th>
									<td style="border: hidden;">${list[0].q_date}</td>
								</tr>
								<tr>
									<th class="text-center" colspan="2" style="border: hidden;">내용</th>
								</tr>
								<tr>
									<td style="border: hidden;" colspan="2">${list[0].content}</td>
								</tr>
							</table>
						</div>	
					</div>
					<!-- row -->
					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
							<ul id="pillMenu" class="nav nav-pills center-block"
								style="width: 205px; margin-bottom: 10px">
								<c:if test="${username == list[0].mem_email}">
									<li><a
										href="<c:url value='/QnA/QnAToEditForm.hst?no=${list[0].qna_no}&title=${list[0].title}&content=${list[0].content}&q_date=${list[0].q_date}&mem_email=${list[0].mem_email}'/>"
										class="btn btn-success">수정</a></li>
									<li><a
										href="<c:url value='/QnA/QnADelete.hst?no=${list[0].qna_no}'/>"
										class="btn btn-success">삭제</a></li>
								</c:if>

								<li><a href="<c:url value='/QnA/QnA.hst?nowPage=${param.nowPage}'/>" class="btn btn-success">목록</a></br></li>
							</ul>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<div class="text-center">
					<!-- 한줄 코멘트 입력 폼-->
					<h2>Q&A 답변</h2>
					<form name="replyForm" method="post">
						<input type="hidden" name="cno" />
					</form>
					<div class="row" id="comments">
						<sec:authorize access="hasRole('ROLE_ADM')">
							<input type="text" class="form-control" id="answer" name="answer" placeholder="내용을 입력하세요." value="${listA[0].answer_content}" />
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MEM')">
							<input type="text" class="form-control" id="answer" name="answer" placeholder="내용을 입력하세요." value="${listA[0].answer_content}" />
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_HOS')">
							<input type="text" class="form-control" id="answer" name="answer" placeholder="내용을 입력하세요." value="${listA[0].answer_content}" />
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<input type="text" class="form-control" id="answer" name="answer" placeholder="내용을 입력하세요." value="${listA[0].answer_content}" />
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADM')">
							<c:if test="${listA[0].answer_content == null}" var="item">
								<input class="btn btn-success" id="submit" type="button" value="등록" />
							</c:if>
							<c:if test="${!item }">
								<input class="btn btn-success" id="submit" type="button" value="수정" />
							</c:if>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

