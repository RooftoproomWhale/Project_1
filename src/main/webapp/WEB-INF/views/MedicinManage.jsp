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
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h1>
					복용중인 약
				</h1>
			</div>
			<div class="col-md-12 text-right">
				<a style="margin-bottom: 10px" type="button" class="btn btn-primary">복약 등록 </a>
			</div>
			<table class="table">
				<tbody>
					<tr>
						<td style="text-align: center;">
							닥터베아제정
						</td>
						<td class="col-md-3" style="text-align: center;">
							01/04/2012
						</td>
						<td class="col-md-4" style="text-align: center;">
							<img src='<c:url value="/img/medicine/닥터베아제정.jpg"/>' alt="약물이미지">
						</td>
					</tr>
				</tbody>
			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>