<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
#sidebar-collapse{
	box-shadow: 0 20px 30px #333;
	height: 850px;
}
</style>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">
					<sec:authentication property="principal.username"/>
				</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">
			<li class="active"><a href="<c:url value='/Home/ToHomePage.hst'/>"><em class="fa fa-home"></em> Homespital 홈으로 이동 </a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> 개인 정보 관리 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="<c:url value='/mypage/mypage.hst'/>">
						<span class="fa fa-arrow-right">&nbsp;</span> 내 정보 보기
					</a></li>
					<li><a class="" href="<c:url value='/mypage/ChangeMember.hst'/>">
						<span class="fa fa-arrow-right">&nbsp;</span> 내 정보 수정
					</a></li>
					<li><a class="" href="<c:url value='/mypage/unmember.hst'/>">
						<span class="fa fa-arrow-right">&nbsp;</span> 회원 탈퇴
					</a></li>
				</ul>
			</li>
			<li><a href="<c:url value='/mypage/administration.hst'/>"><i class="fas fa-pills">&nbsp;</i> 복약 관리</a></li>
			<li><a href="<c:url value='/mypage/ReservationList.hst'/>"><em class="fa fa-calendar">&nbsp;</em> 진료 예약 현황</a></li>
			<li><a href="<c:url value='/mypage/Disease.hst'/>"><i class="fas fa-syringe"></i>&nbsp; 내 질병 관리</a></li>
			<li><a href="<c:url value='/User/Login.hst'/>"><em class="fa fa-power-off">&nbsp;</em> 로그아웃 </a></li>
		</ul>
	</div><!-- /.sidebar -->
