<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>
.modal-notify .modal-header {
    border-radius: 3px 3px 0 0;
}
.modal-notify .modal-content {
    border-radius: 3px;
}

input[type=text] { border: none;}
</style>

<script>
$(function() {
	
	$("#updateBtn").on('click', function(){
		var upName = $("#upName").val();
		var upEmail = $("#upEmail").val();
		var upPwd = $("#upPwd").val();
		var upTel = $("#upTel").val();
		
		console.log(upName, upEmail, upPwd, upTel);
// 		var param = $("#frm").serialize();
// 		alert(param);
		var request = 
			$.ajax({ 
				url: "<c:url value='/Admin/UserUpdate.hst'/>",
				type: "post", //get, post 방식 
				data: {
						"upName" : upName,
						"upEmail" : upEmail,
						"upPwd" : upPwd,
						"upTel" : upTel
						}, //넘길 파라미터 
				dataType: 'json', //or xml or script or html 
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log('성공');
				},
				error: function(json)
				{ 
					console.log('실패');
				} 
			});
	});
});
</script>

<body>
	<div class="page-wrapper">
		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap">
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="email" name="search"
									placeholder="회원명 검색" />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</header>
			<!-- END HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-10">
								<!-- USER DATA-->
								<div class="user-data m-b-45">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>user data
									</h3>
									<div class="filters m-b-45">
										<div
											class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
											<select class="js-select2" name="property">
												<option selected="selected">All Users</option>
												<option value="">User</option>
												<option value="">Hospital</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>name</td>
													<td>role</td>
													<td>password</td>
													<td>tel</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty list}" var="isEmpty">
													<tr>
														<td colspan="4">등록된 회원이 없습니다.</td>
													</tr>
												</c:if>
												<c:if test="${not isEmpty}">
													<c:forEach items="${list}" var="item" varStatus="loop">
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>${item.mem_name }</h6>
															<span> <a href="#">${item.mem_email }</a>
															</span>
														</div>
													</td>
													<c:if test="${item.role == 'ROLE_ADM' }">
														<td><span class="role admin">${item.role }</span></td>
													</c:if>
													<c:if test="${item.role == 'ROLE_MEM' }">
														<td><span class="role user">${item.role }</span></td>
													</c:if>
													<c:if test="${item.role == 'ROLE_HOS' }">
														<td><span class="role member">${item.role }</span></td>
													</c:if>
													
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="${item.mem_pwd }"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="modal"
																data-placement="top" data-target="#UserModal" title="수정" id="updateModal">
																<i class="zmdi zmdi-edit"></i>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="삭제">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
												</c:forEach>
											</c:if>
													<td><label class="au-checkbox"> <input
															type="checkbox" checked="checked"> <span
															class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>윤성준</h6>
															<span> <a href="#">busu0423@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role user">user</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="PASSWORD"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="modal"
																data-placement="top" data-target="#UserModal" title="수정">
																<i class="zmdi zmdi-edit"></i>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="삭제">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>신건웅</h6>
															<span> <a href="#">shin@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role user">user</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="PASSWORD"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="modal"
																data-placement="top" data-target="#UserModal" title="수정">
																<i class="zmdi zmdi-edit"></i>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="삭제">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>김이중피부과의원</h6>
															<span> <a href="#">02-484-6455</a>
															</span>
														</div>
													</td>
													<td><span class="role member">Hospital</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="PASSWORD"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586"
																disabled="disabled">
														</div>
													</td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="modal"
																data-placement="top" data-target="#UserModal" title="수정">
																<i class="zmdi zmdi-edit"></i>
															</button>
															<button class="item" data-toggle="tooltip"
																data-placement="top" title="삭제">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- END USER DATA-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 모달 -->
	<div class="modal fade" id="UserModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-notify modal-warning" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header text-center">
					<h4 class="modal-title white-text w-100 font-weight-bold py-2">Update User</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span class="white-text">&times;</span>
					</button>
				</div>

				<!--Body-->
				<div class="modal-body">
				<form id="frm">
						<div class="md-form mb-5">
							<i class="fas fa-user prefix grey-text"></i> <input type="email"
								id="upName" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="form3">Name</label>
						</div>
	
						<div class="md-form mb-5">
							<input type="email" id="upEmail" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="form2">E-mail</label>
						</div>
						
						<div class="md-form mb-5">
							<input type="email" id="upPwd" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="form2">Password</label>
						</div>
						
						<div class="md-form">
							<input type="email" id="upTel" class="form-control validate"> <label
								data-error="wrong" data-success="right" for="form2">Tel</label>
						</div>
					</form>
				</div>

				<!--Footer-->
				<div class="modal-footer justify-content-center">
					<a type="button" id="updateBtn" class="btn btn-outline-warning waves-effect">Update</a>
				</div>
			</div>
			<!--/.Content-->
		</div>
	</div>
</body>

</html>
<!-- end document-->
