<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>마이페이지</title>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />
<style type="text/css">
#jquery-accordion-menu {
  	top: 81px;
}
*{
	box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;
}

body{
	background:#FFFFFF;
}

.content{
	width:260px;margin:100px auto;
}

#demo-list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	height:60px;
	width:100%;
	font-size: 14px
}

#footer{ 
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
					<li><a href="<c:url value='/mypage/Yun.hst'/>"><i class="fa fa-suitcase"></i>복약 관리</a>
					<li><a href="<c:url value='/mypage/ReservationList.hst'/>"><i class="fa fa-envelope"></i>진료예약 현황</a></li>
					<li><a href="<c:url value='/mypage/ChangeMember.hst'/>"><i class="fa fa-envelope"></i>내 질병 관리</a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-10">
			<div class="page-header" style="padding-top: 88px; padding-left: 50px">
				<h2 style="color: blue">MyPage</h2>
			</div>
			<p class="lead" style="padding-left: 50px">홈스피탈 MyPage</p>
			<br />
			<div class="col-md-5">
				<div class="bg-transparent card-header pt-4 border-0">
					<h1 class="h1 font-weight-normal text-primary text-center mb-0" data-pricing-value="15">
						<span class="">개인정보</span>
					</h1>
					<br />
				</div>
				<div class="col-md-10 col-md-offset-1">
					<table class="table">
						<tbody style="font-size: 1.2em">
							<tr>
								<td>이름</td>
								<td>윤승중</td>
							</tr>
							<tr class="table-active">
								<td>핸드폰 번호</td>
								<td>010-4992-2814</td>
							</tr>
							<tr class="table-success">
								<td>성별</td>
								<td>남성</td>
							</tr>
							<tr class="table-warning">
								<td>나이</td>
								<td>27</td>
							</tr>
							<tr class="table-danger">
								<td>신장</td>
								<td>180</td>
							</tr>
							<tr class="table-danger">
								<td>몸무게</td>
								<td>80</td>
							</tr>
						</tbody>
					</table>
					<div class="row" style="text-align: right;">
						<button class="btn btn-success" style="font-size: 1.0em">개인 정보 수정</button>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="bg-transparent card-header pt-4 border-0">
					<h1 class="h1 font-weight-normal text-primary text-center mb-0" data-pricing-value="30">
						<span class="">질환 정보</span>
					</h1>
					<br />
				</div>
				<div class="col-md-10 col-md-offset-1">
					<table class="table">
						<tbody style="font-size: 1.2em">
							<tr>
								<td>질병</td>
								<td>감염성 질환, 호흡계 질환, 생식계 질환</td>
							</tr>
							<tr class="table-active">
								<td>01/04/2012</td>
								<td>Approved</td>
							</tr>
							<tr class="table-success">
								<td>02/04/2012</td>
								<td>Declined</td>
							</tr>
							<tr class="table-warning">
								<td>03/04/2012</td>
								<td>Pending</td>
							</tr>
						</tbody>
					</table>
					<div class="row" style="text-align: right;">
						<button class="btn btn-success" style="font-size: 1.0em">질환 정보 수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
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
