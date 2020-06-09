<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.color-red {
	color: red;
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


caption {
	font-size: 15px;
	font-weight: bold;
}
.input-inside-table{
margin-bottom: 15px
}

#jquery-accordion-menu {
  	top: 81px;
*{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
body{background:#FFFFFF;}
.content{width:260px;margin:100px auto;}
#demo-list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	height:60px;
	width:100%;
	font-size: 14px
	}

#footer 
 	{ 
		position: absolute; 
		width:100%; 
		left:0px; 
 		bottom:0px; 
 		background-color:#474747;
 		height: 150px
 		
 	} 

</style>
<div id="page-wrapper" class="container-fluid">
	<div class="col-md-2">
		<div id="jquery-accordion-menu" class="jquery-accordion-menu">
			<div class="col-md-8 col-md-offset-2">
				<span><img style="width: 150px; height: 150px;" class="img-responsive" src='<c:url value="/img/logo.png"/>' alt="로고이미지" /></span>
			</div>
			<ul id="demo-list">
				<li class="active"><a href="<c:url value='/mypage/mypage.hst'/>"><i class="fa fa-home"></i>MYPAGE</a></li>
				<li><a href="#"><i class="fa fa-file-image-o"></i>김길동님</a>
				<li><a href="#"><i class="fa fa-cog"></i>개인정보 관리</a>
					<ul class="submenu">
						<li><a href="<c:url value='/mypage/mypage.hst'/>">내 정보 보기</a></li>
						<li><a href="<c:url value='/mypage/ChangeMember.hst'/>">내 정보 수정</a></li>
						<li><a href="<c:url value='/mypage/unmember.hst'/>">회원 탈퇴</a></li>
					</ul></li>
				<li><a href="<c:url value='/mypage/Yun.hst'/>"><i class="fa fa-suitcase"></i>복약 관리</a>
				<li><a href="<c:url value='/mypage/ReservationList.hst'/>"><i class="fa fa-envelope"></i>진료예약 현황</a></li>
				<li><a href="<c:url value='/mypage/ChangeMember.hst'/>"><i class="fa fa-envelope"></i>내 질병 관리</a></li>
			</ul>
		</div>
	</div>
	<div class="row" style="padding-left:370px">
		<div class="page-header" style="padding-top:88px; padding-left:20px">
			<h2 style="color: blue">회원 정보 수정</h2>
		</div>
		<p class="lead" style="padding-left: 20px">회원 정보 수정</p>
		<section class="memberchange">
			<div class="box-default"  style="padding-left:80px">
				<span class="board-util-text color-blue">※ 고객님께서 입력해주신 정보를
					통하여 추후 고객 맞춤 정보 등 유익한 서비스가 제공되오니, 정확한 입력 부탁 드립니다.
				</span>
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
							<th scope="row">이름</th>
							<td style="padding-top: 10px; width: 30%">
								<div class="input-inside-table">
									<input type="text" name="" class="input-text" title="이름"
										value="김길동" role="textbox" />
								</div>
							</td>
							<th scope="row" style="width: 15%; padding-left: 80px">키</th>
							<td>
								<div class="input-inside-table">
									<input type="text" name="" class="input-text" title="키"
										value="180kg" role="textbox" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">나이</th>
							<td>
								<div class="input-inside-table">
									<select style="width: 176px; height: 24px;" title="나이"
										class="input-width-small07">
										<option>나이</option>
										<option value="">10세 이하</option>
										<option value="">10대</option>
										<option value="">20대</option>
										<option value="">30대</option>
										<option value="">40대</option>
										<option value="">50대</option>
										<option value="">60대</option>
										<option value="">70대</option>
										<option value="">80대</option>
										<option value="">90대</option>
									</select>
								</div>
							</td>
							<th scope="row" style="padding-left: 80px">몸무게</th>
							<td>
								<div class="input-inside-table">
									<input type="text" name="" class="input-text" title="몸무게"
										value="70kg" role="textbox" />
								</div>
							</td>
						</tr>
						<tr>

							<th scope="row" style="width: 15%; margin-top: 6px">성별</th>
							<td>
								<div class="input-inside-table">
									<select style="width: 176px; height: 24px;" title="성별"
										class="input-width-small07">
										<option>성별</option>
										<option value="">남자</option>
										<option value="">여자</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">휴대폰번호 <span class="color-red">*</span></th>
							<td colspan="3" class="phone">

								<div class="input-inside-table" style="padding-top: 10px;">

									<select name="hand_no1" id="hand_no1" title="휴대폰번호 앞자리"
										class="input-width-small" required="required">
										<option value="">선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> <span class="input-sign">-</span> <input type="text"
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
											</label> <br />
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
										class="input-sign">@</span> <input type="hidden" name="email2"
										value="daum.net" /><select name="email2SL"
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
				<span class="board-util-text color-blue">※ 정보를 수정하신 후 확인 버튼을
					클릭하셔야 정보 수정이 완료됩니다.</span>
				<div class="board-util-right">
					<button type="button" class="btn btn-primary" role="button"
						onclick="Form();">
						<span class="button-text">확인</span>
					</button>
					<button type="button" class="btn" role="button" onclick="back();">
						<span class="button-text">취소</span>
					</button>
				</div>
			</div>
			<div class="board-util board-util02">
				<div class="board-util-left"></div>
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
<script src="<c:url value='/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>
<script type="text/javascript">
	(function($) {
		$.expr[":"].Contains = function(a, i, m) {
			return (a.textContent || a.innerText || "").toUpperCase().indexOf(
					m[3].toUpperCase()) >= 0;
		};
		function filterList(header, list) {

			var form = $("<form>").attr({
				"class" : "filterform",
				action : "#"
			}), input = $("<input>").attr({
				"class" : "filterinput",
				type : "text"
			});
			$(form).append(input).appendTo(header);
			$(input).change(
					function() {
						var filter = $(this).val();
						if (filter) {
							$matches = $(list).find(
									"a:Contains(" + filter + ")").parent();
							$("li", list).not($matches).slideUp();
							$matches.slideDown();
						} else {
							$(list).find("li").slideDown();
						}
						return false;
					}).keyup(function() {
				$(this).change();
			});
		}
		$(function() {
			filterList($("#form"), $("#demo-list"));
		});
	})(jQuery);
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

	});

	$(function() {

		$("#demo-list li").click(function() {
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		})
	})
</script>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>