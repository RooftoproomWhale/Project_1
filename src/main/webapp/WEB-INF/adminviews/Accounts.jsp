<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<body class="animsition">
	<div class="page-wrapper">
		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap">
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="text" name="search"
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
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>Admin</h6>
															<span> <a href="#">Admin</a>
															</span>
														</div>
													</td>
													<td><span class="role admin">admin</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="KOSMO" disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586" disabled="disabled">
														</div>
													</td>
													<td>
	                                                    <div class="table-data-feature">
	                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="수정">
	                                                            <i class="zmdi zmdi-edit"></i>
	                                                        </button>
	                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="삭제">
	                                                            <i class="zmdi zmdi-delete"></i>
	                                                        </button>
	                                                    </div>
                                                	</td>
												</tr>
												<tr>
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
															<input type="text" placeholder="PASSWORD" disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586" disabled="disabled">
														</div>
													</td>
													<td>
	                                                    <div class="table-data-feature">
	                                                         <button class="item" data-toggle="tooltip" data-placement="top" title="수정">
	                                                            <i class="zmdi zmdi-edit"></i>
	                                                        </button>
	                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="삭제">
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
															<input type="text" placeholder="PASSWORD" disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586" disabled="disabled">
														</div>
													</td>
													<td>
	                                                    <div class="table-data-feature">
	                                                         <button class="item" data-toggle="tooltip" data-placement="top" title="수정">
	                                                            <i class="zmdi zmdi-edit"></i>
	                                                        </button>
	                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="삭제">
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
															<input type="text" placeholder="PASSWORD" disabled="disabled">
														</div>
													</td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<input type="text" placeholder="010-1234-7586" disabled="disabled">
														</div>
													</td>
													<td>
	                                                    <div class="table-data-feature">
	                                                         <button class="item" data-toggle="tooltip" data-placement="top" title="수정">
	                                                            <i class="zmdi zmdi-edit"></i>
	                                                        </button>
	                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="삭제">
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

</body>

</html>
<!-- end document-->
