<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>"
	rel="stylesheet" type="text/css" />
<style>
/*사이드바*/
#jquery-accordion-menu {
	top: 81px;
}

* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

body {
	background: #FFFFFF;
}

.content {
	width: 260px;
	margin: 100px auto;
}

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	height: 60px;
	width: 100%;
	font-size: 14px
}

#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: 0px;
	background-color: #474747;
	height: 150px
}
</style>

<head>
<title>복약관리</title>
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
			<div class="row" style="padding-top: 100px; padding-left: 70px;">
				<div class="page-header">
					<h2 style="color: blue">진료현황</h2>
				</div>
				<p style="color: red;">3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에 상의하고 사용하도록 합니다</p>
			</div>
			<br />
			<div class="row">
				<div class=" col-sm-12" style="padding-left: 70px; text-align: center;">
					<div class="alert alert-warning alert-dismissible mt-3" role="alert">
						<strong>윤승중님</strong>의 진료예약 현황입니다. <strong>세부사항은</strong> 눌러서 확인하십시오</div>
					<br />
					<table id="report" class="table table-striped" style="max-width: 1300px;">
						<thead>
							<tr>
								<th scope="col" class="" style="width: 40px; text-align: center;">번호</th>
								<th scope="col" class="" style="width: 90px; text-align: center;">환자명</th>
								<th scope="col" class="" style="width: 90px; text-align: center;">접수일</th>
								<th scope="col" class="" style="width: 80px; text-align: center;">예약일</th>
								<th scope="col" class="" style="width: 80px; text-align: center;">진료과</th>
							</tr>
						</thead>
						<tr>
							<th scope="row" class="" style="text-align: center;">10</th>
							<td class="" style="text-align: center;">윤승중</td>
							<td class="" style="text-align: center;">2020-06-10</td>
							<td class="" style="text-align: center;">2020-06-10</td>
							<td class="" style="text-align: center;">정형외과</td>
						</tr>
						<tr>
							<td colspan="5">
								<div class="form-group">
									<label style="font-size: 0.9em; padding-top: 10px; padding-left: 10px">병원 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="병원" disabled="disabled">
									</div>
									<label style="font-size: 0.9em; padding-top: 10px; padding-left: 10px">부서 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="부서" disabled="disabled">
									</div>
									<label style="font-size: 0.9em; padding-top: 10px; padding-left: 10px">주소 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="주소" disabled="disabled">
									</div>
									<label style="font-size: 0.9em; padding-top: 10px; padding-left: 10px">번호 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="번호" disabled="disabled">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="" style="text-align: center;">9</th>
							<td class="" style="text-align: center;">윤승중</td>
							<td class="" style="text-align: center;">2020-06-10</td>
							<td class="" style="text-align: center;">2020-06-10</td>
							<td class="" style="text-align: center;">정형외과</td>
						</tr>
						<tr>
							<td colspan="5">
								<div class="form-group">
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">병원 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="병원" disabled="disabled">
									</div>
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">부서 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="부서" disabled="disabled">
									</div>
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">주소 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="주소" disabled="disabled">
									</div>
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">번호 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="번호" disabled="disabled">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="" style="text-align: center;">8</th>
							<td class="" style="text-align: center;">윤승중</td>
							<td class="" style="text-align: center;">2020-06-10</td>
							<td class="" style="text-align: center;">2020-06-10</td>
							<td class="" style="text-align: center;">정형외과</td>
						</tr>
						<tr>
							<td colspan="5">
								<div class="form-group">
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">병원 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="병원" disabled="disabled">
									</div>
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">부서 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="부서" disabled="disabled">
									</div>
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">주소 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="주소" disabled="disabled">
									</div>
									<label style="font-size: 0.8em; padding-top: 10px; padding-left: 10px">번호 :</label>
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="번호" disabled="disabled">
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<c:url value='/js/jquery-accordion-menu.js'/>"
	type="text/javascript"></script>
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
<script>
	$(document).ready(function() {

		$("#report tr:odd").addClass("odd");
		$("#report tr:not(.odd)").hide();
		$("#report tr:first-child").show(); //열머리글 보여주기

		$("#report tr.odd").click(function() {
			$(this).next("tr").toggle();
			$(this).find(".arrow").toggleClass("up");

		});

	});
</script>
</html>