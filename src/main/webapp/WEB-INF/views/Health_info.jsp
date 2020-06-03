<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.thumbnail{
width: 250px;
}
</style>
<script>
	
</script>
<div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2" style="padding-top:400px;"id="basic1">
			<a href="<c:url value="/Homespital/Health_detail.hst"/>">
			<div class="thumbnail col-md-4">
				<img src="<c:url value="/img/asd.png"/>" alt="...">
				<div class="caption">
					<h3>제목1</h3>
				</div>
			</div><!-- 썸네일 -->
			</a>
			<a href="<c:url value="/"/>">
			<div class="thumbnail col-md-4">
				<img src="<c:url value="/img/asd.png"/>" alt="...">
				<div class="caption">
					<h3>제목2</h3>
				</div>
			</div>
			</a>
			<a href="<c:url value="/"/>">
			<div class="thumbnail col-md-4">
				<img src="<c:url value="/img/asd.png"/>" alt="...">
				<div class="caption">
					<h3>제목3</h3>
				</div>
			</div>
		</a>
		</div>
		
		<div class="row">
			<div class="col-md-8 col-md-offset-2"id="basic2" >
		<a href="<c:url value="/"/>">
		<div class="thumbnail col-md-4" >
				<img src="<c:url value="/img/asd.png"/>" alt="...">
				<div class="caption">
					<h3>제목4</h3>
				</div>	
			</div><!-- 썸네일 -->
			</a>
			<a href="<c:url value="/"/>">
			<div class="thumbnail col-md-4">
				<img src="<c:url value="/img/asd.png"/>" alt="...">
				<div class="caption">
					<h3>제목5</h3>
				</div>
			</div>
			</a>
			<a href="<c:url value="/"/>">
			<div class="thumbnail col-md-4">
				<img src="<c:url value="/img/asd.png"/>" alt="...">
				<div class="caption">
					<h3>제목6</h3>
				</div>
			</div>
			</a>
			</div>
		</div>
	</div>
</div>