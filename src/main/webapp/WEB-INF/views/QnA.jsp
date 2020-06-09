<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#footer{ 
	position: absolute; 
	width:100%; 
	left:0px; 
	bottom:0px; 
	background-color:#474747;
	height: 150px
} 
</style>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top:88px">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color:blue">Q&A</h2>
				</div>
				<p class="lead">회원님의 궁금증을 풀어드립니다.</p>
				<hr>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">▶ 게시판은 누구나 이용할 수 있나요?</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							저희 웹 사이트의 게시판은 <strong>누구나</strong> 이용할 수 있습니다.
						</div>
					</div>
					<div class="panel-heading mt-3">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">▶ 고객센터 전화번호가 궁금해요.</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse in">
						<div class="panel-body">고객센터의 전화번호는 <strong>02)000-0000</strong> 입니다.</div>
					</div>
					<div class="panel-heading mt-3">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">▶ 한 번 지워진 게시물은 복구가 불가능한가요?</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse in">
						<div class="panel-body">
							한 번 지워진 게시물은 복구가 <strong>불가능</strong> 합니다. 하지만 서버 내 데이터베이스에 기록됩니다.
						</div>
					</div>
					<div class="panel-heading mt-3">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">▶ 회원 정보 수정은 어디에서 할 수 있나요?</a>
						</h4>
					</div>
					<div id="collapse4" class="panel-collapse collapse in">
						<div class="panel-body">회원 정보는 회원정보수정 페이지에서 수정하실 수 있습니다.</div>
					</div>
					<div class="panel-heading mt-3">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse5">▶ 고객센터의 영업시간은 언제인가요?</a>
						</h4>
					</div>
					<div id="collapse5" class="panel-collapse collapse in">
						<div class="panel-body">
							고객센터의 영업시간은 <strong>09:00 ~ 18:00</strong> 입니다.
						</div>
					</div>
				</div>
				<div class="alert alert-warning alert-dismissible mt-3" role="alert">
					이외의 사항은 고객센터로 전화해주시면 친절히 답해드리겠습니다.
				</div>
			</main>
		</div>
	</div>
</body>
</html>