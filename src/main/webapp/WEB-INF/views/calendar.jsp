<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel="shortcut icon" href="<c:url value='/calendar/image/favicon.ico'/>">

    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/fullcalendar.min.css'/>" />

    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/select2.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/bootstrap-datetimepicker.min.css'/>"/>

    <link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/css?family=Open+Sans:400,500,600'/>"/>
    <link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/icon?family=Material+Icons'/>"/>
<link rel="stylesheet" href="<c:url value='/calendar/css/main.css'/>"/>
   
<style>  
#calendar {
  padding-top: 95px;
    max-width: 900px;
    margin: 0 auto;
  }
  .Viewsds{
  top:100px
  ;left:115px;
  }
  .Views{
  width:60%
  }
  .View{
  width: 135%
  }
  .Viewdialog{
  top:150px;
  left:20px;
  }
  Viewdialogs{
  left:-50px;
  }
  </style>
</head>


    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">병원예약</a></li>
                <li><a tabindex="-1" href="#">복용약등록</a></li>  
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>
        <!--병원예약정보-->
      
        <div class="modal fade" tabindex="-1" role="dialog" id="eventhosModal">
            <div class="modal-dialog Viewdialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
         <table class="table table-bordered" style="text-align: center;">
  <thead>
    <tr>
      <td scope="col">병원명</td>
      <td scope="col" id='titlecall'></td>
    </tr>
  </thead>
  <tbody>
  <tr>
  <td scope="row">환자<br/></td>
      <td id='namecall'></td>
  </tr>
    <tr>
      <td scope="row">예약일시</td>
      <td id='timecall'></td>
      <td id='timecall2' style='display: none;padding: 0px'><input class="inputModal" type="text" name="update-start" id="edit-start"  style="margin: 0px;margin-top: 6px;width: 162px;"/></td>
    </tr>
    <tr >
      <td scope="row" >예약신청일<br/></td>
      <td id="apply_time"></td>
    </tr>
   
 <tr><td>예약상태</td> <td>미승인</td></tr>
 <tr><td>진료과</td><td>정형외과</td></tr>
 <tr><td>의사명</td><td>홍길동</td></tr>
  </tbody>
</table>
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          <button type="button" class="btn btn-danger" id="deleteEvent_no1">예약취소</button>
                          <button type="button" class="btn btn-danger" id="updateEvents_no1" style="display: none;">예약변경확인</button>
                        <button type="button" class="btn btn-danger" id="updateEvent_no1">예약변경</button>
						
					
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
  <!-- 복용약 상세보기MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventdrugModal">
            <div class="modal-dialog Viewdialogs" role="document">
                <div class="modal-content View">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
         	<table class="table table-bordered" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">제품명</th>
      <td scope="col">가그린목액</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row" style="line-height: 54px">복용기간</th>
      <td  style="line-height: 44px">2020-06-10~2020-06-12</td>
      <th scope="row" style="line-height: 54px">효능 · 효과</th>
      <td  style="line-height: 44px">통증 및 염증 완화 및 살균:치은염, 구내염, 발치 전·후</td>
    </tr>
    <tr >
      <th scope="row" style="line-height: 54px">용법·용량<br/></th>
      <td colspan="3" >1회 15mL 1일 2~3회 가글하여 사용한다.<br/>최대 5~7일간 사용하며, 그 이상 사용 시 의사와 상의한다.</td>
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
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent_no2">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent_no2">수정</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- 복용약 추가 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventdrugModaladd">
            <div class="modal-dialog Viewsds" role="document">
                <div class="modal-content Views">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4>복용약 추가</h4>
                    </div>
                    <div class="modal-body">
 						<div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">약이름</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-one"
                                    required="required" />
                            </div>
                        </div>

                   <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
						 <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="복용약등록">복용약등록</option>
                                </select>
                            </div>
                        </div>
                
                <div class="form-group">
                    <textarea class="form-control" type="text" id="medicinecontent" placeholder="내용"></textarea>
                </div>
                             
        
            
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event1">등록</button>
                    </div>
                   
                      </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!--복용약추가 끝 -->
        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog Viewsds" role="document">
                <div class="modal-content Views">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">병원이름</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-to"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">예약날짜</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="병원예약">병원예약</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">진료과</label>
                                <input class="inputModal" type="text" name="" id=""
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">의사명</label>
                                <input class="inputModal" type="text" name="" id=""
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">환자명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-name"
                                    required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event2">예약하기</button>
                    </div>
                    
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

<script src='<c:url value="/calendar/vendor/js/moment.min.js"/>'></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src='<c:url value="/calendar/vendor/js/fullcalendar.min.js"/>'></script>

<script src='<c:url value="/calendar/vendor/js/ko.js"/>'></script>
<script src='<c:url value="/calendar/vendor/js/select2.min.js"/>'></script>
<script src='<c:url value="/calendar/vendor/js/bootstrap-datetimepicker.min.js"/>'></script>
<script src='<c:url value="/calendar/js/main.js"/>'></script>
<script src='<c:url value="/calendar/js/addEvent.js"/>'></script>
<script src='<c:url value="/calendar/js/editEvent.js"/>'></script>
<script src='<c:url value="/calendar/js/etcSetting.js"/>'></script>




