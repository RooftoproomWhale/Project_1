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
.color-red{color:red;}
.table-wrapper .line { border-left:1px solid #dadada;}
 .box-default { font-size:15px; color:#115bab;background-color: #D5D5D5;height: 70px;text-align: center;line-height: 70px;width: 100%}
.table-wrapper .table-default thead .write { text-align: left; color:#6e7179;}
 .table-wrapper .table-default tbody tr td { position:relative; padding-right:0; padding-left:0;}
 .table-wrapper .table-default tbody tr td .input-conut-limit { position:absolute; bottom:9px; right:22px; }
  .table-default tr th,.table-default tr td {font-size:13px}
  .default-info-heading { margin-bottom: 20px; }
  .button-blue{background:#57a5df;}
  table {border-top: 3px #D5D5D5 solid;border-bottom: 3px #D5D5D5 solid; width: 100%;margin: 10px;height: 220px}
.board-util-right{float: right;height: 50px}.board-util{height: 48px;top:9px;}.board-util button{height: 48px;width: 100px}
#passForm{width: 1200px}
#contents{margin-top:140px;padding-left: 200px;margin-bottom: 167px}
caption{font-size: 15px;font-weight: bold;}
@media all and (min-width:500px) and (max-width:1024px){
#sidebar-wrapper{    left:-250px;}
.main{left:-150px;}
#page-wrapper{left:-150px;padding-left: 0px;margin-left: 0px}
#app{display: none}
#appdown{width: 90%;float: inherit;margin-left: 76px;margin-top: 0px}
#contents{padding-left: 20px;margin-left: 20px}
.board-util-right{float: left;}
}
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
  <div class="main row" style="margin-top: 82px;padding-bottom:15px;">
 
  		<section id="contents"> <!-- /////////////////////////////////// Contents [S] -->

				<h2 class="hidden">비밀번호 변경</h2>

				<form id="passForm" name="passForm" method="post" action="">
				<input type="hidden" name="mode" value="delete"/>

					<div class="box-default">
						※ 정보를 수정하신 후 확인 버튼을 클릭하셔야 정보 수정이 완료됩니다.
					</div>

					<div class="board-util board-util-top">
						<div class="board-util-right">
							<span class="board-util-text color-red">* 필수 입력 항목</span>
						</div>
					</div>

					<div class="table-wrapper">
						<table class="table-default board-form">
							<caption>비밀번호 변경</caption>
							<colgroup>
								<col style="width: 140px" />
								<col />
							</colgroup>
							<tbody>
								<!--<tr>
									<th scope="row">아이디 <span class="required">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="text" name="userId" id="userId" class="input-text" title="아이디" role="textbox" />
										</div>

									</td>
								</tr>-->
								<tr>
									<th scope="row">현재 비밀번호<span class="color-red">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="password" name="userPasswd" id="userPasswd" class="input-text" title="현재 비밀번호" role="textbox" />
										</div>

									</td>
								</tr>
								<tr>
									<th scope="row">새 비밀번호 <span class="color-red">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="password" name="newuserPasswd" id="newuserPasswd" class="input-text" title="새 비밀번호" role="textbox" />
										</div>

									</td>
								</tr>
					<tr>
									<th scope="row">새 비밀번호 확인 <span class="color-red">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="password" name="userPasswdOK" id="userPasswdOK" class="input-text" title="새 비밀번호 확인" role="textbox" />
										</div>

									</td>
								</tr>
					
							</tbody>
						</table>
					</div>

					<div class="board-util">
						<div class="board-util-right">
							<button type="button" class="btn btn-primary" role="button" onclick="Form();"><span class="button-text">확인</span></button>
							<button type="button" class="btn" role="button" onclick="back();"><span class="button-text">취소</span></button>
						</div>
					</div>	

				</form>

			</section> 
</div>
</div>
  <script>


  	function back(){
  			close=confirm("취소하시겠습니까?")
		if(close){
  		$(location).attr('href', '<c:url value='/mypage/mypage.hst'/>');
  			}
  			
  	}

  	function Form() {
 
  		var userPasswd = $('#userPasswd');
  		if($.trim(userPasswd.val()).length < 1 || $.trim(userPasswd.val()) == '') {
  			alert('현재 비밀번호를 입력해 주세요.');
  			userPasswd.focus();
  			return;
  		}
  		var newuserPasswd = $('#newuserPasswd');
  		if($.trim(newuserPasswd.val()).length < 1 || $.trim(newuserPasswd.val()) == '') {
  			alert('새 비밀번호를 입력해 주세요.');
  			newuserPasswd.focus();
  			return;
  		}
  		var userPasswdOK = $('#userPasswdOK');
  		if($.trim(userPasswdOK.val()).length < 1 || $.trim(userPasswdOK.val()) == '') {
  			alert('새 비밀번호 확인을 입력해 주세요.');
  			userPasswdOK.focus();
  			return;
  		}
  		if($.trim(newuserPasswd.val())!= $.trim(userPasswdOK.val())) {
  			alert('새비밀번호가 일치하지 않습니다');
  			userPasswdOK.focus();
  			return;
  		}

  		if(confirm('정말로 변경하시겠습니까?')) {
  			$('form[name=passForm]').submit();
  		}
  	}

  
  </script>
  

    

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>