<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
	padding-top: 100px;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<div class="row">
				<div class="col-md-12">
					<table class="table-bordered">
						<tr>
							<th colspan="3" style="text-align: center;"><h2>약품 상세정보</h2></th>
						</tr>
						<tr>
							<td class="col-md-3">약품명</td>
							<td class="col-md-6">${info["ITEM_NAME"]}</td>
							<td rowspan="4"><img style="width: 300px; height: 150px;"
								alt="약품 이미지" src="${shape['ITEM_IMAGE'] }" /></td>
						</tr>
						<tr>
							<td>제조사</td>
							<td>${info["ENTP_NAME"]}</td>
						</tr>
						<tr>
							<td>성상</td>
							<td>${shape["CHART"]}</td>
						</tr>
						<tr>
							<td>모양</td>
							<td>${shape["DRUG_SHAPE"]}</td>
						</tr>
						<tr>
							<td colspan="3"><h3>원료약품 및 분량</h3></td>
						</tr>
						<tr>
							<td colspan="3">${info['MATERIAL_NAME']}</td>
						</tr>
						<tr>
							<td colspan="3"><h3>기타정보</h3></td>
						</tr>
						<tr>
							<td colspan="3">
							보관방법: ${info['STORAGE_METHOD']}
						</br> 유효기간: ${info['VALID_TERM'] }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>