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
   <script>
   	$(function() {
		$('#item-1').on("click",function(){
			$('#items-1').css("display","");
			$('#items-2').css("display","none ")
		})
		$('#item-2').on("click",function(){
			$('#items-2').css("display","");
			$('#items-1').css("display","none")
		})
	
   		
	})
   
   </script>
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
  .items{
  margin-bottom: 0px;
  }
.click{
border: 2px solid black ;
}
  </style>
</head>


    <div class="container">

   

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
      <td scope="row">예약신청일<br/></td>
      <td id="apply_time"></td>
    </tr>
   
 <tr><td>예약상태</td> <td id='approved'></td></tr>
 <tr><td>진료과</td><td id='dept_NAME'></td></tr>
 <tr><td>증상</td><td id='sel_SYMP'></td></tr>
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
      <th scope="col" style="text-align: center;padding-bottom: 0px;margin-bottom: 0px">제품명</th>
      <td scope="col" colspan="5"  id="item_name" style="padding: 0px;margin-bottom: 0px;text-align: left;"></td>
    </tr>
  </thead>
  <tbody>
    <tr id="edit-update_01">
      <th scope="row" style="line-height: 54px;padding: 0px;text-align: center;">복용기간</th>
      <td  style="line-height: 54px;padding: 0px" id="item-date"></td> 
      <th scope="row" style="line-height: 54px;padding: 0px;text-align: center;">효능 · 효과</th>
      <td  style="line-height: 54px;padding: 0px" id="er">ㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁ</td>
    </tr>
    <!--  -->
    <tr >
      <th scope="row" style="line-height: 36px;text-align: center;">용법·용량<br/></th>
      <td colspan="3" style="text-align: center;">1회 15mL 1일 2~3회 가글하여 사용한다.<br/>최대 5~7일간 사용하며, 그 이상 사용 시 의사와 상의한다.</td>
    </tr>
    <tr>
      <th class="text-center" scope="row" colspan="5"><input type="button" class="btn" id="item-2" value="상세설명"/><input type="button" class="btn" id="item-1" value="주의사항"/></th>
    </tr>
     <tr>
      <td colspan="5" id="items-1" style="display: none;">
1) 매일 세 잔 이상 정기적으로 술을 마시는 사람이 이 약이나 다른 해열 진통제를 복용해야 할 경우 반드시 의사 또는 약사와 상의해야 한다. 이러한 사람이 이 약을 복용하면 간손상이 유발될 수 있다. 2) 아세트아미노펜을 복용한 환자에서 매우 드물게 급성 전신성 발진성 농포증(급성 전신성 발진성 고름물집증)(AGEP), 스티븐스 - 존슨 증후군(SJS), 독성 표피 괴사용해(TEN)와 같은 중대한 피부 반응이 보고되었고, 이러한 중대한 피부반응은 치명적일 수 있다. 따라서 이러한 중대한 피부반응의 징후에 대하여 환자들에게 충분히 알리고, 이 약 투여 후 피부발진이나 다른 과민반응의 징후가 나타나면 즉시 복용을 중단하도록 하여야 한다. 3) 이 약은 아세트아미노펜을 함유하고 있다. 아세트아미노펜으로 일일 최대 용량(4,000mg)을 초과할 경우 간손상을 일으킬 수 있으므로 이 약을 일일 최대 용량(4,000mg)을 초과하여 복용하여서는 아니되며, 아세트아미노펜을 포함하는 다른 제품과 함께 복용하여서는 안 된다. 1) 이 약에 과민증 환자 2) 소화성궤양 환자 3) 심한 혈액 이상 환자 4) 심한 간장애 환자 5) 심한 신장(콩팥)장애 환자 6) 심한 심장기능저하 환자 7) 아스피린 천식(비스테로이드성 소염(항염)제에 의한 천식발작 유발) 또는 그 병력이 있는 환자 8) 다음의 약물을 복용한 환자 : 바르비탈계 약물, 삼환계 항우울제 9) 알코올을 복용한 사람 10) 이 약은 유당을 함유하고 있으므로, 갈락토오스 불내성(galactose intolerance), Lapp 유당분해효소 결핍증(Lapp lactase deficiency) 또는 포도당-갈락토오스 흡수장애(glucose-galactose malabsorption) 등의 유전적인 문제가 있는 환자에게는 투여하면 안 된다. 1) 간장애 또는 그 병력이 있는 환자 2) 신장(콩팥)장애 또는 그 병력이 있는 환자 3) 소화성궤양의 병력이 있는 환자 4) 혈액이상 또는 그 병력이 있는 환자 5) 출혈경향이 있는 환자(혈소판기능이상이 나타날 수 있다.) 6) 심장기능이상이 있는 환자 7) 과민증의 병력이 있는 환자 8) 기관지 천식 환자 9) 고령자(노인) 10) 만 2세 미만의 소아 11) 임부 또는 수유부 12) 와파린을 장기복용하는 환자 13) 다음의 약물을 복용한 환자: 리튬, 치아짓계이뇨제 1) 쇽: 쇽, 아나필락시양 증상(과민성유사증상 : 호흡곤란, 온몸이 붉어짐, 혈관부기, 두드러기 등), 천식발작 2) 혈액: 혈소판 감소, 과립구감소, 용혈성(적혈구파괴성)빈혈, 메트헤모글로빈혈증, 혈소판기능 저하(출혈시간 연장), 청색증 3) 과민증: 과민증상(얼굴부기, 호흡곤란, 땀이 남, 저혈압, 쇽) 4) 소화기: 구역, 구토, 식욕부진, 장기복용 시 위장출혈, 소화성궤양, 천공(뚫림) 등의 위장관계 이상반응 5) 피부: 발진, 알레르기 반응, 피부점막안 증후군(스티븐스-존슨 증후군), 중독성표피괴사용해(리엘 증후군) 6) 기타: 장기투여시 만성간괴사, 급성췌장(이자)염, 만성간염, 신장(콩팥)독성 7) 과량투여: 간장, 신장(콩팥), 심근의 괴사 8) 이 약에 대해 시판 후 조사에서 보고된 추가적 이상반응은 아래 표와 같다. 발현빈도는 매우 흔히 ≥1/10, 흔히 ≥1/100 및 <1/10, 흔하지 않게 ≥1/1,000 및 <1/100, 드물게 ≥1/10,000 및 <1/1,000, 매우 드물게 <1/10,000 이다. 표. 자발적 보고율로부터 추정한 빈도에 따른 이 약의 시판후 경험에서 밝혀진 이상반응</td>
<td id="items-2" colspan="5" style="text-align: left;padding: 20px">
<span id="material_NAME"></span>
<br>보관방법: <span id="storage_METHOD"></span>
<br>유통기한: <span id="valid_TERM"></span>
<br>제조사:<span id="entp_NAME"></span></td>
 </tr>

  </tbody>	
</table>
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent_no2">삭제</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- 복용약 추가 -->
	<!-- 
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
                </div>
            </div>
        </div>
        -->
        <!--복용약추가 끝 -->
        <!-- 일정 추가 MODAL -->
        <!-- 
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
                    
                </div>
            </div>
 -->
        </div>

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




