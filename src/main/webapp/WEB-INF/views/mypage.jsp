<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.content-one,.content-to{border:1px #D8D8D8 solid 	; height: 200px;padding: 0;border-radius:1em;margin-bottom: 30px;}
	.content-one ul li{padding-left:10px}
	.content-one ul li:not(:last-child){padding-bottom: 2px;border-bottom:1px  #D8D8D8 solid;}
	.list-unstyled2 li:last-child{text-align: center;padding-top:17px}
  #appdown{width: 300px;height:75%;margin-top:5px}
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
.homeFaqSec {position:relative;clear:both;float:left;width:580px;height:163px;border: 2px #BDBDBD solid;padding-bottom: 0px;margin-bottom: 0px;}
.homeFaqSec h3 {width:101px;height:24px;padding:19px 0 0 10px;border-bottom:1px solid #e0e1e3;}
.homeFaqSec .faqBest5 li h4 {font-weight:normal;}
.homeFaqSec .faqBest5 li h4 a {position:absolute;z-index:100;display:block;top:0;left:24px;width:97px;height:12px;padding-top:10px;color:#000000;padding-left: 5px}
.homeFaqSec .faqBest5 li.on h4 a {font-weight:bold;color:#6f81f3;background:url(https://ssl.nx.com/S2/membership/2011/home/bg_faqon.gif) no-repeat right top;}
.homeFaqSec .faqBest5 .faqList1 h4 a {top:51px;}
.homeFaqSec .faqBest5 .faqList2 h4 a {top:75px;}
.faqBest5List {position:absolute;top:0px;left:118px;height:163px;padding-left:23px;background:url(https://ssl.nx.com/S2/membership/2011/home/bg_faq.gif) no-repeat left top;}
.faqBest5List p {width:100%;height:35px;padding:10px 0 0 0;border-bottom:1px solid #e0e1e3;}
.faqBest5List .moreBt {position:absolute;top:13px;right:10px;}
.faqBest5List ol {line-height:1.2;}
.faqBest5List ol li {overflow:hidden;width:439px;height:18px;margin-bottom:3px;padding:3px 0 6px; white-space:nowrap; word-break:break-all; text-overflow:ellipsis;}
.faqBest5List ol li span {display:inline-block;background-color:#aeaeab;font-size:11px;color:#ffffff;padding:2px 4px 0px 3px;}
.faqBest5List ol li:hover span {background-color:#787878;}
.faqBest5List ol a:hover {color:#333333;}
.customerSec {float:left;height:215px;}
.customerSec img {vertical-align:top;}
.customerSec a {display:block;margin-bottom:5px;}
.list-unstyled1 li {font-size: 1.2em;font-weight: bold;color: black;}
.list-unstyled1 span{font-weight: normal;color: #A6A6A6;}
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

<div class='content-one col-md-5'>
   <h3 id="main">내정보</h3>
     	<ul class="list-unstyled1" >
     
     		<li>이름&emsp; &emsp; 	<span>김길동</span></li>
     		<li>E-mail &nbsp;  &nbsp; <span>정보없음</span></li>
     		<li>성별&nbsp;  &ensp;&emsp;   <span>남성</span></li>
     		<li>연락처&nbsp;  &ensp;&emsp;   <span>010-1234-5678</span></li>
     		<li>나이&nbsp;  &ensp;&emsp;   <span>30</span></li>
     		<li>키&nbsp;  &emsp;&emsp; &ensp;  <span>180cm</span></li>
     		<li>몸무게  &nbsp; &ensp;&emsp;   <span>72kg</span></li>
     	</ul>
     </div>
   
      <div class='content-to col-md-offset-1 col-md-5' >
      <h3 id="main">진료 예약</h3>
   <ul class="list-unstyled2" style="height: 100%">
     	
     		<li><input type="text" value='010-1234-5678' style="width: 50%;margin-right: 0px;padding-right: 0px"/><input  style="width: 50%;height:34px;margin-left:0px;padding-left:0px;border:3px white solid;" class="btn-info" type="button" value="빠른예약 신청"></li>
     		<li><input class="btn btn-info" style="width: 100%" type="button" value="온라인 예약"/></li>
     		<li><h4><span class="glyphicon glyphicon-phone-alt"> </span>&nbsp;전화문의 1588-1588</h4>
     	</ul>
     </div>
     
       <!-- 2번째 줄 -->
          <div class='content-one col-md-5'>
   	<h3 id="main">내 질병 관리</h3>
     	<ul class="list-unstyled1" style="height: 100%">
     		<li>과거력  &nbsp; &ensp;&emsp;   <span>수술이력, 천식</span></li>
     		<li>만성 질병 &nbsp;  &nbsp; <span>정보없음</span></li>
     	</ul>
     </div>
      <div class='content-to col-md-offset-1 col-md-5' >
      <h3 id="main">병원,약국 찾기</h3>
     	<ul class="list-unstyled4" style="height: 100%">
     		<li><input class="btn btn-info" style="width: 100%" type="button" value='병원 찾기' onclick=""></li>
     		<li><input class="btn btn-info" style="width: 100%;margin-top:3px" type="button" value="약국 찾기" onclick="location.href='<c:url value='/Map.hst'/>'"/></li>
     	</ul>
     </div>
     <!-- 3번째 줄 -->
     <div class="homeFaqSec col-md-5">
			<h3><img src="https://ssl.nx.com/S2/membership/2011/home/stit_faq.gif"  alt="자주묻는질문"/></h3>
			<ul class="faqBest5">
				<li class="faqList1 on">
					<h4><a href="#" name="faqService">내정보</a></h4>
					<div class="faqBest5List">						
						<p>고객님께서 자주 찾으시는 질문 <strong>Best5</strong>를 모았습니다.</p>				
						<ol>
							<li><a href=""><span>1</span>[내 질병 관리] ?????????</a></li>
							<li><a href="" ><span>2</span> [회원탈퇴] 기존ID 회원탈퇴를 하고 싶어요.</a></li>
							<li><a href="" ><span>3</span> [회원가입] ID는 몇 개나 만들 수 있나요?</a></li>
							<li><a href="" ><span>4</span> [회원탈퇴] 이메일ID 회원탈퇴를 하고 싶어요.</a></li>
							<li><a href="" ><span>5</span> [내정보] 마이페이지 시바꺼.</a></li>
						</ol>
<!-- 						<span class="moreBt"><a href="" target="_blank" title="내정보 도움말 더보기"><img src="https://ssl.nx.com/S2/membership/2011/button/bt_more.gif" width="36" height="10" alt="내정보 도움말 더보기" /></a></span> -->
					</div>
				</li>
				
			</ul>
		</div>
		<div class='col-md-3' >
     	<ul class="list-unstyled4" style="height: 100%">
     	<li><input class="btn btn-info" style="width: 100%;height: 50%" type="button" value='회원정보 변경' onclick="location.href='<c:url value='/mypage/ChangeMember.hst'/>'"/></li>
     		<li><input class="btn btn-info" style="width: 100%;height:50%;margin-top:5px" type="button" value="비밀번호 변경" onclick="location.href='<c:url value='/mypage/ChangePassword.hst'/>'"/></li>
     	</ul>
     </div>
</div>
<!-- 오른쪽 사이드 -->
 <div class="page con2 col-md-3" style="padding-top: 60px">
   <img id="app" style="width: 300px;height: 600px" alt="앱사진" src="<c:url value='/img/1111.png'/>">
   <input id="appdown"class="btn btn-primary" type="button" value="앱 다운로드" onclick="location.href='https://play.google.com/store/search?q=%ED%99%88%EC%8A%A4%ED%94%BC%ED%83%88'"/>
 </div>
  </div>
</div>
 
  
    

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>