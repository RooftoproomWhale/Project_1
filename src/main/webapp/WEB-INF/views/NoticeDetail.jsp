<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
#footer 
 	{ 
		position: absolute; 
		width:100%; 
		left:0px; 
 		bottom:0px; 
 		background-color:#474747;
 		height: 150px
 		
 	} 
</style>
<html lang="en">
<div class="container" style="margin-top: 150px; margin-bottom: 50px;">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header board-util-text color-red">
				<h2 style="color: black;">제목제목</h2>
			</div>
			<p style="min-height: 300px;">안녕하세요 (주)비브로스 입니다. 똑닥 서비스를 이용해 주셔서
				감사의 말씀을 드리며, 2020년 5월6일 자로 개인정보처리방침이 개정되어 변경 내용을 알려드립니다. ※주요 변경 내용

				개인정보처리방침 개인정보의 수집 및 이용 목적 업무 위탁의 목적 및 책임범위 개인정보 처리의 위탁 개인정보의 처리 및 보유
				기간 변경된 자세한 내용의 약관은 첨부파일 확인해주시길 바랍니다. 공고일자 : 2020-04-22 시행일자 :
				2020-05-06</p>
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