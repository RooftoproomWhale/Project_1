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
    background:#808080;
  }
  .sidebar-nav li:first-child{ background:#4d4d4d}
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
    color:#fff
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #fff;
  }
  /*현재페이지*/
/*   .sidebar-nav :nth-child(2) a{ color: #fff;background: #B2EBF4; } */
  
  
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
	font-weight: bold;
	margin-top:0px;
	margin-bottom: 0px;
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

	  <h3 class="sidebar-brand" style="height: 90px;text-align: center;line-height: 90px;height: 120px">
    	<img style="width: 100%;height: 100%" src="<c:url value='/img/mypages.PNG'/>">
       </h3>
	<ul class="sidebar-nav">
	<li><span class="glyphicon glyphicon-leaf" style="left: -20px"><strong>김길동</strong>님</span></li>
      <li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
      <li><a href="<c:url value='/mypage/Yun.hst'/>">복약 관리</a></li>
      <li><a href="<c:url value='/mypage/ReservationList.hst'/>">진료 예약 현황</a></li>
      <li><a href="#">내 질병 관리</a></li>
      <li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
    </ul>
  </div>
<div class="main row" style="margin-top: 82px;padding-bottom:10px;background-color: #F3F3F3;">
  <!-- 첫번째 줄 -->

<div class="page content col-md-8" style="padding-right: 50px;left:60px;top:60px">
	<!-- 본문 시작 -->
	
				<div class="page-header">
					<h2>진료 예약 현황</h2>
				</div>
				<div style="max-width: 1300px; text-align: right;">
					<a href="./boardWrite.html" class="btn btn-primary float-right">글쓰기</a>
				</div>
				<hr>
				<table class="table table-striped" style="max-width: 1300px;">
					<thead>
						<tr>
							<th scope="col" class="mobile" style="width: 55px; text-align: center;">번호</th>
							<th scope="col" class="mobile" style="text-align: center;">병원이름</th>
							<th scope="col" class="mobile" style="width: 80px; text-align: center;">예약자</th>
							<th scope="col" class="mobile" style="width: 120px; text-align: center;">예약날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">5</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">4</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th scope="row" class="mobile" style="text-align: center;">3</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th class="mobile" scope="row" style="text-align: center;">2</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
						<tr>
							<th class="mobile" scope="row" style="text-align: center;">1</th>
							<td><a href="./boardView.html" style="color: #000000;">홈스피탈.</a></td>
							<td class="mobile" style="text-align: center;">김길동</td>
							<td class="mobile" style="text-align: center;">2020-06-05</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;">
					<ul class="pagination">
						<li class="page-item"><span class="page-link">&laquo;</span>
						</li>
						<li class="page-item"><a class="page-link mobile" href="#">1</a></li>
						<li class="page-item"><a class="page-link mobile" href="#">2</a></li>
						<li class="page-item"><a class="page-link mobile" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div>
				<!-- 검색용 UI -->
				<div class="row">
					<div class="text-center">
						<form class="form-inline" method="post" action="">
							<div class="form-group">
								<select name="searchColumn" class="form-control">
									<option value="title">병원</option>
									<option value="name">예약자</option>
									<option value="content">날짜</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" name="searchWord" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</form>
					</div>
				</div>
	
 </div>
  </div>
</div>
 
  <script>
</script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>