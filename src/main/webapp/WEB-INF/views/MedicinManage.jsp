<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	body{
	padding-top: 100px;
	}

</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h3 style="text-align: center;">약품 상세정보</h3>
			<div class="row">
				<div class="col-md-8">
					<table class="table">
						<tbody>
							<tr>
								<td>약품명</td>
								<td class="col-md-10">타이레놀</td>
							</tr>
							<tr>
								<td>제조사</td>
								<td>제조사입니다</td>
							</tr>
							<tr>
								<td>성상</td>
								<td>원형</td>
							</tr>
							<tr>
								<td>모양</td>
								<td>동그라미</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-4">
					<img style="width: 300px;height: 150px;" alt="Bootstrap Image Preview"
						src='<c:url value="/img/medicine/타이레놀정500mg.jpg"/>' />
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>