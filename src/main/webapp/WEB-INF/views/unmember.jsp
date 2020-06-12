<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>회원탈퇴</title>

<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />

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

#regForm {
	width: 1200px
}

#contents {
	margin-top: 140px;
	padding-left: 50px;
	margin-bottom: 167px;
}

caption {
	font-size: 15px;
	font-weight: bold;
}
/*사이드바*/
#jquery-accordion-menu {
  	top: 81px;
}
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

</head>
<body>
	<div class="container-fluid">
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
					<li><a href="<c:url value='/mypage/administration.hst'/>"><i class="fa fa-suitcase"></i>복약 관리</a>
					<li><a href="<c:url value='/mypage/ReservationList.hst'/>"><i class="fa fa-envelope"></i>진료예약 현황</a></li>
					<li><a href="<c:url value='/mypage/Disease.hst'/>"><i class="fa fa-envelope"></i>내 질병 관리</a></li>
				</ul>
			</div>
		</div>

	<div class="col-md-8">
		<section id="contents">
			<div class="page-header">
				<h2 style="color: blue">회원 탈퇴</h2>
			</div>
			<p class="lead">홈스피탈 회원탈퇴</p>
			<form id="regForm" name="regForm" method="post" action="">
				<input type="hidden" name="mode" value="delete" />
				<div class="box-default">회원 탈퇴를 위하여 본인 여부를 확인하고 있습니다. 정확한 정보를
					입력해 주세요.</div>
				<div class="board-util-right">
					<span class="board-util-text color-red">* 필수 입력 항목</span>
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
</body>
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
</html>