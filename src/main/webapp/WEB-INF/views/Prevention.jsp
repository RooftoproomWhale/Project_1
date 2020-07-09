<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#banner {
	padding-top: 65px;
	width: auto;
	height: auto;
	position: absolute;
}
#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top: 1000px;
	background-color: #474747;
	height: 150px
}
</style>

<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Q&A</title>
</head>
<body>
	<div class="col-md-offset-2 col-md-8">
		<img id="banner" src="<c:url value="/images/healthimg/사회적 거리두기.png"/>" style="position: relative;">
	</div>
	<div class="row">
		<div class="container">
			<div class="col-md-10" style="padding-top: 40px; border-right: 1px solid gray;">
				<div class="alert alert-info">
					<h1 class="fs-title" style="font-size: 1.3em">
						윤승중님의 예방정보
					</h1>
				</div></br>
				<h1 style="font-size: 60px; color: #bc7ad6">
					감기<small>Flu</small>
				</h1>

				<div class="row" style="padding-top: 50px;">
					<div class="col-md-12 small">
					<h3>증상</h3>
					</div>
					<div class="col-md-12" style="padding-bottom: 50px;">
						감기는 바이러스에 의해 코와 목 부분을 포함한 상부 호흡기계의 감염 증상으로, 사람에게 나타나는 가장 흔한 급성 질환 중
						하나이다. 재채기, 코막힘, 콧물, 인후통, 기침, 미열, 두통 및 근육통과 같은 증상이 나타나지만 대개는 특별한 치료
						없이도 저절로 치유된다.
					</div>
					<div class="col-md-12">
					<h3>원인</h3>
					</div>
					<div class="col-md-12" style="padding-bottom: 50px;">
						200여개 이상의 서로 다른 종류의 바이러스가 감기를 일으킨다. 그 중 30~50%가 리노바이러스(Rhinovirus)이고
						10~15%가 코로나바이러스(Coronavirus)이다. 성인은 일 년에 2~4회, 소아는 6~10회 정도 감기에
						걸린다. 감기 바이러스는 사람의 코나 목을 통해 들어와 감염을 일으킨다. 감기 바이러스를 가지고 있는 환자의 코와
						입에서 나오는 분비물이 재채기나 기침을 통해 외부로 나오게 되면 그 속에 있는 감기 바이러스가 공기 중에 존재하다가
						건강한 사람의 입이나 코에 닿아 전파된다.
					</div>
					<div class="col-md-12">
					<h3>예방</h3>
					</div>
					<div class="col-md-12">
						200여개 이상의 서로 다른 종류의 바이러스가 감기를 일으킨다. 그 중 30~50%가 리노바이러스(Rhinovirus)이고 10~15%가 코로나바이러스(Coronavirus)이다. 
						성인은일 년에 2~4회, 소아는 6~10회 정도 감기에 걸린다. 감기 바이러스는 사람의 코나 목을 통해 들어와 감염을
						일으킨다. 감기 바이러스를 가지고 있는 환자의 코와 입에서 나오는 분비물이 재채기나 기침을 통해 외부로 나오게 되면 그
						속에 있는 감기 바이러스가 공기 중에 존재하다가 건강한 사람의 입이나 코에 닿아 전파된다.
					</div>
				</div>
			</div>

			<div class="col-md-2" style="padding-top: 250px; border-bottom: 1px solid gray">
				<div id="rightBar" class="row">
					<div class="col-md-12">대장 질환</div>
					<div class="col-md-12">간 질환</div>
					<div class="col-md-12">비만</div>
					<div class="col-md-12">피부</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
