<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		
		var no;
		var title;
		var content;
		
		$('#qnaEditBtn').on('click', function(){
			no = $('#no').val();
			title = $('#title').val();
	 		content = $('#content').val();
			console.log("content" + content);
			$.ajax({
				url: "<c:url value='/QnA/QnAEdit.hst'/>",
				data: {
					"no" : no,
					"title" : title,
					"content" : content
						}, 
				dataType: 'html',
				async: true,
				success: function(data){ 
					console.log('성공');
					window.location.href = "<c:url value='/QnA/QnAView.hst?no="+no+"'/>"; 
				},
				error:function(request,status,error){
					console.log('실패');
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
				} 
			});
		});
	});
</script>
<!-- 실제 내용 시작 -->
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			한줄 메모 게시판<small>수정 페이지</small>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="">
				<input type="hidden" id="no" value="${no}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="title"
							placeholder="제목을 입력하세요?" value="${title}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<!-- 중첩 컬럼 사용 -->
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<textarea class="form-control" id="content" rows="5"
									placeholder="내용 입력하세요">${content}</textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" id="qnaEditBtn" class="btn btn-primary">수정</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
<!-- container -->

<!-- 경고창 모달 시작 -->
<div class="modal fade" id="small-modal" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;
				</button>
				</button>
				<h4 class="modal-title">
					<span class="glyphicon glyphicon-bullhorn">경고 메시지</span>
				</h4>
				<h5 id="warningMessage"></h5>
			</div>

		</div>
	</div>
</div>

<!-- 경고창 모달 끝 -->
<!-- 실제 내용 끝 -->

<script>
  	$(function(){
  		var focusObject;
  		//모달창이 닫혔을때 발생하는 이벤트 처리 - 해당 객체에 포커스 주기
  		$('#small-modal').on('hidden.bs.modal', function (e) {
  			focusObject.focus();    			
  		});
  		
  		$('form').on('submit',function(){
  			
  			
  			if($(this).get(0).title.value==""){
  				$('#warningMessage').html('제목을 입력하세요');
  				$('#small-modal').modal('show');
  				focusObject=$(this).get(0).title; 				
  				return false;
  			}
  			
  			if($(this).get(0).content.value==""){
  				$('#warningMessage').html('내용을 입력하세요');
  				$('#small-modal').modal('show');
  				focusObject=$(this).get(0).content; 				
  				return false;
  			}
  				
  			
  		});   		
  		
  	});
  
  </script>
