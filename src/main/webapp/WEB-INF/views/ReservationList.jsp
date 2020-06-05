<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 82%;
    margin-left: -250px;
    background: #fff;
    overflow-x: hidden;
    overflow-y: auto;
     border: 1px #DAD9FF solid;
    margin-top: 79px;

  
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
 padding-top: 150px;
 margin-left:130px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  /*현재페이지*/
  .sidebar-nav :nth-child(2) a{ color: #fff;background: #B2EBF4; }
  
  
  .sidebar-nav li:not(.sidebar-brand):hover {
    color: #fff;
    background: #B2EBF4;
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
	.sidebar-brand{
	background-color: #C2E2E8;
	margin-bottom: 0.5px;
	font-weight: bold;
	}
	.info{
		font-size: 1.3em;
		line-height: 3em;
		
	}
	
#main{background-color: #B2EBF4;width: 100%;height: 48px;margin: 0px;margin-bottom: 9px;text-align: center;line-height: 48px;border-radius:0.69em 0.69em 0 0;color: #5f6368}
	/*Best5*/

@media all and (min-width:500px) and (max-width:1024px){
#sidebar-wrapper{    left:-250px;}
.main{left:-150px;}
#page-wrapper{left:-150px;padding-left: 0px;margin-left: 0px}
#app{display: none}
#appdown{width: 90%;float: inherit;margin-left: 76px;margin-top: 0px}
}

.list-unstyled1 .list-unstyled2{height: 100%;padding-left: 20px;width: 100%}
</style>
<script>

</script>
<div id="page-wrapper" class="container-fluid">

<div  id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">마이페이지</a>
      </li>
      <li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
      <li><a href="#">복약 관리</a></li>
      <li><a href="#">진료 예약 현황</a></li>
      <li><a href="#">내 질병 관리</a></li>
      <li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
    </ul>
  </div>
<div class="main row" style="margin-top: 82px;padding-bottom:10px;background-color: #F3F3F3;">
  <!-- 첫번째 줄 -->
<div class="col-md-12" style="background-color: #C2E2E8; height: 54.6px;bottom: 3px"></div>
<div class="page content col-md-8" style="padding-right: 50px;left:60px;top:60px">


 </div>
  </div>
</div>
 
  <script>
  $(function() {
	var bmi = 72/(180*180)*10000;
	
  $('#bmi').html(bmi.toFixed(2));
    
    });
</script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>