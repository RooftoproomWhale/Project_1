<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
   text-align: left;
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
button{
   width: 300px;
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
#msform .action-button{
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
   width: 25%;
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
   $(function() {
      //jQuery time
      var current_fs, next_fs, previous_fs; //필드
      var left, opacity, scale; //애니매이션 필드 셋 속성
      var animating; //빠른 멀티 클릭시 방지를 위한 플래그
      
      $("#sendButton").on('click',function(){
      	alert("홈스피탈 서비스 인증 번호 해당 메일로 발송하였습니다")
      	$.ajax({
      		type:'post',
      		url:'/proj/mailauth/testMail.hst',
      		data:'',
      		success:function(result){
      			
      		}
      	})
      })
      
      $("#checkButton").on('click',function(){
      	alert("인증이 완료 되었습니다")
      	$.ajax({
      		type:'post',
      		url:'/mailauth/emailConfirm.hst',
      		data:'',
      		success:function(result){
      			
      		}
      	})
      })
      $( document ).ready( function() {
        $( '.check-all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
        } );
      } );
	
      $(".next").click(
            function() {
               if (animating) {
                  return false;
               }
               animating = true;
               current_fs = $(this).parent();
               next_fs = $(this).parent().next();

               //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
               $("#progressbar li").eq($("fieldset").index(next_fs))
                     .addClass("active");

               //다음 필드셋 표시
               next_fs.show();
               //현재 필드셋을 스타일로 숨긴다.
               current_fs.animate({
                  opacity : 0
               }, {
                  step : function(now, mx) {
                     //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                     //1.current_fs 80%로 축소
                     scale = 1 - (1 - now) * 0.2;
                     //2.오른쪽에서 next_fs 50% 가져오기
                     left = (now * 50) + "%";
                     //3.next_fs의 불투명도 1로 증가시킨다
                     opacity = 1 - now;
                     current_fs.css({
                        'transform' : 'scale(' + scale + ')',
                        'position' : 'absolute'
                     });
                     next_fs.css({
                        'left' : left,
                        'opacity' : opacity
                     });
                  },
                  duration : 800,
                  complete : function() {
                     current_fs.hide();
                     animating = false;
                  },
                  //사용자가 정의 플러그인에서 나옴
                  easing : 'easeInOutBack'
               });
            });

      $(".previous").click(
            function() {
               if (animating)
                  return false;
               animating = true;

               current_fs = $(this).parent();
               previous_fs = $(this).parent().prev();

               //진행률 표시줄에서 현재 단계 비활성화
               $("#progressbar li").eq($("fieldset").index(current_fs))
                     .removeClass("active");

               //이전 필드셋 표시
               previous_fs.show();
               //현재 필드셋을 스타일로 숨긴다.
               current_fs.animate({
                  opacity : 0
               }, {
                  step : function(now, mx) {
                     //current_fs의 불투명도가 0이므로 줄어듦 - now에 저장 됨
                     //1.previous_fs를 80%에서 100%로 확장
                     scale = 0.8 + (1 - now) * 0.2;
                     //2.current_fs를 오른쪽으로 가져감 (50%)-0%
                     left = ((1 - now) * 100) + "%";
                     //3.previous_fs의 불투명도를 1로 증가시킴.
                     opacity = 1 - now;
                     current_fs.css({
                        'left' : left
                     });
                     previous_fs.css({
                        'transform' : 'scale(' + scale + ')',
                        'opacity' : opacity
                     });
                  },
                  duration : 800,
                  complete : function() {
                     current_fs.hide();
                     animating = false;
                  },
                  //사용자 정의 플로그인에서 나옴
                  easing : 'easeInOutBack'
               });

            });

      $(".submit").click(function() {
         return false;
      })
      
     
      
      $("#auth_prev").click(function(){
         if (animating) {
              return false;
           }
           animating = true;
           current_fs = $(this).parent();
           previous_fs = $(this).parent().prev().prev().prev().prev();
           

           //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
           $("#progressbar li").show();
           $("#progressbar li").eq($("fieldset").index(previous_fs))
                 .addClass("active");

           previous_fs.show();
               //현재 필드셋을 스타일로 숨긴다.
               current_fs.animate({
                  opacity : 0
               }, {
                  step : function(now, mx) {
                     //current_fs의 불투명도가 0이므로 줄어듦 - now에 저장 됨
                     //1.previous_fs를 80%에서 100%로 확장
                     scale = 0.8 + (1 - now) * 0.2;
                     //2.current_fs를 오른쪽으로 가져감 (50%)-0%
                     left = ((1 - now) * 100) + "%";
                     //3.previous_fs의 불투명도를 1로 증가시킴.
                     opacity = 1 - now;
                     current_fs.css({
                        'left' : left
                     });
                     previous_fs.css({
                        'transform' : 'scale(' + scale + ')',
                        'opacity' : opacity
                     });
                  },
                  duration : 800,
                  complete : function() {
                     current_fs.hide();
                     animating = false;
                  },
                  //사용자 정의 플로그인에서 나옴
                  easing : 'easeInOutBack'
           });
      })
			
      $("#authHos").click(function name() {
    	  if ($("#check_1").is(":checked") == false) {
              alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
              return;
           } else if ($("#check_2").is(":checked") == false) {
              alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
              return;
           } else if ($("#check_3").is(":checked") == false) {
              alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
              return;
           } else {
        	   if (animating) {
                   return false;
                }
                animating = true;
                current_fs = $(this).parent();
                next_fs = $(this).parent().next().next().next().next();

                //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
                $("#progressbar li").hide();

                //다음 필드셋 표시
                next_fs.show();
                //현재 필드셋을 스타일로 숨긴다.
                current_fs.animate({
                   opacity : 0
                }, {
                   step : function(now, mx) {
                      //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                      //1.current_fs 80%로 축소
                      scale = 1 - (1 - now) * 0.2;
                      //2.오른쪽에서 next_fs 50% 가져오기
                      left = (now * 50) + "%";
                      //3.next_fs의 불투명도 1로 증가시킨다
                      opacity = 1 - now;
                      current_fs.css({
                         'transform' : 'scale(' + scale + ')',
                         'position' : 'absolute'
                      });
                      next_fs.css({
                         'left' : left,
                         'opacity' : opacity
                      });
                   },
                   duration : 800,
                   complete : function() {
                      current_fs.hide();
                      animating = false;
                   },
                   //사용자가 정의 플러그인에서 나옴
                   easing : 'easeInOutBack'
                });  	
           }
	});
      
      
         $(".nextBtn").click(function() {
            if ($("#check_1").is(":checked") == false) {
               alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
               return;
            } else if ($("#check_2").is(":checked") == false) {
               alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
               return;
            } else if ($("#check_3").is(":checked") == false) {
               alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
               return;
            } else {
               if ($("#check_authHos").is(":checked") == false)
                 {
                  if (animating) {
                        return false;
                     }
                     animating = true;
                     current_fs = $(this).parent();
                     next_fs = $(this).parent().next();

                     //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
                 
                     $("#progressbar li").eq($("fieldset").index(next_fs))
                           .addClass("active");

                     //다음 필드셋 표시
                     next_fs.show();
                     //현재 필드셋을 스타일로 숨긴다.
                     current_fs.animate({
                        opacity : 0
                     }, {
                        step : function(now, mx) {
                           //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                           //1.current_fs 80%로 축소
                           scale = 1 - (1 - now) * 0.2;
                           //2.오른쪽에서 next_fs 50% 가져오기
                           left = (now * 50) + "%";
                           //3.next_fs의 불투명도 1로 증가시킨다
                           opacity = 1 - now;
                           current_fs.css({
                              'transform' : 'scale(' + scale + ')',
                              'position' : 'absolute'
                           });
                           next_fs.css({
                              'left' : left,
                              'opacity' : opacity
                           });
                        },
                        duration : 800,
                        complete : function() {
                           current_fs.hide();
                           animating = false;
                        },
                        //사용자가 정의 플러그인에서 나옴
                        easing : 'easeInOutBack'
                     });
                  }
               else
                 {
                  if (animating) {
                        return false;
                     }
                     animating = true;
                     current_fs = $(this).parent();
                     next_fs = $(this).parent().next().next().next().next();

                     //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
                     $("#progressbar li").hide();

                     //다음 필드셋 표시
                     next_fs.show();
                     //현재 필드셋을 스타일로 숨긴다.
                     current_fs.animate({
                        opacity : 0
                     }, {
                        step : function(now, mx) {
                           //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                           //1.current_fs 80%로 축소
                           scale = 1 - (1 - now) * 0.2;
                           //2.오른쪽에서 next_fs 50% 가져오기
                           left = (now * 50) + "%";
                           //3.next_fs의 불투명도 1로 증가시킨다
                           opacity = 1 - now;
                           current_fs.css({
                              'transform' : 'scale(' + scale + ')',
                              'position' : 'absolute'
                           });
                           next_fs.css({
                              'left' : left,
                              'opacity' : opacity
                           });
                        },
                        duration : 800,
                        complete : function() {
                           current_fs.hide();
                           animating = false;
                        },
                        //사용자가 정의 플러그인에서 나옴
                        easing : 'easeInOutBack'
                     });
                 }
               }
               
         });
   
      
   });

   function sample6_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
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
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
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

<!------------------------------------------- 우편번호 찾기 ------------------------------------------->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
</script>

  <!-- progressbar -->
  <%
     StringBuffer buff1 = new StringBuffer();
     StringBuffer buff2 = new StringBuffer();
     StringBuffer buff3 = new StringBuffer();
     BufferedReader reader1 = null;
     BufferedReader reader2 = null;
     BufferedReader reader3 = null;
     String str1, str2, str3;
     try {
        String filePath1 = application.getRealPath("/file/서비스이용약관.txt");
        String filePath2 = application.getRealPath("/file/개인정보 이용 약관.txt");/* <---input 파일을 연다. */
        String filePath3 = application.getRealPath("/file/위치기반서비스 이용 약관.txt");
        reader1 = new BufferedReader(new FileReader(filePath1));
        reader2 = new BufferedReader(new FileReader(filePath2));
        reader3 = new BufferedReader(new FileReader(filePath3));
        while (true) {
           str1 = reader1.readLine(); /* <-- 한행의 텍스트 데이터를 읽는다. */
           str2 = reader2.readLine();
           str3 = reader3.readLine();
           if (str1 == null)
              break;
           if (str2 == null)
              break;
           if (str3 == null)
              break;
           
           buff1.append(str1 + "\r\n");
           buff2.append(str2 + "\r\n");
           buff3.append(str3 + "\r\n");
           
            /* out.print(str + "</br>"); */ /*  <--- 읽은 데이터를 모니터로 출력 한다. */
        }   
     } 
     catch (FileNotFoundException fnfe) 
     {
        out.print("파일이 존재 하지 않습니다.");
     } 
     catch (IOException ioe) 
     {
        out.print("파일을 읽을수 없습니다.");
     }

     finally 
     {
        try 
        {
           reader1.close();
           reader2.close();
           reader3.close();/*  <---- 파일을 닫는다. */
        } 
        catch (Exception e) 
        {

        }
     }
  %>
<form id="msform">
	<div class="col-md-offset-2 col-md-8 col-xs-6" align="center">
		<ul id="progressbar">
			<li class="active">Agreement</li>
			<li>Account Setup</li>
			<li>Individual Setup</li>
			<li>History</li>
		</ul>
		<!-- fieldsets -->
		<fieldset>
			<h1 class="fs-title">약관 동의</h1>
			<h3 class="fs-subtitle">이용 약관에 동의 하셔야 이용이 가능합니다.</h3>
			<h4 class="scheme-g">서비스 이용 약관</h4>
			<textarea name="chart" style="font-size: 1em;" disabled="disabled"><%=buff1 %></textarea>
			<p>
				<input class="ab" type="checkbox" id="check_1" name="" /> 위의 약관에 동의 합니다.
			</p><br/>
			<h4 class="scheme-g">개인정보 이용 약관</h4>
			<textarea name="chart2" style="font-size: 1em;" disabled="disabled"><%=buff2 %></textarea>
			<p>
				<input class="ab" type="checkbox" id="check_2" name="" /> 위의 약관에 동의 합니다.<br />
			</p><br/>
			<h4 class="scheme-g">위치기반서비스 이용 약관</h4>
			<textarea name="chart2" style="font-size: 1em;" disabled="disabled"><%=buff3 %></textarea>
			<p>
				<input class="ab" type="checkbox" id="check_3" name="" /> 위의 약관에 동의 합니다.<br />
			</p>
			<p style="padding-top:5px; color: red">
			 	<input class="check-all" type="checkbox" id="check_3" name="all" /> 전체 동의 시 체크<br />
			</p>
	
<!-- 			<input type="checkbox" id="check_authHos" name="" /> 병원 제휴 시 체크<br /> -->
			<input type="button" id="authHos" class="action-button" value="병원 제휴" />
			<input type="button" name="nextBtn" class="nextBtn action-button" value="일반회원" />
		</fieldset>
		<fieldset>
			<h1 class="fs-title">계정 정보</h1>
			<h3 class="fs-subtitle">아이디로 사용할 e-mail과 비밀번호를 입력하세요.</h3>
			<div class="form-group">
				<div class="row">
					<div class="col-md-8">
						<input type="text" id="email" placeholder="이메일">
					</div>
					<div class="col-md-2">
						<input type="button" style="cursor: pointer" id="sendButton" class="btn btn-success" value="이메일인증"/>
					</div>
					<div class="col-md-8">
						<input type="text" name="auth"  placeholder="인증번호 입력" /> 
					</div>
					<div class="col-md-2">
						<input type="button" class="btn btn-primary" id="checkButton" value=" 확인   ">
					</div>
					<div class="col-md-12">
						<input type="password" name="pass" placeholder="비밀번호" /> 
						<input type="password" name="cpass" placeholder="비밀번호 확인" />
					</div>
				</div>
			</div>
			<input type="button" name="previous" class="previous action-button" value="이전" /> 
			<input type="button" name="next" class="next action-button" value="다음" />
		</fieldset>
		<fieldset>
			<h1 class="fs-title">개인 정보</h1>
			<h3 class="fs-subtitle">개인 정보를 입력해주세요.</h3>
			<div class="form-group">
			<div class="row">
				<div class="col-md-12">
					<input type="text" name="name" placeholder="이름" /> 
					<input type="text" name="phone" placeholder="핸드폰 번호" /> 
				</div>
				<div class="col-md-5">
					<select class="form-control" id="gender">
						<option value="X">성별</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</div>
				<div class="col-md-5 col-md-offset-1">
					<select class="form-control" id="age">
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
				<div class="col-md-6" style="padding-top: 10px">
					<input type="text" id="height" placeholder="키(cm)">
				</div>
				<div class="col-md-6" style="padding-top: 10px">
					<input type="text" id="weight" placeholder="몸무게(kg)">
				</div>
				
					<div class="form-group">
						<div class="col-md-8">
							<input type="text" id="sample4_postcode" placeholder="우편번호">
						</div>
						<div class="col-md-2">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
						</div>
					</div>

					<div class="col-md-12">
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" id="sample4_extraAddress" placeholder="참고항목">
						<input type="text" id="sample4_detailAddress" placeholder="상세주소">
					</div>
			</div>
			</div>
			<input type="button" name="previous" class="previous action-button" value="이전" /> 
			<input type="button" name="next" class="next action-button" value="다음" />

		</fieldset>
		<fieldset>
			<h1 class="fs-title">증상 및 질환</h1>
			<h3 class="fs-subtitle">증상을 선택하시고 만성적으로 가지고 있는 질환을 입력해주세요.</h3>
			<div class="row">
				<div class="col-md-4">
					<select class="form-control">
						<option value="">외과</option>
						<option value="">신경외과</option>
						<option value="">정형외과</option>
						<option value="">비뇨기과</option>
						<option value="">정신과</option>
						<option value="">이비인후과</option>
						<option value="">피부과</option>
						<option value="">호흡기내과</option>
						<option value="">소화기내과</option>
						<option value="">신경과</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3" style="padding:10px">
					<input type="checkbox" id="symptom" name="symptom" /> 증상1
				</div>
				<div class="col-md-3" style="padding:10px">
					<input type="checkbox" id="symptom" name="symptom" /> 증상2
				</div>
				<div class="col-md-3" style="padding:10px">
					<input type="checkbox" id="symptom" name="symptom" /> 증상3
				</div>
			</div>
			<h5 align="left">겪은 적이 있는 질환을 선택하세요</h5>
			<div class="row">
				<div class="col-md-3" style="padding:10px">
					<input type="checkbox" id="symptom" name="symptom" /> 질환1
				</div>
				<div class="col-md-3" style="padding:10px">
					<input type="checkbox" id="symptom" name="symptom" /> 질환2
				</div>
				<div class="col-md-3" style="padding:10px">
					<input type="checkbox" id="symptom" name="symptom" /> 질환3
				</div>
			</div>
			<textarea name="chart2" placeholder="주의해야할 만성적으로 가지고 있는 질환을 입력하세요"></textarea>
			<input type="button" name="previous" class="previous action-button" value="이전" /> 
			<input type="button" name="signupBtn" class="action-button" value="회원가입" />
		</fieldset>
		<fieldset>
			<h1 class="fs-title">병원 제휴</h1>
			<h3 class="fs-subtitle">병원을 선택해주세요</h3>
			<div class="row" style="padding-left:65px">
				<div class="col-md-6">
					<input type="text" placeholder="병원명을 입력하세요">
				</div>
				<div class="col-md-4">
					<input type="button" data-toggle="modal" data-target="#regi-modal" value="병원 찾기" class="btn btn-primary">
				</div>
			</div>
			   <div class="form-group">
                    <label style="font-size: 1.1em; padding-top:10px; padding-left:10px">병원 :</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" placeholder="병원" disabled="disabled">
                    </div>
                    <label style="font-size: 1.1em; padding-top:10px; padding-left:10px">부서 :</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" placeholder="부서" disabled="disabled">
                    </div>
                    <label style="font-size: 1.1em; padding-top:10px; padding-left:10px">주소 :</label>
                    <div class="col-md-10">
                    	 <input type="text" class="form-control" placeholder="주소" disabled="disabled">
                    </div>
                    <label style="font-size: 1.1em; padding-top:10px; padding-left:10px">번호 :</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" placeholder="번호" disabled="disabled">
                    </div>
                </div>
			<div class="row">
				<div class="col-md-12">
					<input type="checkbox" id="symptom" name="symptom" /> 위의 병원이 맞으시면 체크 후 가입 버튼을 눌러주세요
				</div>
			</div>
			<input type="button" id="auth_prev" class="action-button" value="이전" />
			<input type="button" name="signupBtn" class="action-button" value="회원가입" />
		</fieldset>
		<div class="modal fade" id="regi-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h2>제휴회원 병원 찾기</h2>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<input name="q" type="text" class="form-control" />
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-search" onclick="document.mysearchbar.submit()"></span>
							</div>
						</div>
					</div>
					<div class="col-md-11" style="font-size: 1.2em; padding-left:70px;">
						<table class="table">
							<tbody>
								<tr onclick="javascript:alert('test')">
									<td>삼성병원</td>
									<td>신경외과</td>
									<td>화곡동</td>
									<td>02-0000-0000</td>
								</tr>
								<tr>
									<td>현대병원</td>
									<td>신경외과</td>
									<td>도곡동</td>
									<td>02-0000-0000</td>
								</tr>
								<tr>
									<td>기아병원</td>
									<td>신경외과</td>
									<td>역삼동</td>
									<td>02-0000-0000</td>
								</tr>
								<tr>
									<td>기아병원</td>
									<td>신경외과</td>
									<td>역삼동</td>
									<td>02-0000-0000</td>
								</tr>
								<tr>
									<td>기아병원</td>
									<td>신경외과</td>
									<td>역삼동</td>
									<td>02-0000-0000</td>
								</tr>
							</tbody>
						</table>	
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>