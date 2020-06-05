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
.sidebar-nav :nth-child(2) a {
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
	width: 80%;
}

.table-wrapper .table-default thead .write {
	text-align: left;
	color: #6e7179;
}

.table-wrapper .table-default tbody tr td :not(:first-child){
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


table {
	border-top: 3px #D5D5D5 solid;
	border-bottom: 3px #D5D5D5 solid;
	width: 80%;
	margin: 10px;
	height: 220px;
	
}


.board-util-right {
	float: right;
	height: 50px
}

.board-util {
	height: 48px;
	top: 9px;
	width: 80%;
}

.board-util button {
	height: 48px;
	width: 100px
}

#passForm {
	width: 1200px
}

.memberchange {
	margin-top: 130px;
	padding-left: 170px;

}

caption {
	font-size: 15px;
	font-weight: bold;
}
.input-inside-table{
margin-bottom: 10px
}
@media all and (min-width:500px) and (max-width:1024px){
#sidebar-wrapper{    left:-250px;}
.main{left:-150px;}
#page-wrapper{left:-150px;padding-left: 0px;margin-left: 0px}
#app{display: none}
#appdown{width: 90%;float: inherit;margin-left: 76px;margin-top: 0px}
.memberchange{padding-left: 20px;margin-left: 20px}
.board-util-right{float: left;}
.board-util-text{font-size: 5px}
.box-default{width: 100%}
}
</style>
<script>
	
</script>
<div id="page-wrapper" class="container-fluid">
<!-- 사이드 -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
		  <li class="sidebar-brand">
        <a href="#">마이페이지</a>
      </li>
		 <li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
      <li><a href="#">복약 관리</a></li>
      <li><a href="#">진료 예약 현황</a></li>
      <li><a href="#">내 질병 관리</a></li>
      <li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
		</ul>
	</div>
	<!-- 사이드 끝 -->
	
	<div class="main row" style="margin-top: 82px; padding-bottom: 100px;">
		<div class="col-md-12" style="background-color: #C2E2E8; height: 54.6px; bottom: 3px"></div>
		<section class="memberchange" style="margin-bottom: 37px">
		<div class="box-default">
		<span class="board-util-text color-blue">※ 고객님께서 입력해주신 정보를
						통하여 추후 고객 맞춤 정보 등 유익한 서비스가 제공되오니, 정확한 입력 부탁 드립니다.</span>
						</div>
			<div class="board-util board-util-top02">
				<div class="board-util-right">
					<span class="board-util-text color-red">* 필수 입력 항목</span>
				</div>
			</div>

			<div class="table-wrapper" role="form">
				<table class="table-default board-form table-member-modify">
					<caption>개인정보 수정</caption>
					<colgroup>
						<col style="width: 140px;" />
						<col />
						<col style="width: 140px;" />
						<col />
					</colgroup>
					<tbody>

						<tr>
							<th scope="row">아이디</th>
							<td style="padding-top: 20px;width: 30%">
								<div class="input-inside-table">
									<input type="text" name="" class="input-text" title="아이디"
										value="asd1234" role="textbox" readonly="readonly" />
								</div>
							</td>
							<th scope="row" style="width: 7%">이름</th>
							<td>
								<div class="input-inside-table">
									<input type="text" name="" class="input-text" title="이름"
										value="김길동" role="textbox" readonly="readonly" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">생년월일</th>
							<td>
								<div class="input-inside-table">
									<input type="text" name="" class="input-text" title="생년월일"
										value="" role="textbox" readonly="readonly" />
								</div>
							</td>

						<tr>
							<th scope="row">휴대폰번호 <span class="color-red">*</span></th>
							<td colspan="3" class="phone">

								<div class="input-inside-table" style="padding-top: 10px">
							
										<select name="hand_no1" id="hand_no1" title="휴대폰번호 앞자리"
											class="input-width-small" required="required">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
										</select>
								

									<span class="input-sign">-</span> <input type="text"
										name="hand_no2" id="hand_no2"
										class="input-text input-width-small" title="휴대폰번호 중간자리"
										role="textbox" required="required" onkeyup="number(this);"
										maxlength="4" value="1234" /> <span class="input-sign">-</span>

									<input type="text" name="hand_no3" id="hand_no3"
										class="input-text input-width-small" title="휴대폰번호 끝자리"
										role="textbox" required="required" onkeyup="number(this);"
										maxlength="4" value="5678" />
								
								

									<div class="option-check">
										<div class="input-checkbox-group ml0 is-tool-tip">
											<label class="input-checkbox input-checkbox-type02">
												<input type="checkbox" name="sms_rec_yn" id="sms_rec_yn"
												role="checkbox" onclick="" value="Y" /> <i
												aria-hidden="true"></i><span class="label-text">문자(SMS)
													수신동의</span>
											</label>
												<br/>
										</div>
									</div>

								

								</div>

							</td>
						</tr>
						<tr>
							<th scope="row">이메일주소 <span class="required">*</span></th>
							<td colspan="3" class="email">

								<div class="input-inside-table">
									<input type="text" name="email1" id="email1"
										class="input-text input-width-small07" title="input text"
										role="textbox" required="required" value="kim1512" /> <span
										class="input-sign">@</span>

								
										<input type="hidden" name="email2" value="daum.net" /><select
											name="email2SL"
											onchange="if (this.form.email2SL.selectedIndex==19) { this.form.email2Text.disabled=false;this.form.email2Text.focus();this.form.email2Text.value='';} else { this.form.email2Text.disabled=true;this.form.email2.value=this.form.email2SL[this.form.email2SL.selectedIndex].value;this.form.email2Text.value=this.form.email2SL[this.form.email2SL.selectedIndex].value;}"
											class="input-text input-width-small07" title="이메일 뒷부분">
											<option value="이메일을 선택하세요.">이메일을 선택하세요.</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="naver.com">naver.com</option>
											<option value="chol.com">chol.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="empal.com">empal.com</option>
											<option value="freechal.com">freechal.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanafos.com">hanafos.com</option>
											<option value="hanmir.com">hanmir.com</option>
											<option value="hitel.net">hitel.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="korea.com">korea.com</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="nate.com">nate.com</option>
											<option value="netian.com">netian.com</option>
											<option value="paran.com">paran.com</option>
											<option value="yahoo.com">yahoo.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
											<option value="직접입력" selected>직접입력</option>
										</select>&nbsp;&nbsp;<input type="text" name="email2Text"
											value="daum.net"
											onchange="this.form.email2.value = this.value"
											class="input-text input-width-small07" title="이메일 뒷부분" />

								
									<!-- 이메일 :  -->

								</div>

							</td>
						</tr>

						<tr>
							<th scope="row">비밀번호 확인 <span class="required">*</span></th>
							<td colspan="3">

								<div class="input-inside-table">
									<input type="password" name="pass2" id="pass2"
										class="input-text" title="비밀번호 확인" role="textbox"
										maxlength="20" onkeyup="dupCheckUserPw(this.value);" /> <span
										id="messagePw" class="input-description">비밀번호 확인을 위해
										입력해 주세요</span>
								</div>

							</td>
						</tr>

					</tbody>
				</table>
			</div>
		<div class="board-util">
		<span class="board-util-text color-blue">※ 정보를 수정하신 후 확인 버튼을 클릭하셔야 정보 수정이 완료됩니다.</span>
						<div class="board-util-right">
							<button type="button" class="btn btn-primary" role="button" onclick="Form();"><span class="button-text">확인</span></button>
							<button type="button" class="btn" role="button" onclick="back();"><span class="button-text">취소</span></button>
						</div>
					</div>	
			<div class="board-util board-util02">
				<div class="board-util-left">
			 
				</div>
			</div>
		</section>
	</div>
</div>

<script>
	function back() {
		close = confirm("취소하시겠습니까?")
		if (close) {
			$(location).attr('href', '<c:url value='/mypage/mypage.hst'/>');
		}

	}

	function Form() {

	/* 	var userPasswd = $('#userPasswd');
		if ($.trim(userPasswd.val()).length < 1
				|| $.trim(userPasswd.val()) == '') {
			alert('현재 비밀번호를 입력해 주세요.');
			userPasswd.focus();
			return;
		}
		var newuserPasswd = $('#newuserPasswd');
		if ($.trim(newuserPasswd.val()).length < 1
				|| $.trim(newuserPasswd.val()) == '') {
			alert('새 비밀번호를 입력해 주세요.');
			newuserPasswd.focus();
			return;
		}
		var userPasswdOK = $('#userPasswdOK');
		if ($.trim(userPasswdOK.val()).length < 1
				|| $.trim(userPasswdOK.val()) == '') {
			alert('새 비밀번호 확인을 입력해 주세요.');
			userPasswdOK.focus();
			return;
		}
		if ($.trim(newuserPasswd.val()) != $.trim(userPasswdOK.val())) {
			alert('새비밀번호가 일치하지 않습니다');
			userPasswdOK.focus();
			return;
		}
		*/
		var passok = $('#pass2');
		if ($.trim(passok.val()).length < 1 || $.trim(passok.val()) == '') {
			alert('비밀번호를 입력해주세요');
			passok.focus();
			return;
		}
		if (confirm('정말로 변경하시겠습니까?')) {
			$('form[name=passForm]').submit();
		} 
	}
</script>




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>