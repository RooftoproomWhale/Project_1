<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
	
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

<style>


.sticky-btn {
  position: fixed;
  bottom: 30px;
  right: 50px;
  z-index: 1231234;
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
<!-- 		      <div class="modal-header"> -->
<!-- 		        <button class="close" data-dismiss="modal" > -->
<!-- 		        	<span>&times;</span> -->
<!-- 		        </button> -->
<!-- 		        <h4 class="modal-title" >기본 모달창</h4> -->
<!-- 		      </div> -->
		      <div class="modal-body">
		        <div class="col-lg-12">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40 au-card--border">
                                    <div class="au-card-title" style="background-image:url('images/bg-title-02.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-comment-text"></i>Chat</h3>
                                        <button class="au-btn-plus">
                                            <i class="zmdi zmdi-plus"></i>
                                        </button>
                                    </div>
                                    <div class="au-inbox-wrap">
                                        <div class="au-chat au-chat--border">
                                            <div class="au-chat__title">
                                                <div class="au-chat-info">
                                                    <div class="avatar-wrap online">
                                                        <div class="avatar avatar--small">
                                                            <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                                        </div>
                                                    </div>
                                                    <span class="nick">
                                                        <a href="#">John Smith</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="au-chat__content au-chat__content2 js-scrollbar5">
                                                <div class="recei-mess-wrap">
                                                    <span class="mess-time">12 Min ago</span>
                                                    <div class="recei-mess__inner">
                                                        <div class="avatar avatar--tiny">
                                                            <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                                        </div>
                                                        <div class="recei-mess-list">
                                                            <div class="recei-mess">Lorem ipsum dolor sit amet elit</div>
                                                            <div class="recei-mess">Donec tempor viverra</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="send-mess-wrap">
                                                    <span class="mess-time">30 Sec ago</span>
                                                    <div class="send-mess__inner">
                                                        <div class="send-mess-list">
                                                            <div class="send-mess">Lorem ipsum dolor sit amet elit</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="au-chat-textfield">
                                                <form class="au-form-icon">
                                                    <input class="au-input au-input--full au-input--h65" type="text" placeholder="Type a message">
                                                    <button class="au-input-icon">
                                                        <i class="zmdi zmdi-camera"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn btn-info" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>

