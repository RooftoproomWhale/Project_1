<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<style>
/* 수정/삭제/목록 버튼 사이 간격 주기 */
.btn-success {
	margin-right: 5px;
}
</style>
<script>
// 	$(function() {
// 		//현재 글번호에 대한 코멘트 목록을 가져오는 함수-Ajax로 처리 

// 		//페이지 로드시 코멘트 목록 뿌려주기]		
// 		showComments();

// 		//코멘트 입력 및 수정처리]
// 		$('#submit').click(function() {
// 			if ($(this).val() == '등록')
// 				var action = "<c:url value='/MemoComment/BBS/Write.bbs'/>";
// 			else
// 				var action = "<c:url value='/MemoComment/BBS/Edit.bbs'/>";
// 			//ajax로 요청]
// 			$.ajax({
// 				url : action,
// 				data : $('#frm').serialize(),
// 				dataType : 'text',
// 				type : 'post',
// 				success : function(data) {
// 					console.log(data);
// 					//글 등록후 코멘트 목록 뿌져주는 함수 다시 호출
// 					showComments();
// 					//입력댓글 클리어 및 포커스 주기
// 					$('#title').val('');
// 					$('#title').focus();
// 					//글 수정후 등록버튼으로 다시 교체하기
// 					if ($('#submit').val() == '수정')
// 						$('#submit').val('등록')
// 				}
// 			});
// 		});

// 		function showComments() {

// 			$.ajax({
// 				url : "<c:url value='/MemoComment/BBS/List.bbs'/>",
// 				data : {
// 					"no" : "${record.no}",
// 					"_csrf" : "${_csrf.token}"
// 				},
// 				dataType : 'json',
// 				type : 'post',
// 				success : showComments_,
// 				error : function(e) {
// 					console.log('에러:', e)
// 				}
// 			});
// 		}
// 		;////////showComments

// 		function showComments_(data) {
// 			console.log('코맨트 목록:', data);
// 			var comments = "<h2>한줄 댓글 목록</h2>";
// 			comments += "<table class='table table-bordered'>";
// 			comments += "<tr ><th width='15%' class='text-center'>작성자</th><th width='50%' class='text-center'>코멘트</th><th class='text-center'>작성일</th><th class='text-center'>삭제</th></tr>";
// 			if (data.length == 0) {
// 				comments += "<tr><td colspan='4'>등록된 한줄 댓글이 없어요</td></tr>";
// 			}
// 			$
// 					.each(
// 							data,
// 							function(index, element) {
// 								comments += "<tr><td>" + element['NAME']
// 										+ '</td>';
// 								//if('${sessionScope.id}' == element['ID'])//씨큐리티 미 사용시
// 								if ('${username}' == element['ID'])//씨큐리티 사용시
// 									comments += "<td style='text-align:left'><span class='commentEdit' title='"+element['CNO']+"' style='cursor:pointer' >"
// 											+ element['LINECOMMENT']
// 											+ '</span></td>';
// 								else
// 									comments += "<td style='text-align:left'>"
// 											+ element['LINECOMMENT'] + '</td>';

// 								comments += "<td>" + element['CPOSTDATE']
// 										+ '</td>';
// 								comments += "<td>";
// 								//if('${sessionScope.id}' == element['ID'])
// 								if ('${username}' == element['ID'])//씨큐리티 사용시
// 									comments += "<span class='commentDelete' title='"+element['CNO']+"' style='cursor:pointer;color:green;font-size:1.4em'>삭제</span>";
// 								else
// 									comments += "<span style='color:gray;font-size:.7em'>삭제불가</span>";
// 								comments += "</td></tr>";
// 							});

// 			comments += "</table>";
// 			$('#comments').html(comments);

// 			//반드시 showComments_() 함수 안에
// 			//코멘트 제목 클릭시 코멘트 수정처리를 위한 UI변경부분]		
// 			$('.commentEdit').click(function() {
// 				console.log('클릭한 댓글의 키값(CNO):', $(this).attr('title'));
// 				//클릭한 제목으로 텍스트박스 값 설정
// 				$('#title').val($(this).html());
// 				//버튼은 등록에서 수정으로
// 				$('#submit').val('수정');
// 				//form의 hidden속성중 name="cno"값 설정
// 				$('input[name=cno]').val($(this).attr('title'));

// 			});
// 			//코멘트 삭제 처리]
// 			$(".commentDelete").click(function() {
// 				$.ajax({
// 					url : "<c:url value='/MemoComment/BBS/Delete.bbs'/>",
// 					data : {
// 						cno : $(this).attr('title'),
// 						'_csrf' : '${_csrf.token}'
// 					},
// 					type : 'post',
// 					success : function() {
// 						showComments();
// 					}
// 				});
// 			});

// 		}
// 		;

// 	});///$(function(){})
</script>

<!-- 실제 내용 시작 -->
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			한줄 메모 게시판<small>상세보기 페이지</small>
		</h1>
	</div>

	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="col-md-2 text-center">번호</th>
					<td>${list[0].qna_no}</td>
				</tr>
				<tr>
					<th class="text-center">제목</th>
					<td>${list[0].title}</td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td>${list[0].mem_email}</td>
				</tr>
				<tr>
					<th class="text-center">등록일</th>
					<td>${list[0].q_date}</td>
				</tr>
				<tr>
					<th class="text-center" colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2">${list[0].content}</td>
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
					<li><a href="<c:url value='/QnA/QnADelete.hst?no=${list[0].qna_no}'/>" class="btn btn-success">삭제</a></li>
				</c:if>

				<li><a
					href="<c:url value='/QnA/QnA.hst?nowPage=${param.nowPage}'/>"
					class="btn btn-success">목록</a></li>

			</ul>
		</div>
	</div>

</div>
<!-- container -->


<!-- 실제 내용 끝 -->

<script>
	function isDelete() {
		if (confirm("정말로 삭제 하시겠습니까?"))
			location
					.replace("<c:url value='/OneMemo/BBS/Delete.bbs?no=${record.no}'/>");

	}
</script>
