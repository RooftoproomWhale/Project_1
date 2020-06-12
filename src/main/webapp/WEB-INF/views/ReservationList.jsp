<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>마이페이지</title>

<link href="<c:url value='/css/jquery-accordion-menu.css'/>"
	rel="stylesheet" type="text/css" />

<style type="text/css">
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

</head>
<body>
	<div class="container-fluid">
		<div class="col-md-2">
		</div>
		
		<div class="col-md-10">
			<div class="row" style="padding-left: 60px; padding-top: 100px">
				<div class="page-header">
					<h2 style="color: blue">진료예약</h2>
				</div>
				<p class="lead">홈스피탈 진료예약 현황</p>
				<div style="max-width: 1300px; text-align: right;">
					<a href="./boardWrite.html" class="btn btn-primary float-right">글쓰기</a>
				</div>
				<hr>
				<table class="table table-striped" style="max-width: 1300px;">
					<thead>
						<tr>
							<th scope="col" class="mobile" style="width: 55px; text-align: center;">번호</th>
							<th scope="col" class="mobile" style="text-align: center;">병원이름</th>
							<th scope="col" class="mobile" style="width: 80px; text-align: center;">예약자</th>
							<th scope="col" class="mobile" style="width: 120px; text-align: center;">예약날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">5</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">4</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">3</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th class="mobile" scope="row" style="text-align: center;">2</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th class="mobile" scope="row" style="text-align: center;">1</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈.</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
					</tbody>
				</table>
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
