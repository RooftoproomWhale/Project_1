<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  
<style>

.sticky-btn {
  position: fixed;
  bottom: 30px;
  right: 50px;
  z-index: 1;
}

.sticky-btn {
  position: fixed;
  bottom: 30px;
  right: 50px;
  z-index: 1;
  color: #ff0000
}

#fa1:hover {
  color: #ffffff
}

#fa2:hover { 
  color: #ff9900
}

</style>
<body>
	<div class="sticky-btn">
 	<span class="fa-stack fa-3x" data-toggle="modal" data-target="#basic-modal">
<%--    		<i class="fa fa-circle fa-stack-2x" style=" color: #ff9900; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
<%--   		<i class="fa fa-user-md fa-stack-1x fa-inverse" style=" color: #ffffff; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
		<i id="fa1" class="fa fa-circle fa-stack-2x" style="color: #ff9900;"></i>
   		<i id="fa2" class="fa fa-user-md fa-stack-1x fa-inverse" style="color: #ffffff;"></i>
	</span>
	</div>
	<div class="modal fade" id="basic-modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button class="close" data-dismiss="modal" >
		        	<span>&times;</span>
		        </button>
		        <h4 class="modal-title" >기본 모달창</h4>
		      </div>
		      <div class="modal-body">
		        <h2>모달 바디 영역입니다</h2>
		        <p>안녕하세요<br/>기본 모달창입니다<br/>재미 있네요</p>
		      </div>
		      <div class="modal-footer">
		        <button class="btn btn-info" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>

