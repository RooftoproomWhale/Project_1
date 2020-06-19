<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />
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
	border: 2px solid #8C8C8C;
	border-bottom: none;
	position: relative;
	transition: all 0.5s ease 0s;
	
}

#accordion .panel-title a.collapsed {
	background: #fafafa;
	color: #959595;
	
}#accordion .panel-title a.collapsed{
border: 2px solid #8C8C8C
}
.panel-body{border: 2px solid red;}
.panel-body a{
border: 1px solid 
}
#accordion .panel-title a.collapsed:hover {
	color: #9c88b9;
}
.panel-heading{border: 2px solid #8C8C8C
}

#accordion .panel-title a:after, #accordion .panel-title a.collapsed:after {
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
	padding: 7px 65px 15px;
	line-height: 20px;
	margin-left: 12px;
	background: #fff;
    border: 1px solid #BDBDBD;
    border-top: 2px solid #BDBDBD;
  
}
.panel-group{
    margin-top: 7px;
}


body {
background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773) 68%, rgba(255, 206, 196, 0.5) 163%),linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%, rgba(239, 112, 138, 0.5) 40%),linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%, rgba(237, 106, 134, 0.5) 169%),linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%, rgba(247, 126, 132, 0.5) 43%); background-blend-mode: overlay,multiply,color,normal;}
.contents{
	background: white;
	top: 100px;
	left: 120px;
	padding-bottom: 100px;}
 @media (min-width: 992px){
.col-md-offset-10 {
    margin-left: 89.33333333%;
}}
</style>

<head>
<title>복약관리</title>
</head>
<body>
	<div class="container-fluid">
		<div class="col-md-2">
		</div>
		<div class="contents col-md-8">
			<div class="row" style="padding-left: 70px;">
				<div class="page-header">
					<h2 style="color: blue">복약관리</h2>
				</div>
				<p style="color: red;">3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에 상의하고 사용하도록 합니다</p>
			</div>
			<br />
			<div class="row">
				<div class=" col-sm-12" style="padding-left: 70px;">
					<div class="alert alert-warning alert-dismissible mt-3" role="alert">
						복약 순응도란 처방받은 약을 환자가 전문 의료인의 지시에 따라 정확하게 복용. 복약
						순응도가 높을수록 치료효과가 높아진다.
					</div>
					<br />
					<div class="col-md-offset-10" style="padding-bottom: 5px;">
						<a class="btn btn-primary" href='<c:url value="/Homespital/Upload.hst"/>'><span class="glyphicon glyphicon-plus"></span> 복용약 추가</a>
					</div>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										2020-06-08 서울 삼성병원
									 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<a href='<c:url value="/Homespital/Management.hst?dname=맥페란정"/>'>맥페란정</a> - 위장운동을 활성화시킴으로써 구역, 구토를 치료
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										2020-06-08 서울 삼성병원
									 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<a href='<c:url value="/Homespital/Management.hst?dname=티로파정"/>'>티로파정</a> - 평활근 경축을 완화시킴으로써 항경령 및 진통 효과를 나타냄
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										2020-06-08 서울 삼성병원
									 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<a href='<c:url value="/Homespital/Management.hst?dname=사이톱신정"/>'>사이톱신정</a> - 향균작용을 통해 각종 세균감염증을 치료
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
										2020-06-08 서울 삼성병원
									 </a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body">
									<a href='<c:url value="/Homespital/Management.hst?dname=사이톱신정"/>'>사이톱신정</a> - 향균작용을 통해 각종 세균감염증을 치료
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFive">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
										2020-06-08 서울 삼성병원
									 </a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
								<div class="panel-body">
									<a href='<c:url value="/Homespital/Management.hst?dname=사이톱신정"/>'>사이톱신정</a> - 향균작용을 통해 각종 세균감염증을 치료
								</div>
							</div>
						</div>
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