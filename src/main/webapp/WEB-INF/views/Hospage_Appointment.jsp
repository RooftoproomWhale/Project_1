<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
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
</style>
<title>복약관리</title>
</head>
<body>
	<div class="container-fluid">
		<div class="col-md-2"></div>
		<div class="col-md-9">
			<div class="row" style="padding-top: 100px; padding-left: 70px;">
				<div class="page-header">
					<h2 style="color: blue">예약 대기 현황</h2>
				</div>
				<p style="color: red;">현재 승인을 기다리는 예약 목록입니다. 서둘러 승인해 주세요!</p>
			</div>
			<br />
			<div class=" col-sm-12" style="padding-left: 70px;">
				<!-- 					MAIN CONTENT -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<!-- DATA TABLE -->
							<div class="table-data__tool">
								<div class="table-data__tool-left">
									<div class="rs-select2--light rs-select2--sm">
										<select class="js-select2" name="time">
											<option selected="selected">All</option>
											<option value="">Accepted</option>
											<option value="">Denied</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>
							<div class="table-responsive table-responsive-data2">
								<table class="table table-data2">
									<thead>
										<tr>
											<th><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></th>
											<th>Name</th>
											<th>Id</th>
											<th>Tel</th>
											<th>ApplyDate</th>
											<th>Status</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr class="tr-shadow">
											<td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td>
											<td>UserName1</td>
											<td><span class="block-email">UserId1</span></td>
											<td class="desc">010-1234-7586</td>
											<td>2018-09-27 02:12</td>
											<td><span class="status--process">Accepted</span></td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="승인">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="거절">
														<i class="zmdi zmdi-delete"></i>
													</button>
													<button class="item" data-toggle="modal"
														data-placement="top" data-target="#AptModal" title="상세보기">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr class="spacer"></tr>
										<tr class="tr-shadow">
											<td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td>
											<td>UserName2</td>
											<td><span class="block-email">UserId2</span></td>
											<td class="desc">010-1234-7586</td>
											<td>2018-09-29 05:57</td>
											<td><span class="status--process">Accepted</span></td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="승인">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="거절">
														<i class="zmdi zmdi-delete"></i>
													</button>
													<button class="item" data-toggle="modal"
														data-placement="top" data-target="#AptModal" title="상세보기">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr class="spacer"></tr>
										<tr class="tr-shadow">
											<td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td>
											<td>UserName3</td>
											<td><span class="block-email">UserId3</span></td>
											<td class="desc">010-1234-7586</td>
											<td>2018-09-25 19:03</td>
											<td><span class="status--denied">Denied</span></td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="승인">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="거절">
														<i class="zmdi zmdi-delete"></i>
													</button>
													<button class="item" data-toggle="modal"
														data-placement="top" data-target="#AptModal" title="상세보기">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr class="spacer"></tr>
										<tr class="tr-shadow">
											<td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td>
											<td>UserName4</td>
											<td><span class="block-email">UserId4</span></td>
											<td class="desc">010-1234-7586</td>
											<td>2018-09-24 19:10</td>
											<td><span class="status--process">Accepted</span></td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="승인">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="거절">
														<i class="zmdi zmdi-delete"></i>
													</button>
													<button class="item" data-toggle="modal"
														data-placement="top" data-target="#AptModal" title="상세보기">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- END DATA TABLE -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 상세 보기 모달 -->
	<div class="modal fade" id="AptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-notify modal-warning" role="document">
			<div class="col-lg-12 ">
				<div class="top-campaign">
					<h3 class="title-3">예약 정보</h3>
					<br/>
					<div class="table-responsive">
						<table class="table table-top-campaign">
							<tbody>
								<tr>
									<td>예약자 이름</td>
									<td>윤성준</td>
								</tr>
								<tr>
									<td>요청 과</td>
									<td>이비인후과</td>
								</tr>
								<tr>
									<td>email</td>
									<td>busu0423@gmail.com</td>
								</tr>
								<tr>
									<td>핸드폰 번호</td>
									<td>010-1234-7586</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>남성</td>
								</tr>
								<tr>
									<td>나이</td>
									<td>27</td>
								</tr>
								<tr>
									<td>예약 시간</td>
									<td>2018-09-30 10:00</td>
								</tr>
								<tr>
									<td>예약 신청 시간</td>
									<td>2018-09-27 02:12</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>