<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>"
	rel="stylesheet" type="text/css" />
<style>
a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

.demo {
	padding: 100px 0;
}

.heading-title {
	margin-bottom: 100px;
}

#accordion .panel {
	border: none;
	background: none;
	border-radius: 0;
	box-shadow: none;
}

#accordion .panel-heading {
	padding: 0;
}

#accordion .panel-title a {
	display: block;
	font-size: 16px;
	color: #9c88b9;
	padding: 17px 40px 17px 65px;
	background: #fff;
	border: 1px solid #f3f3f3;
	border-bottom: none;
	position: relative;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed {
	background: #fafafa;
	color: #959595;
}

#accordion .panel-title a.collapsed:hover {
	color: #9c88b9;
}

#accordion .panel-title a:after, #accordion .panel-title a.collapsed:after
	{
	content: "\f068";
	font-family: FontAwesome;
	font-size: 15px;
	color: #fff;
	width: 45px;
	height: 100%;
	line-height: 54px;
	text-align: center;
	position: absolute;
	top: 0px;
	left: -1px;
	background: #9c88b9;
	transition: all .2s;
}

#accordion .panel-title a.collapsed:after {
	content: "\f067";
	color: #959595;
	background: #f4f4f4;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed:hover:after {
	background: #9c88b9;
	color: #fff;
}

#accordion .panel-title a:before {
	content: "";
	position: absolute;
	bottom: -11px;
	left: -1px;
	border-bottom: 12px solid transparent;
	border-right: 12px solid #9c88b9;
}

#accordion .panel-title a.collapsed:before {
	display: none;
}

#accordion .panel-body {
	font-size: 14px;
	color: #b7b7b7;
	padding: 0 65px 15px;
	line-height: 20px;
	margin-left: 12px;
	background: #fff;
	border: 1px solid #f3f3f3;
	border-top: none;
}
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
					<h2 style="color: blue">복약관리</h2>
				</div>
				<p style="color: red;">3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에
					상의하고 사용하도록 합니다</p>
			</div>
			<br />
			<div class="row">
				<div class=" col-sm-9" style="padding-left: 70px;">
					<div class="alert alert-warning alert-dismissible mt-3"
						role="alert">복약 순응도란 처방받은 약을 환자가 전문 의료인의 지시에 따라 정확하게 복용. 복약
						순응도가 높을수록 치료효과가 높아진다.</div>
					<br />
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a class="" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">2020-06-08
										서울 삼성병원 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<a
										href='<c:url value="/Homespital/Management.hst?dname=맥페란정"/>'>맥페란정</a>
									- 위장운동을 활성화시킴으로써 구역, 구토를 치료
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										2020-06-08 서울 삼성병원 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<a
										href='<c:url value="/Homespital/Management.hst?dname=티로파정"/>'>티로파정</a>
									- 평활근 경축을 완화시킴으로써 항경령 및 진통 효과를 나타냄
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										2020-06-08 서울 삼성병원 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<a
										href='<c:url value="/Homespital/Management.hst?dname=사이톱신정"/>'>사이톱신정</a>
									- 향균작용을 통해 각종 세균감염증을 치료
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										2020-06-08 서울 삼성병원 </a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body">
									<a
										href='<c:url value="/Homespital/Management.hst?dname=사이톱신정"/>'>사이톱신정</a>
									- 향균작용을 통해 각종 세균감염증을 치료
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFive">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										2020-06-08 서울 삼성병원 </a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingFive">
								<div class="panel-body">
									<a
										href='<c:url value="/Homespital/Management.hst?dname=사이톱신정"/>'>사이톱신정</a>
									- 향균작용을 통해 각종 세균감염증을 치료
								</div>
							</div>
						</div>
					</div>
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
</html>