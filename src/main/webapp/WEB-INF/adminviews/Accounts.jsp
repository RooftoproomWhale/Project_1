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
							<div class="col-lg-6">
								<!-- USER DATA-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>user data
									</h3>
									<div class="filters m-b-45">
										<div
											class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
											<select class="js-select2" name="property">
												<option selected="selected">All Properties</option>
												<option value="">Products</option>
												<option value="">Services</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div
											class="rs-select2--dark rs-select2--sm rs-select2--border">
											<select class="js-select2 au-select-dark" name="time">
												<option selected="selected">All Time</option>
												<option value="">By Month</option>
												<option value="">By Day</option>
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
													<td>type</td>
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
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role admin">admin</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option selected="selected">Full Control</option>
																<option value="">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox" checked="checked"> <span
															class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role user">user</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option value="">Full Control</option>
																<option value="" selected="selected">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role user">user</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option value="">Full Control</option>
																<option value="" selected="selected">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
														<div class="table-data__info">
															<h6>lori lynch</h6>
															<span> <a href="#">johndoe@gmail.com</a>
															</span>
														</div>
													</td>
													<td><span class="role member">member</span></td>
													<td>
														<div class="rs-select2--trans rs-select2--sm">
															<select class="js-select2" name="property">
																<option selected="selected">Full Control</option>
																<option value="">Post</option>
																<option value="">Watch</option>
															</select>
															<div class="dropDownSelect2"></div>
														</div>
													</td>
													<td><span class="more"> <i
															class="zmdi zmdi-more"></i>
													</span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="user-data__footer">
										<button class="au-btn au-btn-load">load more</button>
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
