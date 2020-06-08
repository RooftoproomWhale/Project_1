<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>JQuery with vertical navigation filter function code</title>


<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />


<style type="text/css">
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
	font-size: 16px
}

#jquery-accordion-menu {
  	top: 81px;
}
/*  color: #6c757d; */
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


<script src="<c:url value='/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function () {
	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
});

$(function(){	

	$("#demo-list li").click(function(){
		$("#demo-list li.active").removeClass("active")
		$(this).addClass("active");
	})	
})	
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="col-md-2">
			<div id="jquery-accordion-menu" class="jquery-accordion-menu">
				<div class="col-md-8 col-md-offset-2">
				<span><img
						style="width: 150px; height: 150px;" class="img-responsive"
						src='<c:url value="/img/logo.png"/>' alt="로고이미지" /></span>
						</div>
				<ul id="demo-list">
					<li class="active"><a href="#"><i class="fa fa-home"></i>MYPAGE</a></li>
					<li><a href="#"><i class="fa fa-file-image-o"></i>김길동님</a>
					<li><a href="#"><i class="fa fa-cog"></i>개인정보 관리</a>
						<ul class="submenu">
							<li><a href="#">내 정보 보기</a></li>
							<li><a href="#">내 정보 수정</a></li>
							<li><a href="#">회원 탈퇴</a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-suitcase"></i>복약 관리</a>
						<ul class="submenu">
							<li><a href="#">Web Design </a></li>
							<li><a href="#">Graphics </a><span
								class="jquery-accordion-menu-label">10 </span></li>
							<li><a href="#">Photoshop </a></li>
							<li><a href="#">Programming </a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-envelope"></i>진료예약 현황</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i>내 질병 관리</a></li>
				</ul>
			</div>
		</div>

		<div class="col-md-10 " style="padding-top: 88px">
			<div class="col-md-5">
						<div class="bg-transparent card-header pt-4 border-0">
							<h1 class="h1 font-weight-normal text-primary text-center mb-0"
								data-pricing-value="15">
								<span class="">개인정보</span>
							</h1>
						</div>
						<div class="col-md-10 col-md-offset-1">
							<table class="table">
								<tbody>
									<tr>
										<td>01/04/2012</td>
										<td>Default</td>
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
									<tr class="table-danger">
										<td>04/04/2012</td>
										<td>Call in to confirm</td>
									</tr>
								</tbody>
							</table>
							<button class="btn btn-success">정보 수정</button>
						</div>
					</div>
					<div class="col-md-5">
						<div class="bg-transparent card-header pt-4 border-0">
							<h1 class="h1 font-weight-normal text-primary text-center mb-0"
								data-pricing-value="30">
								<span class="">질환 정보</span>
							</h1>
						</div>
						<div class="col-md-10 col-md-offset-1">
							<table class="table">
								<tbody>
									<tr>
										<td>01/04/2012</td>
										<td>Default</td>
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
									<tr class="table-danger">
										<td>04/04/2012</td>
										<td>Call in to confirm</td>
									</tr>
								</tbody>
							</table>
							<button class="btn btn-success">정보 수정</button>
						</div>
					</div>
				</div>
			</div>

	<script type="text/javascript">
		(
						function($) {
							$.expr[":"].Contains = function(a, i, m) {
								return (a.textContent || a.innerText || "")
										.toUpperCase().indexOf(
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
								$(input)
										.change(
												function() {
													var filter = $(this).val();
													if (filter) {
														$matches = $(list)
																.find(
																		"a:Contains("
																				+ filter
																				+ ")")
																.parent();
														$("li", list).not(
																$matches)
																.slideUp();
														$matches.slideDown();
													} else {
														$(list).find("li")
																.slideDown();
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
	</script></body>
</html>
