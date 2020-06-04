<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 82%;
	margin-left: -250px;
	background: #fff;
	overflow-x: hidden;
	overflow-y: auto;
	border: 1px #DAD9FF solid;
	margin-top: 79px;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
	padding-top: 150px;
	margin-left: 130px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999;
}
/*현재페이지*/
.sidebar-nav :nth-child(6) a {
	color: #fff;
	background: #B2EBF4;
}

.sidebar-nav li:not (.sidebar-brand ):hover {
	color: #fff;
	background: #B2EBF4;
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

.sidebar-brand {
	background-color: #C2E2E8;
	margin-bottom: 0.5px;
	font-weight: bold;
}

.info {
	font-size: 1.3em;
	line-height: 3em;
}

.color-red {
	color: red;
}

.table-wrapper .line {
	border-left: 1px solid #dadada;
}

.box-default {
	font-size: 15px;
	color: #115bab;
	background-color: #D5D5D5;
	height: 70px;
	text-align: center;
	line-height: 70px;
	width: 100%
}

.table-wrapper .table-default thead .write {
	text-align: left;
	color: #6e7179;
}

.table-wrapper .table-default tbody tr td {
	position: relative;
	padding-right: 0;
	padding-left: 0;
}

.table-wrapper .table-default tbody tr td .input-conut-limit {
	position: absolute;
	bottom: 9px;
	right: 22px;
}

.table-default tr th, .table-default tr td {
	font-size: 13px
}

.default-info-heading {
	margin-bottom: 20px;
}

.button-blue {
	background: #57a5df;
}

table {
	border-top: 3px #D5D5D5 solid;
	border-bottom: 3px #D5D5D5 solid;
	width: 100%;
	margin: 10px;
	height: 220px
}

.board-util-right {
	float: right;
	height: 50px
}

.board-util {
	height: 48px;
	top: 9px;
}

.board-util button {
	height: 48px;
	width: 100px
}

#regForm {
	width: 1200px
}

#contents {
	margin-top: 140px;
	padding-left: 200px;
	margin-bottom: 167px
}

caption {
	font-size: 15px;
	font-weight: bold;
}

@media all and (min-width:500px) and (max-width:1024px) {
	#sidebar-wrapper {
		left: -250px;
	}
	.main {
		left: -150px;
	}
	#page-wrapper {
		left: -150px;
		padding-left: 0px;
		margin-left: 0px
	}
	#app {
		display: none
	}
	#appdown {
		width: 90%;
		float: inherit;
		margin-left: 76px;
		margin-top: 0px
	}
	#contents {
		padding-left: 20px;
		margin-left: 20px
	}
	.board-util-right {
		float: left;
	}
}
</style>
<script>

</script>
<div id="page-wrapper" class="container-fluid">
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#">마이페이지</a></li>
			<li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
			<li><a href="#">복약 관리</a></li>
			<li><a href="#">진료 예약 현황</a></li>
			<li><a href="#">내 질병 관리</a></li>
			<li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
		</ul>
	</div>
	<div class="main row" style="margin-top: 82px; padding-bottom: 15px;">
		<div class="col-md-12"
			style="background-color: #C2E2E8; height: 54.6px; bottom: 3px"></div>
		<section id="contents">
			<!-- /////////////////////////////////// Contents [S] -->

			<h2 class="hidden">회원탈퇴</h2>

			<form id="regForm" name="regForm" method="post" action="">
				<input type="hidden" name="mode" value="delete" />

				<div class="box-default">회원 탈퇴를 위하여 본인 여부를 확인하고 있습니다. 정확한 정보를
					입력해 주세요.</div>

				<div class="board-util board-util-top">
					<div class="board-util-right">
						<span class="board-util-text color-red">* 필수 입력 항목</span>
					</div>
				</div>

				<div class="table-wrapper">
					<table class="table-default board-form">
						<caption>회원탈퇴</caption>
						<colgroup>
							<col style="width: 140px" />
							<col />
						</colgroup>
						<tbody>
							<!--<tr>
									<th scope="row">아이디 <span class="required">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="text" name="userId" id="userId" class="input-text" title="아이디" role="textbox" />
										</div>

									</td>
								</tr>-->
							<tr>
								<th scope="row">이름 <span class="color-red">*</span></th>
								<td>

									<div class="input-inside-table">
										<input type="text" name="userName" id="userName"
											class="input-text" title="이름" role="textbox" />
									</div>

								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <span class="color-red">*</span></th>
								<td>

									<div class="input-inside-table">
										<input type="password" name="userPasswd" id="userPasswd"
											class="input-text" title="비밀번호" role="textbox" />
									</div>

								</td>
							</tr>
							<tr>
								<th scope="row">탈퇴사유</th>
								<td>

									<div class="input-inside-table">
										<textarea name="outReason" id="outReason"
											class="input-textarea" title="탈퇴사유" role="textbox"
											aria-multiline="true"></textarea>
									</div>

								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="board-util">
					<div class="board-util-right">
						<button type="button" class="btn btn-primary" role="button"
							onclick="Form();">
							<span class="button-text">회원탈퇴</span>
						</button>
						<button type="button" class="btn" role="button" onclick="back();">
							<span class="button-text">취소</span>
						</button>
					</div>
				</div>

			</form>

		</section>
	</div>
</div>
<script>


  	function back(){
  			close=confirm("취소하시겠습니까?")
		if(close){
  		$(location).attr('href', '<c:url value='/mypage/mypage.hst'/>');
  			}
  			
  	}

  	function Form() {
 
  		var userName = $('#userName');
  		if($.trim(userName.val()).length < 1 || $.trim(userName.val()) == '') {
  			alert('이름을 입력해 주세요.');
  			userName.focus();
  			return;
  		}
  		var userPasswd = $('#userPasswd');
  		if($.trim(userPasswd.val()).length < 1 || $.trim(userPasswd.val()) == '') {
  			alert('비밀번호를 입력해 주세요.');
  			userPasswd.focus();
  			return;
  		}
  		var outReason = $('#outReason');
  		if($.trim(outReason.val()).length >= 100) {
  			alert('탈퇴사유는 100자 미만으로 입력해 주세요.');
  			outReason.focus();
  			return
  		}

  		if(confirm('정말로 탈퇴하시겠습니까?')) {
  			$('form[name=regForm]').submit();
  		}
  	}

  
  </script>




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>