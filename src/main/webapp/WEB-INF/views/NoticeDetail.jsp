<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<div class="container" style="margin-top: 150px; margin-bottom: 50px;">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header board-util-text color-red">
				<h2 style="color: black;">제목제목</h2>
			</div>
			<p style="min-height: 300px;">내용~</p>
			<div class="page-header board-util-text color-red"></div>
			<div class="col-md-3 col-md-offset-9">
				<button class="btn btn-default"
					href="<c:url value="/Homespital/Notice.hst"/>">목록</button>
				<button class="btn btn-default">수정</button>
				<button class="btn btn-default">삭제</button>
			</div>
		</div>
	</div>
</div>