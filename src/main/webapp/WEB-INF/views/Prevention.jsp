<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.24/themes/base/jquery-ui.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<c:url value='/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>

<style>
:root {
  --bg-color: #f5f8ff;;
  --main-color: #353536;
  --secondary-color: #8e92a4;
  --main-text-color: #5d606b;
  --secondary-dark-color: #9496a5;
  --tag-color-one: #e0fbf6;
  --tag-color-text-one: #58c2a9;
  --tag-color-two: #ece7fe;
  --tag-color-text-two: #8972f3;
  --tag-color-three: #fde7ea;
  --tag-color-text-three: #e77f89;
  --tag-color-four: #f7f8fc;
  --tag-color-text-four: #a0a6b5;
  --checkbox-color: #009e90;
  --button-color: #49beb7;
  --box-color: #fff1d6;
  --box-color-2: #d3e6ff;
  --box-color-3: #ffd9d9;
  --box-color-4: #daffe5;
  --task-color: #777982;
}
body {
  margin: 0;
  @extend %flex;
  justify-content: center;
  flex-direction: column;
  overflow: auto;
  width: 100%;
  height: 100vh;
  padding: 20px;
  font-family: 'DM Sans', sans-serif;;
  font-size: 12px;
  background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773) 68%, rgba(255, 206, 196, 0.5) 163%),linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%, rgba(239, 112, 138, 0.5) 40%),linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%, rgba(237, 106, 134, 0.5) 169%),linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%, rgba(247, 126, 132, 0.5) 43%); background-blend-mode: overlay,multiply,color,normal;
}

.task-manager {
  top:41px;
  display: flex;
  justify-content: space-between;
  width: 100%;
  max-width: 1550px;
  height: 91vh;
  max-height: 850px;
  background: #fff;
  border-radius: 4px;
  box-shadow:
  0 0.3px 2.2px rgba(0, 0, 0, 0.011),
  0 0.7px 5.3px rgba(0, 0, 0, 0.016),
  0 1.3px 10px rgba(0, 0, 0, 0.02),
  0 2.2px 17.9px rgba(0, 0, 0, 0.024),
  0 4.2px 33.4px rgba(0, 0, 0, 0.029),
  0 10px 80px rgba(0, 0, 0, 0.04);
  overflow: hidden;
}

.page-content {
	display: flex;
	flex-direction: column;
	flex: 1;
	padding: 40px 20px 0 20px;
	background: #FFFFFF;
	border-bottom: 1px solid #ddd;
}

.page-content .header {
	font-size: 26px;
	color: var(--main-color);
	margin-top: 30px;
}

.content-categories {
	display: flex;
	justify-content: space-evenly;
	width: 100%;
	padding: 20px 0;
}

.nav-item {
	display: none;
}

.category {
	font-weight: 500;
	color: var(--secondary-color);
	border-bottom: 1px solid #ddd;
	transition: .4s ease-in;
	padding: 20px;
	cursor: pointer;
	}
#opt-1:checked + label ,
#opt-2:checked +  label ,
#opt-3:checked +  label ,
#opt-4:checked +  label,
#opt-5:checked +  label,
#opt-6:checked +  label,
#opt-7:checked +  label,
#opt-8:checked +  label,
#opt-9:checked +  label,
#opt-10:checked +  label,
#opt-11:checked +  label  {
  color: var(--checkbox-color);
  border-bottom: 2px solid var(--checkbox-color);
}


.task-item {
	display: none;
}

.tasks-wrapper {
	padding: 20px 0;
	flex: 1;
	overflow-y: auto;
	height: 100%;
	padding-right: 8px;
}

.task {
	display: flex;
	justify-content: space-between;
	position: relative;
	margin-bottom: 16px;
	padding-left: 30px;
	color: var(- -task-color);
	font-size: 18px;
	font-weight: 500;
	
}.description-task :hover {
    transform: translatex(2px);
 }.task label {
	cursor: pointer;
  

}
label .label-text {
	position: relative;
}

label .label-text:before {
	content: '';
	position: absolute;
	width: 14px;
	height: 14px;
	border: 1px solid #ddd;
	border-radius: 2px;
	left: -24px;
	transition: .2s ease;
}

.task-item:checked+label .label-text:before {
	background-color: var(--checkbox-color);
	border: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3E%3Cpolyline points='20 6 9 17 4 12'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-size: 10px;
	background-position: center;
	border: 1px solid var(--checkbox-color);
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


<title>예방 정보</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="task-manager col-md-offset-2 col-md-10">
				<div class="page-content">
					<div class="header">
						내 예방 정보
						<div class="alert alert-info" style="text-align: center;">
							<strong>${listgetName[0].mem_name}</strong>님의 예방 정보 확인하기
						</div>
					</div>
					<div class="content-categories" style="font-size: 18px;">
						<c:if test="${list[0].ill_name == '해당없음'}" var="isEmpty">
							<div class="row">
								<div class="col-md-12" style="text-align: center;">
									<img style="width: 400px; height: auto" src="<c:url value='/images/medicine/notPres.png'/>" />
								</div>
							</div>
						</c:if>
						<c:if test="${not isEmpty}" var="isEmpty">
							<c:forEach items="${list}" var="item" varStatus="loop">
								<div class="label-wrapper">
									<input class="nav-item" name="nav" type="radio" id="opt-${loop.index }"> 
									<label style="color: blue;font-weight: bold;" class="category" for="opt-${loop.index }">${item.ill_name}</label>
								</div>
								<!-- <div class="label-wrapper"> -->
								<!-- <input class="nav-item" name="nav" type="radio" id="opt-2"> -->
								<!-- <label class="category" for="opt-2">A형 간염</label> -->
								<!-- </div> -->
								<!-- <div class="label-wrapper"> -->
								<!-- <input class="nav-item" name="nav" type="radio" id="opt-3"> -->
								<!-- <label class="category" for="opt-3">B형 간염</label> -->
								<!-- </div> -->
							</c:forEach>
						</c:if>
					</div>
					<c:if test="${list[0].ill_name == '해당없음'}" var="isEmpty">
					<div class="row">
						<div class="col-md-12" style="text-align: center; font-size: 25px; padding-left:85px">
							<input class="nav-item" name="nav" type="radio"><strong>등록된 질병이 없습니다.</strong>
						</div>
					</div>
					</c:if>
					<c:if test="${list[0].ill_name != '해당없음'}" var="isEmpty">
						<div class="tasks-wrapper">
							<c:forEach items="${list}" var="item" varStatus="loop">

								<div class="task" style="border: none;">
									<input class="task-item" name="task-gs" type="checkbox"
										id="illId${loop.index }">
									<div class="col-md-2">
										<h3>증상:</h3>
									</div>
									<div class="col-md-10"
										style="border-right: 1px solid; border-color: #00d9fa">${item.ill_content}</div>

									<div class="col-md-2">
										<h3>원인:</h3>
									</div>
									<div class="col-md-10"
										style="border-right: 1px solid; border-color: #00d9fa">${item.cause}</div>
									<div class="col-md-2">
										<h3>예방:</h3>
									</div>
									<div class="col-md-10">${item.prevention}</div>
								</div>

							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
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
							$matches = $(list).find("a:Contains(" + filter + ")").parent();
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
	});
</script>
<script type="text/javascript">

	$(function() {
		$('.task').hide();
		$('#illId0').closest("div").show();
		
		$(".task-item").change(function() {
			var txt = $(this).next().text();
			var disease = $('.task-name');
			var taskbox = $('.task-box');
			var size = disease.length;
			$(this).siblings('span').attr('class','tag approved').text("Selection");

			if ($(this).is(":checked")) {
				var is = true;
				if (size == 0) {
					$(
						"<div class='task-box yellow'><div class='description-task'><div class='task-name'>"
						+ txt + 
						"</div><div class='time'>내용</div></div><div class='glyphicon glyphicon-remove more-button'></div></div>").appendTo('.right-content');
				} else {
					for (i = 0; i < size; i++) {
						if (disease.eq(i).text() == txt) { 
							is = false;
						}
					}
					if (is) {
						$(
							"<div class='task-box yellow'><div class='description-task'><div class='task-name'>"
							+ txt + 
							"</div><div class='time'>내용</div></div><div class='glyphicon glyphicon-remove more-button'></div></div></div>") .appendTo('.right-content');
					}
				}
			} else {
				$(this).siblings('span').attr('class','tag progress').text("UnSelection");
				for (i = 0; i < size; i++) {
					if (txt == disease.eq(i).text()) {
						taskbox.eq(i).remove()
					}

				}

			}
		});
		$("input[name=nav]").change(function() {

			var idx = $('input[name=nav]').index(this);

			switch (idx) {
			case 0:
				$('.task').hide();
				$('#illId0').closest("div").show();
				break;
			case 1:
				$('.task').hide();
				$('#illId1').closest("div").show();
				break;
			case 2:
				$('.task').hide();
				$('#illId2').closest("div").show();
				break;
			case 3:
				$('.task').hide();
				$('#illId3').closest("div").show();
				break;
			case 4:
				$('.task').hide();
				$('#illId4').closest("div").show();
				break;
			case 5:
				$('.task').hide();
				$('#illId5').closest("div").show();
				break;
			case 6:
				$('.task').hide();
				$('#illId6').closest("div").show();
				break;
			case 7:
				$('.task').hide();
				$('#illId7').closest("div").show();
				break;
			case 8:
				$('.task').hide();
				$('#illId8').closest("div").show();
				break;
			default:
				$('.task').hide();
				$('#illId0').closest("div").show();
				break;
			}
		});
	});
</script>
</body>
</html>