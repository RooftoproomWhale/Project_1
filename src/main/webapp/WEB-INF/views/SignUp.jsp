<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*custom font*/
@import url(https://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {margin: 0; padding: 0;}

html {
   height: 100%;
   /*Image only BG fallback*/
   
   /*background = gradient + image pattern combo*/
   background:white;
}

body {
   font-family: montserrat, arial, verdana;
}
/*form styles*/
#msform {
   width: 1000px;
   
   margin: 60px auto;
   text-align: center;
   position: relative;
}
#msform fieldset {
   background: #;
   border: 0 none;
   border-radius: 3px;
   box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
   padding: 20px 30px;
   box-sizing: border-box;
   width: 80%;
   margin: 0 10%;
   
   
   /*stacking fieldsets above each other*/
   position: relative;
}
/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
   display: none;
}
/*inputs*/
#msform input[type="text"],#msform input[type="password"], #msform textarea {
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 100%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   height: 40px;
}

#msform textarea[name="chart"], #msform textarea[name="chart2"]
{
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 100%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   height: 150px;
}


/*buttons*/
#msform .action-button {
   width: 100px;
   background: #white;
   font-weight: bold;
   color: #white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
   border-radius : 7px 7px 7px 7px;
}
#msform .action-button:hover, #msform .action-button:focus {
   
   box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
   font-size: 15px;
   text-transform: uppercase;
   color: #2C3E50;
   margin-bottom: 10px;
}
.fs-subtitle {
   font-weight: normal;
   font-size: 13px;
   color: #666;
   margin-bottom: 20px;
}

button{
   width: 100px;
   background: #white;
   font-weight: bold;
   color: #white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
   border-radius : 7px 7px 7px 7px;
}
/*progressbar*/
#progressbar {
   margin-bottom: 30px;
   overflow: hidden;
   /*CSS counters to number the steps*/
   counter-reset: step;
   margin-top: 150px;
}
#progressbar li {
   list-style-type: none;
   color: black;
   text-transform: uppercase;
   font-size: 9px;
   width: 33.3%;
   float: left;
   position: relative;
}
#progressbar li:before {
   content: counter(step);
   counter-increment: step;
   width: 20px;
   line-height: 20px;
   display: block;
   font-size: 10px;
   color: #333;
   background: white;
   border-radius: 3px;
   margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
   content: '';
   width: 100%;
   height: 2px;
   background: #00ff00;
   position: absolute;
   left: -50%;
   top: 9px;
   z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
   /*connector not needed before the first step*/
   content: none; 
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before,  #progressbar li.active:after{
   background: #00ff00;
   color: black;
}

#gender{
   width: 100%;
   height: 40px;
   border: 1px solid #ccc;
   border-radius: 3px;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   float: left;
   padding: 10px 8px;
   
   
}

#age{
   width: 100%;
   height: 40px;
   border: 1px solid #ccc;
   border-radius: 3px;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   float: left;
   padding: 10px 8px;   
}

#contact{
position:absolute;
top: 1000px;
width: 100%;
}
#footer{
position:absolute;
top: 1300px;
width: 100%;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<script>

$(function(){
//jQuery time
var current_fs, next_fs, previous_fs; //필드
var left, opacity, scale; //애니매이션 필드 셋 속성
var animating; //빠른 멀티 클릭시 방지를 위한 플래그

$(".next").click(function(){
   if(animating)
   {
      return false;
   }
   animating = true;
   current_fs = $(this).parent();
   next_fs = $(this).parent().next();
   
   //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
   $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
   
   //다음 필드셋 표시
   next_fs.show(); 
   //현재 필드셋을 스타일로 숨긴다.
   current_fs.animate({opacity: 0}, {
      step: function(now, mx) {
         //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
         //1.current_fs 80%로 축소
         scale = 1 - (1 - now) * 0.2;
         //2.오른쪽에서 next_fs 50% 가져오기
         left = (now * 50)+"%";
         //3.next_fs의 불투명도 1로 증가시킨다
         opacity = 1 - now;
         current_fs.css({
      'transform': 'scale('+scale+')',
      'position': 'absolute'
    });
         next_fs.css({'left': left, 'opacity': opacity});
      }, 
      duration: 800, 
      complete: function(){
         current_fs.hide();
         animating = false;
      }, 
      //사용자가 정의 플러그인에서 나옴
      easing: 'easeInOutBack'
   });
});

$(".previous").click(function(){
   if(animating) return false;
   animating = true;
   
   current_fs = $(this).parent();
   previous_fs = $(this).parent().prev();
   
   //진행률 표시줄에서 현재 단계 비활성화
   $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
   
   //이전 필드셋 표시
   previous_fs.show(); 
   //현재 필드셋을 스타일로 숨긴다.
   current_fs.animate({opacity: 0}, {
      step: function(now, mx) {
         //current_fs의 불투명도가 0이므로 줄어듦 - now에 저장 됨
         //1.previous_fs를 80%에서 100%로 확장
         scale = 0.8 + (1 - now) * 0.2;
         //2.current_fs를 오른쪽으로 가져감 (50%)-0%
         left = ((1-now) * 100)+"%";
         //3.previous_fs의 불투명도를 1로 증가시킴.
         opacity = 1 - now;
         current_fs.css({'left': left});
         previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
      }, 
      duration: 800, 
      complete: function(){
         current_fs.hide();
         animating = false;
      }, 
      //사용자 정의 플로그인에서 나옴
      easing: 'easeInOutBack'
   });
   
});




$(".submit").click(function(){
   return false;
})

});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>

<!-- multistep form -->

<form id="msform">
  <!-- progressbar -->

  <div class="col-md-offset-2 col-md-8 col-xs-6" align="center">
  <ul id="progressbar">
    <li class="active">Account Setup</li>
    <li>individual Setup</li>
    <li>etc</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">계정 정보</h2>
    <h3 class="fs-subtitle">1번째 단계입니다.</h3>
       <input type="text" name="id" placeholder="아이디" />
       <input type="password" name="pass" placeholder="비밀번호" />
       <input type="password" name="cpass" placeholder="비밀번호 확인" />
       <input type="button" name="next" class="next action-button" value="다음" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">개인 정보</h2>
    <h3 class="fs-subtitle">2번째 단계입니다.</h3>
    <div class="form-group">
    <div class="col-lg-12" >
       <input type="text" name="name" placeholder="이름" />
       <input type="text" name="phone" placeholder="핸드폰 번호" />
       <input type="text" name="email" placeholder="이메일" />
       <input type="text" name="adress" placeholder="주소" />   
    </div>
       <div class="col-lg-6" >
           <select class="form-control" id="gender"> 
              <option value="X"> 성별</option>
               <option value="M"> 남자</option>
               <option value="F"> 여자</option>
           </select>
       </div>
   
       <div class="col-lg-6">
           <select class="form-control" id="age" >
              <option>나이</option>
              <option value="">10세 이하</option>
               <option value="">10대</option>
               <option value="">20대</option>
               <option value="">30대</option>
               <option value="">40대</option>
               <option value="">50대</option>
               <option value="">60대</option>
               <option value="">70대</option>
               <option value="">80대</option>
               <option value="">90대</option>
           </select>
       </div>
   </div> 
  
       <input type="button" name="previous" class="previous action-button" value="이전" />
       <input type="button" name="next" class="next action-button" value="다음" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">기타사항</h2>
    <h3 class="fs-subtitle">마지막 단계입니다.</h3>
       <textarea name="chart" placeholder="이전병력"></textarea>
       <textarea name="chart2" placeholder="만성질환"></textarea>
    <input type="button" name="previous" class="previous action-button" value="이전" />
    <input type="button" name="next" class="next action-button" value="다음" />
    <input type="button" name="previous" class="previous action-button" value="회원가입" />

    <div class="form-group">
    <label>약관 동의</label>
    <div data-toggle="buttons">
    <label class="btn btn-primary active">
    <span class="fa fa-check"></span>
    <input id="agree" type="checkbox" autocomplete="off" checked>
    </label>
    <a href="#">이용약관</a>에 동의합니다.
    </div>
    </div>
            <div class="form-group" >
             <div class="col-sm-2 control-label">
                <label id="address1"></label>
             </div>
             <div class="col-sm-6">
                <input type="text" id="sample6_address"
                placeholder="주소"  name="address1"   class="form-control">
             </div>   
           </div>
      
          <div class="form-group"> 
             <div class="col-sm-2 control-label">
                <label id="address1"></label>
             </div>
             <div class="col-sm-6"> 
               <input type="text" id="sample6_address2" placeholder="상세주소" name="address2"   class="form-control">
               </div>
          </div>
</fieldset>
</div>

</form>


