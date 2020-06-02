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
 	<span class="fa-stack fa-3x" data-toggle="modal" data-target="#large-modal">
<%--    		<i class="fa fa-circle fa-stack-2x" style=" color: #ff9900; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
<%--   		<i class="fa fa-user-md fa-stack-1x fa-inverse" style=" color: #ffffff; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
		<i id="fa1" class="fa fa-circle fa-stack-2x" style="color: #ff9900;"></i>
   		<i id="fa2" class="fa fa-user-md fa-stack-1x fa-inverse" style="color: #ffffff;"></i>
	</span>
	<!--  큰 모달창 -->
    	<div class="modal fade" id="large-modal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-body">
		    		<button class="close" data-dismiss="modal">
		    			<span>&times;</span>
		    		</button>
		    		<h2>모달 컨텐츠 영역입니다</h2>
		        	<p>안녕하세요<br/>큰 모달창입니다<br/>재미 있네요</p>
		    	</div>
		    </div>
		  </div>
		</div>
		<!-- 큰 모달창 끝 -->
	</div>
	
</body>
</html>

