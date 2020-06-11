<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 캘린더 필요 -->
<link href='<c:url value="/calendar/core/main.css"/>' rel='stylesheet' />
<link href='<c:url value="/calendar/daygrid/main.css"/>' rel='stylesheet' />
<link href='<c:url value="/calendar/timegrid/main.css"/>' rel='stylesheet' />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src='<c:url value="/calendar/core/main.js"/>'></script>
<script src='<c:url value="/calendar/interaction/main.js"/>'></script>
<script src='<c:url value="/calendar/daygrid/main.js"/>'></script>
<script src='<c:url value="/calendar/timegrid/main.js"/>'></script>



<script>
	$('.fc-bg').remove();
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
 
        plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        defaultDate: new Date,
        
        locale:'ko',
        navLinks: true,
        columnHeaderText: function(date) {
           let weekList = ["일", "월", "화", "수", "목", "금", "토"];
           return weekList[date.getDay()];
        },
        selectable: true,
        selectMirror: true,
        select: function(arg) {
  
        		  var divTop = arg.jsEvent.clientY - 40; 
        	  var divLeft = arg.jsEvent.clientX; 
        	  var serial = $(this).attr("serial"); 
        	  var idx = $(this).attr("idx"); 
        	  $('#divView').empty().append('<div style="position:absolute;top:5px;right:5px;"id="calendarmenu"> </div><br><input class="btn" type="button" id="menuno1" value="복용약 등록"/><BR><input class="btn" type="button" id="menuno2" value="예약하기"/>'); $('#divView').css({ "top": divTop ,"left": divLeft , "position": "absolute" }).show(); 
        	  
         
        	 $('#menuno1').click(function() {
        		 $('#calendarmenu').remove();
   				$('#divView').css('display','none')
   				var dates=new Date(arg.end);
   				var startDate =  moment(arg.start).format('YYYY-MM-DD')+"~"+moment(arg.end).format('YYYY-MM-'+(dates.getDate()-1));
        	  $("#date").val(startDate);
            $("#createEventModal").modal("show");
               $('#submitButton').click(function() {
               var title= $('#title1').val();
			
                if (title) {
            calendar.addEvent({
              title: title,
              start: startDate,
              end: endDate,
              allDay: arg.allDay
            })
          }
                arg.end="";
                arg.start="";
                $("#createEventModal").modal("hide");
                })
                  $('#close').click(function() {
                         arg.start="";
                             end: arg.end="";
                         $("#createEventModal").modal("hide");
                  })
          calendar.unselect(); 
        		});  
        	 
        	 $(document).on("click","#menuno2",function(){
        	     	$('#calendarmenu').remove();
        				$('#divView').css('display','none')
        	     }); 
        },
        eventClick:function(event) {
      
           if(event.event.backgroundColor=='#E5D85C'){
      
        	   $("#createEventModal2").modal("show");
           }
           else{ 

        	   $("#createEventModal3").modal("show");
           }
        },

        editable: true,
        eventLimit: true,
        events:  function(info, successCallback,failureCallback) {
           $.ajax({
              url: '<c:url value="/Calendar/View.hst"/>',
              type: 'POST',
              dataType:'json',
              data:{
                 start:moment(info.startStr).format('YYYY-MM-DD'),
                 end:moment(info.endStr).format('YYYY-MM-DD'),
              },
              success: function (data) {
            		
                 var events=[];
                 $.each(data,function(index,valeus){
                	
                 events.push({
                    title: data[index].title,
                    start: data[index].start,
                    end:data[index].end,
     				color:data[index].color,
                    });
     
               
                 })
                 successCallback(events);
              },
                 errorr:function(status, request, error){
                 alert("에러");
                 }//eroorr
                 });//ajax
         
        } 
   
    });
   
    calendar.render();
  });
	/*close*/
	 $(document).on("click","#close",function(){
            	$('#calendarmenu').remove();
  				$('#divView').css('display','none')
            });
	$(function() {
	
	
	 $('html').click(function(e) {
		 var $target = $(e.target);
	
		if(!$(e.target).hasClass("fc-row fc-week fc-widget-content fc-rigid")) {
			if(!$('#divView').css('display','none')){
			$('#calendarmenu').remove();
				$('#divView').css('display','none')
			}
		} 
	 });
	})

</script>
<style>
	
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
#divView { position:absolute; display:none;z-index: 9999; }
#menuno1,#menuno2{background: #FF8383;color: white;width: 100%}
  #calendar {
  padding-top: 95px;
    max-width: 900px;
    margin: 0 auto;
  }
.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 9999; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            text-align: center;
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
         .modal-contentView {
         	position:fixed;
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 130%; /* Could be more or less, depending on screen size */                          
        }
        .modal-dialog {z-index: 1050;}
        .view{left:-100px;top:-100px}
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

</style>


  <div id='calendar' style="margin-bottom: 50px;">
  </div>
  <!-- 복용중인 약 등록 -->
<div id="createEventModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
                <h4>복용중인 약 등록</h4>
            </div>
            <div id="modalBody" class="modal-body">
               <div class="form-group">
                    <input class="form-control" type="text" id="title1"  placeholder="약 이름" >
                </div>

                <div class="form-group form-inline">
                    <div class="input-group date" data-provide="datepicker">
                        <input type="text" class="form-control" placeholder="" id="date" readonly >
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar" id="datepicker"></span>
                        </div>
                    </div>
                </div>
<div class="form-group form-inline">
                    
                </div>
                
                <div class="form-group">
                    <textarea class="form-control" type="text" rows="4" placeholder="내용"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true" id="close">Cancel</button>
                <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
            </div>
        </div>
    </div>
</div>
<!-- 예약상세 페이지 -->
<div id="createEventModal2" class="modal fade">
    <div class="modal-dialog" style="left: 80px;">
        <div class="modal-contentView" style="width: 80%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
                <h4>예약 상세페이지</h4>
            </div>
            <div id="modalBody" class="modal-body">
               <div class="form-group">
                   <table class="table table-bordered" style="text-align: center;">
  <thead>
    <tr>
      <td scope="col">병원명</td>
      <td scope="col">분당병원</td>
    </tr>
  </thead>
  <tbody>
  <tr>
  <td scope="row">이름<br/></td>
      <td>김길동</td>
  </tr>
    <tr>
      <td scope="row">예약일시</td>
      <td>2020-06-08 13:00</td>
    </tr>
    <tr >
      <td scope="row" >예약신청일<br/></td>
      <td>2020-06-01 &lt;인터넷 예약&gt;</td>
    </tr>
   
     <tr>
      <td>진찰료</td><td>미수납</td>
 </tr>
 <tr><td>예약상태</td> <td>미승인</td></tr>
 <tr><td>진료과</td><td>정형외과</td></tr>
 <tr><td>의사명</td><td>홍길동</td></tr>
  </tbody>
</table>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true" id="close">Cancel</button>
                <button type="submit" class="btn btn-primary" id="submitButton">예약변경</button>
            </div>
        </div>
    </div>
</div>
<!-- 복욕중인 약 상세페이지 -->
<div id="createEventModal3" class="modal fade">
    <div class="modal-dialog view">
        <div class="modal-contentView">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
                <h4 style="text-align: center;">복용중인 약 상세보기</h4>
            </div>
            <div id="modalBody" class="modal-body">
               <div class="form-group">
              		<table class="table table-bordered" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">제품명</th>
      <td scope="col">가그린목액</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">복용기간</th>
      <td>2020-06-10~2020-06-12</td>
      <th scope="row">효능 · 효과</th>
      <td>통증 및 염증 완화 및 살균:치은염, 구내염, 발치 전·후</td>
    </tr>
    <tr >
      <th scope="row" style="line-height: 37px">용법·용량<br/></th>
      <td colspan="3">1회 15mL 1일 2~3회 가글하여 사용한다.<br/>최대 5~7일간 사용하며, 그 이상 사용 시 의사와 상의한다.</td>
    </tr>
    <tr>
      <th class="text-center" scope="row" colspan="5">주의사항</th>
    </tr>
     <tr>
      <td colspan="5">
     
1. 다음과 같은 사람은 이 약을 사용하지 말 것
이 약의 구성성분에 과민반응이 있는 환자
<br/><br/>
2. 이 약을 사용하는 동안 다음의 약을 사용하지 말 것
이 약의 상호작용에 관련된 연구는 없으나, 다른 살균제와 동시에 사용하지 않는다.
<br/><br/>
3. 다음과 같은 경우 이 약의 사용을 즉각 중지하고 의사, 약사와 상의할 것. 상담 시 가능한 한 이 첨부문서를 소지할 것
이 약을 특히 장기간 사용할 경우 과민반응을 유발할 수 있으며, 과민반응 발생 시 사용을 중지하고 의사와 상의한다.
<br/><br/>
4. 기타 이 약의 사용시 주의할 사항
1) 에탄올(알코올)을 함유하고 있어 운동선수의 경우 도핑 약물 검사에서 알코올 양성 반응을 나타낼 수 있다.
2) 국소 마취 작용과 관련된 입 안의 가벼운 감각 감퇴 증상이 발생할 수 있다.
3) 가벼운 일시적 작열감과 같은 나타나는 불내성 증상이 발생할 수 있지만, 이 증상으로 인해 사용을 중단할 필요는 없다.
) 벤지다민 또는 세틸피리디늄을 국소 적용하는 경우 과량투여 증상이 확인되지 않았다. 벤지다민을 전신으로 과량 투여시 흥분, 경련, 발한, 운동실조, 떨림 및 구토 등의 독성 증상으로 나타난다.
세틸피리디늄과 같은 4차 암모늄 화합물을 상당한 양으로 복용하는 경우 메스꺼움, 구토, 호흡 곤란, 청색증, 중추신경계 억제, 저혈압 및 혼수 상태 등의 증상이 나타날 수 있다.
특정 해독제가 없으므로 벤지다민으로 인한 급성 중독 또는 세틸피리디늄 과량 투여시 대증적으로 치료한다.
<br/><br/>
5. 저장상의 주의사항
1) 어린이의 손이 닿지 않는 곳에 보관한다.
2) 의약품을 원래 용기에서 꺼내어 다른 용기에 보관하는 것은 의약품 오용에 따른 사고 발생이나 의약품 품질 저하의 원인이 될 수 있으므로 원래의 용기에 넣고 꼭 닫아 보관한다.</td>

    </tr>
  </tbody>
</table>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true" id="close">Cancel</button>
                <button type="submit" class="btn btn-primary" id="submitButton">수정</button>
            </div>
        </div>
        </div>
    </div>
</div>
<div id="divView" class="areg"></div>

   <script src='<c:url value="/js/bootstrap.min.js"/>'></script>


