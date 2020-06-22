<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
   .map_wrap {position: relative;height: 100%;}
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px;height: 75px;}
    .desc .addr {overflow: hidden;text-overflow: addr;white-space: normal;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .modal { position: absolute; top: 20%;}
   .body_title {font-size: 24px;font-weight: bold;}
   .load_wrap {
      position: absolute; 
      width: 100%;
       height: 100%;
       line-height: 30;
       text-align: center;
       background-color: rgba( 255, 255, 255, 0.5 );
      z-index: 1231234;
   }
   .search 
   {
      position: absolute;
       top: 100px;
       left: 16px;
       display: flex;
       justify-content: space-between;
       z-index: 2;
       align-items: center;
       border-radius: 24px;
       background: white;
       padding: 13px 24px 13px 24px;
       width: auto;
       right: 16px;
       max-width: 343px;
       height: 46px;
       box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);
       background-color: #ffffff;
   }
   .searchInput
   {
      width: 90%;
       border: 0 !important;
       background: white;
   }
   .map_button{position: absolute;bottom: 32px;right: 8px;z-index: 2;flex-direction: column;}
   .current_refresh
   {
      width: 44px;
      height: 44px;
      margin-top: 8px;
      box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 3px 0px;
      background-color: white;
      border-radius: 22px;
      border-width: initial;
      border-style: none;
       border-color: initial;
       border-image: initial;
       outline: 0;
   }
   .menu_wrap{left: 13px;bottom: 19px;text-align: center;position: absolute;z-index: 2;}
   .info_wrap{position: absolute;top: 80px;left: 0;bottom: 0;width: 390px;z-index: 200;background: #fff;flex-direction: column;}
   .info-toggle{position: absolute;top: 50%;left: 0;left: 390px;z-index: 20;}
   .info_btn_toggle{
      position: absolute;
      top: 0;
      left: 0;
      margin: auto;
      width: 22px;
      height: 54px;
      background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/shadow/img_navi.png) no-repeat 0 0;
      cursor: pointer;
   }
   .top_area{
      position: relative;
       
       padding: 20px 20px 10px;
       
   }
   .top_search_area{
      
       top: 0;
       left: 0;
       right: 0;
       width: 350px;
       height: 46px;
       border-radius: 3px;
      background-color: #f2f2f2;
   }
   .top_absfilter_area{
      text-align: center;
      padding: 0 0 20px 0;
   }
   .top_filter_area{
      padding: 5px 20px;
   }
   .filter_button{
      width: 44px;
      height: 44px;
      box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 3px 0px;
      background-color: white;
      border-radius: 22px;
      border-width: initial;
      border-style: none;
       border-color: initial;
       border-image: initial;
       margin: 0 10px;
       outline: 0;
   }
   .selected_filter{
      box-shadow: rgba(0, 255, 0, 1) 0px 3px 3px 0px;
   }
   .search_keyword_input{
      float: left;
       width: 300px;
       padding: 12px 16px 15px;
       border: 0 none;
       font-weight: bold;
       font-size: 16px;
       line-height: 19px;
       background-color: transparent;
       outline: 0;
   }
   .search_keyword_submit{
      float: left;
      width: 36px;
      height: 36px;
       margin: 5px 0;
       border: 0 none;  
       line-height: 0;
       cursor: pointer;
       background: url("<c:url value='/images/map/search.png'/>");
       background-size: cover;
   }
   .warp_invisible{transform:translateX(-391px);}
   .left_toggle{left:0; }

   
   .scroll_area{overflow:auto;height:85%;flex-direction: column;background: #fff;}
   .search_item{border-top:1px solid #e5e5e5;margin: 0 20px;padding: 19px 20px 18px;;display: block;cursor: pointer;}

   
   .content_title{
      display: inline-block;
       font-size: 17px;
   }
   .content_body{
      margin-top: 3px;
      margin-bottom: 3px;
   }

   
   .inner_title_area{
      padding-left: 20px;
   }
   .inner_title{
      font-weight: 700;
      font-size: 22px;
   }
   .inner_summary_info{
      margin-top: 2px;
      font-size: 13px;
   }
   .inner_btn_area{
      padding: 17px 20px 12px;
      border-bottom:1px solid #e5e5e5;
      margin-left: 20px;
      margin-right: 20px;
   }
   .btn_direction{
      text-align: center;
   }
   .inner_final_area{
      padding: 20px;
   }
   .inner_final_icon{
       overflow: hidden;
       display: inline-block;
       width: 30px;
       height: 30px;
       font-size: 0;
       color: transparent;
       vertical-align: top;
       float: left;
       margin-right: 15px;
   }
   .inner_detail_tel{
      margin-top: 16px;
   }
   .inner_detail_time{
      margin-top: 16px;
   }
   .inner_detail_time2{
      margin-top: 16px;
   }
   .inner_end_box{
      padding-top: 2px;
       line-height: 18px;
       overflow: hidden;
       position: relative;
       font-size: 14px;
       line-height: 21px;
   }
    .ui-autocomplete {
       position: absolute;
       max-height: 200px;
        overflow-y: auto;
        /* prevent horizontal scrollbar */
        overflow-x: hidden;
        /* add padding to account for vertical scrollbar */
        padding-right: 20px;
        width: 350px; !important;
    }
</style>
<div class="map_wrap">
   <div id="search_wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px;position:absolute;z-index: 3">
      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
   </div>
   <div class="load_wrap">
      <img class="load_img" style="vertical-align: bottom;" src="<c:url value='/images/map/mask_loader.gif'/>">
   </div>
   <div class="search">
      <input class="searchInput" id="searchAddress" placeholder="지도상 현재 위치의 주소가 표시됩니다" disabled>
      <img style="width: 43px;cursor: pointer;"src="<c:url value='/images/map/search.png'/>" onclick="addressSearch()" ></img>
   </div>
   <div class="map_button">
      <button class="current_refresh" type="button" onclick="currentPosition()">
         <img src="<c:url value='/images/map/current_position.png'/>" style="width: 34px;height: 34px;">
      </button>
      <button class="current_refresh" type="button" onclick="refreshMap()">
         <img src="<c:url value='/images/map/refresh.png'/>" style="width: 34px;height: 34px;">
      </button>
   </div>
   <!-- 
   <div class="current">
      <button type="button" onclick="currentPosition()">현재위치</button>
   </div>
   <div class="refresh_map">
      <button type="button" onclick="refreshMap()">갱신</button>
   </div>
    -->
   <div class="info_wrap warp_invisible">
      <div class="top_area">
         <div class="top_absfilter_area">
            <button class="filter_button" id="filter_hospital" type="button">
               <img src="<c:url value='/images/map/hospital_image/hospital_button.png'/>" style="width: 34px;height: 34px;">
            </button>
            <button class="filter_button" id="filter_pharmacy" type="button">
               <img src="<c:url value='/images/map/pharmacy_image/pharmacy_button.png'/>" style="width: 34px;height: 34px;">
            </button>
            <button class="filter_button" id="filter_mask" type="button">
               <img src="<c:url value='/images/map/maskmap_image/mask_button.png'/>" style="width: 34px;height: 34px;">
            </button>
         </div>
         <div class='top_search_area'>
            <input class="search_keyword_input" maxlength="100" autocomplete="off" placeholder="검색어를 입력하세요">

            <button type="button" class="search_keyword_submit"></button>
         </div>
         <div class="top_filter_area">
         </div>
      </div>
      <div class="scroll_area">
         <div class="search_list">
         
            <!-- <div class="search_item" onclick="searchItemClick('서울 금천구 가산디지털1로 186 제이플라츠 2층 애슐리');">
               <div class="search_item_detail">
                  <div class="detail_content">
                     <div class="content_title">
                        <strong>병원</strong>
                     </div>

                     <div class="content_body">
                        내과
                        010-1234-5678
                     </div>
                     <div class="content_body">
                        서울 금천구 가산디지털1로 186 제이플라츠 2층 애슐리

                     </div>
                     
                  </div>
               </div>
            </div> 
            <div class="inner_top">
               <div class="inner_title_area">
                  <div class="inner_title">
                     <strong>고래병원</strong>
                  </div>
                  <div class="inner_summary_info">
                     <span>병원</span>
                     <span>내과</span>
                  </div>
               </div>
               <div class="inner_btn_area">
                  <div class="btn_direction">
                     <button class="find_way_btn">길찾기</button>
                     <button class="reservation_btn" onclick="reservation_show();">예약</button>
                  </div>
               </div>
               <div class="inner_final_area">
                  <div class="inner_detail_address">
                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/address.png'/>">
                     <div class="inner_end_box">서울 동작구 만양로14다길 3</div>
                  </div>
                  <div class="inner_detail_tel">
                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/tel.png'/>">
                     <div class="inner_end_box">010-1234-5678</div>
                  </div>
                  <div class="inner_detail_time">
                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/time.png'/>">
                     <div class="inner_end_box">11:00~16:00</div>
                  </div>
                  <div class="inner_detail_time2">
                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/detail_info.png'/>">
                     <div class="inner_end_box">
                        영업시간 11:00~ 14:40 16:00~ 20:30<br/>
                        휴무: 매주 월요일
                     </div>
                  </div>
               </div>
            </div>-->
         </div>
      </div>
   </div>
   <div class="info-toggle left_toggle">
      <span class="info_btn_toggle"></span>
   </div>
   <div class="menu_wrap">
      <button class="current_refresh"  type="button" onclick="changeApi(0)">
         <img src="<c:url value='/images/map/hospital_image/hospital_button.png'/>" style="width: 34px;height: 34px;">
      </button>
      <button class="current_refresh"  type="button" onclick="changeApi(1)">
         <img src="<c:url value='/images/map/pharmacy_image/pharmacy_button.png'/>" style="width: 34px;height: 34px;">
      </button>
      <button class="current_refresh"  type="button" onclick="changeApi(2)">
         <img src="<c:url value='/images/map/maskmap_image/mask_button.png'/>" style="width: 34px;height: 34px;">
      </button>
      <button class="current_refresh"  type="button" onclick="changeApi(3)">
         <img src="<c:url value='/images/map/corona_image/corona_button.png'/>" style="width: 34px;height: 34px;">
      </button>
   </div>
   <div id="map" style="width: 100%; height: 100%;position: relative;overflow: hidden;"></div>
</div>
<div class="modal fade" id="reservation-modal">
   <div class="modal-dialog">
      <div class="modal-content">
         <form>
            <div class="modal-header">
               <button class="close" data-dismiss="modal">
                  <span>&times;</span>
               </button>
               <h4 class="modal-title">병원 예약</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-sm-6">
                     <div class="form-group">
                        <span class="form-label">이름</span>
                        <input class="form-control" type="text" value="${MemberDTO.mem_name}" disabled>
                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="form-group">
                        <span class="form-label">이메일</span>
                        <input class="form-control" type="email" value="${MemberDTO.mem_email}" disabled>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-sm-6">
                     <div class="form-group">
	                   <span class="form-label">전화번호</span>
	                   <input class="form-control" type="tel" value="${MemberDTO.tel}" disabled>
	                 </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="form-group">
	                   <span class="form-label">병원 이름</span>
	                   <input class="form-control" id="modal_hosp_name" type="text" disabled>
	                 </div>
                  </div>
               </div>
               <div class="form-group">
                  <span class="form-label">진료실</span>
                  <div class="btn-group">
                     <label class="radio-inline form-label"><input type="radio" name="optradio" checked>내과</label>
                     <label class="radio-inline form-label"><input type="radio" name="optradio">정형외과</label>
                     <label class="radio-inline form-label"><input type="radio" name="optradio">산부인과</label>
                  </div>
               </div>
               <div class="form-group">
                  <span class="form-label">진료 항목</span>
                  <div class="btn-group">
                     <label class="radio-inline form-label"><input type="radio" name="optradio" checked>결과상담</label>
                     <label class="radio-inline form-label"><input type="radio" name="optradio">공단검진</label>
                     <label class="radio-inline form-label"><input type="radio" name="optradio">예방접종</label>
                     <label class="radio-inline form-label"><input type="radio" name="optradio">일반진료</label>
                     <label class="radio-inline form-label"><input type="radio" name="optradio">기타</label>
                  </div>
               </div>
               <div class="row">
                  <div class="col-sm-5">
                     <div class="form-group">
                        <span class="form-label">예약 날짜</span>
                        <input class="form-control" id="reservation_date" type="text" placeholder="날짜를 선택해주세요" autocomplete="off" required>
                     </div>
                  </div>
                  <div class="col-sm-7">
                     <div class="row">
                        <div class="col-sm-4">
                           <div class="form-group">
                              <span class="form-label">오전/오후</span>
                              <select id="AM_PM" class="form-control">
                                 <option>오전</option>
                                 <option>오후</option>
                              </select>
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                        <div class="col-sm-4">
                           <div class="form-group">
                              <span class="form-label">시</span>
                              <select class="form-control">
                                 <option>1</option>
                                 <option>2</option>
                                 <option>3</option>
                                 <option>4</option>
                                 <option>5</option>
                                 <option>6</option>
                                 <option>7</option>
                                 <option>8</option>
                                 <option>9</option>
                                 <option>10</option>
                                 <option>11</option>
                                 <option>12</option>
                              </select>
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                        <div class="col-sm-4">
                           <div class="form-group">
                              <span class="form-label">분</span>
                              <select class="form-control">
                                 <option>05</option>
                                 <option>10</option>
                                 <option>15</option>
                                 <option>20</option>
                                 <option>25</option>
                                 <option>30</option>
                                 <option>35</option>
                                 <option>40</option>
                                 <option>45</option>
                                 <option>50</option>
                                 <option>55</option>
                              </select>
                              <span class="select-arrow"></span>
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-success">예약</button>
               <button class="btn btn-info" data-dismiss="modal">닫기</button>
            </div>
         </form>
      </div>
   </div>
</div>
<div class="modal fade" id="maskInfo-modal">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button class="close" data-dismiss="modal">
               <span>&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="body_title"></div>
            <div class="body_content">
               <div class="content_type"></div>
               <div class="content_addr"></div>
               <div class="content_stock"></div>
               <div class="content_stock_count"></div>
               <div class="content_stock_at"></div>
               <div class="content_created_at"></div>
            </div>
         </div>
         <div class="modal-footer">
         </div>
      </div>
   </div>
</div>
<script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12d8eede943e602b615bb4e2dc8e5e30&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   $(function() {
      jQuery.curCSS = function(element, prop, val) {
          return jQuery(element).css(prop, val);
      };
      console.log($('.info_btn_toggle'))
      $('#filter_mask').addClass('selected_filter');
      $('.menu_wrap > .current_refresh:eq(2)').addClass('selected_filter');
      /* $('.info_btn_toggle').on('click',function(){
         console.log($('.info_wrap'));
         $('.info_wrap').css("transform","translateX(-391px)");
         $('.info-toggle').css("left","0");
      }); */
      $('.search_keyword_input').autocomplete({
         source : function(request, response) {
            $.ajax({
               url : "<c:url value='/Homespital/Map/searchList.hst'/>",
               type : "GET",
               dataType: "json",
               data : {"search_keyword" : $(".search_keyword_input").val(),"apiStatus" : apiStatus},
               success : function(data){
                  console.log(data);
                  response($.map(data, function(item){
                     return {
                        label: item,
                        value: item
                     }
                  }));
               },
               error : function(){ //실패
                     alert("통신에 실패했습니다.");
                  }
            });
         },
         minLength : 1,
         autoFocus : false,
         select : function(evt, ui) {
               console.log("전체 data: " + JSON.stringify(ui));
               console.log(ui.item.label);
               $('.search_keyword_input').val(ui.item.label);
               $('.search_keyword_submit').trigger('click');
               /* console.log("db Index : " + ui.item.idx);
               console.log("검색 데이터 : " + ui.item.value); */
           },
           focus : function(evt, ui) {
               return false;
           },
           close : function(evt) {
              
           }
      })
      $('.search_keyword_submit').click(function(){

         console.log('검색',$('.search_keyword_input').val().length);
         var search_val = $('.search_keyword_input').val();
         if($('.search_keyword_input').val().length > 0)
         {
            switch (apiStatus) {
            case 0:
               loadHospitalList(search_val);
               break;
            case 1:
            case 2:
               loadPharmacyList(search_val);
               break;
            default:
               
            }
            
         }

      });
      
      $('.info_btn_toggle').click(function(){
         console.log($('.info_wrap'));
         $('.info_wrap').toggleClass('warp_invisible');
         $('.info-toggle').toggleClass('left_toggle');
      });
      
      $('#filter_hospital').click(function(){
         apiStatus = 0;
         console.log('병원 필터 클릭',apiStatus);
         $('.search_list').html('');
         $('.search_keyword_input').val('');
         
         $('#filter_hospital').addClass('selected_filter');
         $('#filter_pharmacy').removeClass('selected_filter');
         $('#filter_mask').removeClass('selected_filter');
      });
      $('#filter_pharmacy').click(function(){
         apiStatus = 1;
         console.log('약국 필터 클릭',apiStatus);
         $('.search_list').html('');
         $('.search_keyword_input').val('');
         
         $('#filter_hospital').removeClass('selected_filter');
         $('#filter_pharmacy').addClass('selected_filter');
         $('#filter_mask').removeClass('selected_filter');
      });
      $('#filter_mask').click(function(){
         apiStatus = 2;
         console.log('마스크 필터 클릭',apiStatus);
         $('.search_list').html('');
         $('.search_keyword_input').val('');
         
         $('#filter_hospital').removeClass('selected_filter');
         $('#filter_pharmacy').removeClass('selected_filter');
         $('#filter_mask').addClass('selected_filter');
      });
      
      $('.menu_wrap > .current_refresh:eq(0)').click(function(){
         $('.menu_wrap > .current_refresh:eq(0)').addClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(1)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(2)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(3)').removeClass('selected_filter');
      })
      
      $('.menu_wrap > .current_refresh:eq(1)').click(function(){
         $('.menu_wrap > .current_refresh:eq(0)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(1)').addClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(2)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(3)').removeClass('selected_filter');
      })
      
      $('.menu_wrap > .current_refresh:eq(2)').click(function(){
         $('.menu_wrap > .current_refresh:eq(0)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(1)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(2)').addClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(3)').removeClass('selected_filter');
      })
      
      $('.menu_wrap > .current_refresh:eq(3)').click(function(){
         $('.menu_wrap > .current_refresh:eq(0)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(1)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(2)').removeClass('selected_filter');
         $('.menu_wrap > .current_refresh:eq(3)').addClass('selected_filter');
      })
      
      $('#reservation_date').datepicker({
         dateFormat: "yy년 mm월 dd일",
         onSelect: function(dateText, inst) {
             var date = new Date();
             alert('선택하신 날짜는'+ date.getHours());
             console.log(date.getDate());
             changeAM_PM(date.getHours());
         },
         showAnim: "slide",
         showMonthAfterYear: true ,
         minDate: 0,
         yearSuffix: "년",
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],   //한글 캘린더중 월 표시를 위한 부분
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],   //한글 캘린더 중 월 표시를 위한 부분
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],   //한글 캘린더 요일 표시 부분
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],   //한글 요일 표시 부분
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],   // 한글 요일 표시 부분
      });
   });
</script>
<script>

   var markers = [];

   var currentLatLng;
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   lat, lon,
   mapOption = {
      center : new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
      level : 3, // 지도의 확대 레벨
      mapTypeId : kakao.maps.MapTypeId.ROADMAP
   // 지도종류
   };
   
   // 지도를 생성한다 
   var map = new kakao.maps.Map(mapContainer, mapOption);
   
   var geocoder = new kakao.maps.services.Geocoder();
   
   
   var apiStatus = 2; // 0:병원, 1: 약국, 2: 공적마스크, 3: 확진자 동선
   
   
   kakao.maps.event.addListener(map, 'dragend', function() {
      // 지도의  레벨을 얻어옵니다
       var level = map.getLevel();
   
       // 지도의 중심좌표를 얻어옵니다 
       var latlng = map.getCenter(); 
       searchAddrFromCoords(latlng, displayCenterInfo);
       var bound = map.getBounds();
       
       console.log("마커길이(드래그)",markers.length);
       for (var i = 0; i<markers.length; i++)
       {
          console.log(bound.contain(markers[i].getPosition()),markers[i]);
          if(!bound.contain(markers[i].getPosition()))
          {
             markers[i].setMap(null);
             markers.splice(i, 1);
             
             console.log("지도밖 삭제처리",markers.length,markers);
          }
       }
      
       console.log("지도레벨(드래그)",level);
       console.log("위치(드래그)",latlng);
       console.log("바운드(드래그)",bound);
       console.log("거리차이",distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer"))
       console.log("거리차이(Boolean)",distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer")>0.8)
       //storesByGeo(latlng.getLat(),latlng.getLng());
       if(distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer")>0.7)
       {
    	   loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);
           currentLatLng = latlng;
       }
       
   });
   
   kakao.maps.event.addListener(map, 'zoom_changed', function() {
      // 지도의  레벨을 얻어옵니다
       var level = map.getLevel();
       
      var latlng = map.getCenter(); 
      searchAddrFromCoords(latlng, displayCenterInfo);
       var bound = map.getBounds();
       
       removeMarker();
       
       
       console.log("지도레벨(드래그)",level);
       console.log("위치(드래그)",latlng);
       console.log("바운드(드래그)",bound);
       //storesByGeo(latlng.getLat(),latlng.getLng());
       loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);
   });
   
   // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
   if (navigator.geolocation) {
   
      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
      currentPosition()
   
      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition) {
   
         // 마커를 생성합니다
         var marker_present = new kakao.maps.Marker({
            map : map,
            position : locPosition,
            image :  new kakao.maps.MarkerImage(
                  "https://ssl.pstatic.net/static/maps/m/pin_rd.png",
                    new kakao.maps.Size(35, 35))
         });

         // 지도 중심좌표를 접속위치로 변경합니다
         map.setCenter(locPosition);
      }
      
      function loadMapApi(latitude,longitude,status)
      {
         console.log('API 상태',status);
         switch (status) {
         case 0:
            loadHospital(latitude,longitude);
            break;
         case 1:
            loadPharmacy(latitude,longitude);
            break;
         case 2:
            storesByGeo(latitude,longitude);
            break;
         default:
            loadCovidMap();
            break;
         }
      }
      function loadHospital(latitude,longitude)
      {
         $.ajax({
            url:"<c:url value='/Homespital/Map/Hospital.hst'/>",
            type:'get',
            datatype:'json',
            data:{"lat":latitude,"lng":longitude},
            beforeSend: function () {
               console.log("beforeSend");
               FunLoadingBarStart();
            },
            complete: function () {
               console.log("complete");
               FunLoadingBarEnd();
            },
            success:function(data){
               console.log(data);
               var jsonData = JSON.parse(data);
               console.log("연결성공", jsonData,typeof(jsonData));
               $.each(jsonData, function(i, item) {
                  
                  var marker = new kakao.maps.Marker({
                     //map : map,
                     position : new kakao.maps.LatLng(item.cor_y, item.cor_x),
                     image :  new kakao.maps.MarkerImage(
                           "<c:url value='/images/map/hospital_image/hospital.png'/>",
                             new kakao.maps.Size(35, 35))
                  });
                  
                  var iwContent = '<div style="padding:5px;">'+item.hosp_name+'</div>';
                     
                  var infowindow = new kakao.maps.InfoWindow({
                      content : iwContent
                  });
                  
                  kakao.maps.event.addListener(marker, 'click', function(){
                     console.log("modal",item,i)
                     console.log($('.info_wrap').hasClass('warp_invisible'));
                     console.log($('.info-toggle').hasClass('left_toggle'));
                     if($('.info-toggle').hasClass('left_toggle')==true)
                     {
                        $('.info_wrap').removeClass('warp_invisible');
                        $('.info-toggle').removeClass('left_toggle');
                        
                     }
                     listitem = getDetailHospItem(item.hosp_name,item.dept_name,item.address,item.tel);
                     $('.search_list').html(listitem);
                  });
                  
                  kakao.maps.event.addListener(marker, 'mouseover', function() {
                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                      infowindow.open(map, marker);
                  });

                  // 마커에 마우스아웃 이벤트를 등록합니다
                  kakao.maps.event.addListener(marker, 'mouseout', function() {
                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                      infowindow.close();
                  });
                  
                  var isSame = false;
                  for (var j = 0; j < markers.length; j++)
                  {
                     console.log(marker.getPosition().equals(markers[j].getPosition()));
                     //console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());
                     //if(marker.getPosition().getLat() == markers[j].getLat())
                     if(marker.getPosition().equals(markers[j].getPosition()))
                     {
                        isSame = true;
                     }
                     
                  }
                  
                  if(!isSame)
                  {
                     console.log("마커배열길이",jsonData.length,markers.length);
                     //if(data.count < markers.length)
                     marker.setMap(map);
                     console.log("중복이 아닌 마커",marker.getPosition());
                     markers.push(marker);
                     
                  }
                  else
                  {
                     console.log("중복 마커",marker.getPosition());
                     //marker.setMap(null);
                  }
               })
            },
            error:function(e){
               
            }
         });
      }
      function loadPharmacy(latitude,longitude)
      {
         $.ajax({
            url:"<c:url value='/Homespital/Map/Pharmacy.hst'/>",
            type:'get',
            datatype:'json',
            data:{"lat":latitude,"lng":longitude},
            beforeSend: function () {
               console.log("beforeSend");
               FunLoadingBarStart();
            },
            complete: function () {
               console.log("complete");
               FunLoadingBarEnd();
            },
            success:function(data){
               console.log(data);
               var jsonData = JSON.parse(data);
               console.log("연결성공", jsonData,typeof(jsonData));
               $.each(jsonData, function(i, item) {
                  
                  var marker = new kakao.maps.Marker({
                     //map : map,
                     position : new kakao.maps.LatLng(item.cor_y, item.cor_x),
                     image :  new kakao.maps.MarkerImage(
                           "<c:url value='/images/map/pharmacy_image/pharmacy.png'/>",
                             new kakao.maps.Size(35, 35))
                  });
                  
                  var iwContent = '<div style="padding:5px;">'+item.phar_name+'</div>';
                     
                  var infowindow = new kakao.maps.InfoWindow({
                      content : iwContent
                  });
                  kakao.maps.event.addListener(marker, 'click', function(){
                     console.log("modal",item,i)
                     console.log($('.info_wrap').hasClass('warp_invisible'));
                     console.log($('.info-toggle').hasClass('left_toggle'));
                     if($('.info-toggle').hasClass('left_toggle')==true)
                     {
                        $('.info_wrap').removeClass('warp_invisible');
                        $('.info-toggle').removeClass('left_toggle');
                        
                     }
                     listitem = getDetailPharItem(item.phar_name,item.address,item.tel);
                     $('.search_list').html(listitem);
                  });
                  
                  kakao.maps.event.addListener(marker, 'mouseover', function() {
                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                      infowindow.open(map, marker);
                  });

                  // 마커에 마우스아웃 이벤트를 등록합니다
                  kakao.maps.event.addListener(marker, 'mouseout', function() {
                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                      infowindow.close();
                  });
                  
                  var isSame = false;
                  for (var j = 0; j < markers.length; j++)
                  {
                     console.log(marker.getPosition().equals(markers[j].getPosition()));
                     //console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());
                     //if(marker.getPosition().getLat() == markers[j].getLat())
                     if(marker.getPosition().equals(markers[j].getPosition()))
                     {
                        isSame = true;
                     }
                     
                  }
                  
                  if(!isSame)
                  {
                     console.log("마커배열길이",jsonData.length,markers.length);
                     //if(data.count < markers.length)
                     marker.setMap(map);
                     console.log("중복이 아닌 마커",marker.getPosition());
                     markers.push(marker);
                     
                  }
                  else
                  {
                     console.log("중복 마커",marker.getPosition());
                     //marker.setMap(null);
                  }
               })
            },
            error:function(e){
               
            }
         });
      }
      function storesByGeo(latitude,longitude)
      {
         $.ajax({
            url:"<c:url value='/Homespital/Map/Mask.hst'/>",
            type:'get',
            datatype:'json',
            data:{"lat":latitude,"lng":longitude},
            beforeSend: function () {
               console.log("beforeSend");
               FunLoadingBarStart();
            },
            complete: function () {
               console.log("complete");
               FunLoadingBarEnd();
            },
            success:function(data){
               var jsonData = JSON.parse(data)
               console.log("연결성공", jsonData,typeof(jsonData));
               $.each(jsonData.stores, function(i, item) {
                  var marker = new kakao.maps.Marker({
                     //map : map,
                     position : new kakao.maps.LatLng(item.lat, item.lng),
                     image :  new kakao.maps.MarkerImage(
                           translateRemainStatImage(item.remain_stat),
                             new kakao.maps.Size(35, 35))
                  });
                  
                  var iwContent = '<div style="padding:5px;">'+item.name+'</div>';
                     
                  var infowindow = new kakao.maps.InfoWindow({
                      content : iwContent
                  });
                  
                  kakao.maps.event.addListener(marker, 'mouseover', function() {
                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                      infowindow.open(map, marker);
                  });

                  // 마커에 마우스아웃 이벤트를 등록합니다
                  kakao.maps.event.addListener(marker, 'mouseout', function() {
                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                      infowindow.close();
                  });
                  
                  //kakao.maps.event.addListener(marker, 'click', makeOverListener(map));
                  kakao.maps.event.addListener(marker, 'click', function(){
                     console.log("modal",item,i)
                     $('.body_title').html(item.name);
                     $('.content_addr').html(item.addr);
                     $('.content_stock').html(translateRemainStat(item.remain_stat));
                     $('.content_stock_count').html(translateRemainStatCount(item.remain_stat));
                     $('.content_type').html(translateType(item.type));
                     $('.content_stock_at').html('입고시간:'+item.stock_at);
                     $('.content_created_at').html('갱신시간:'+item.created_at);
                     $('#maskInfo-modal').modal('show');
                  });
                   
                  var isSame = false;
                  for (var j = 0; j < markers.length; j++)
                  {
                     console.log(marker.getPosition().equals(markers[j].getPosition()));
                     //console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());
                     //if(marker.getPosition().getLat() == markers[j].getLat())
                     if(marker.getPosition().equals(markers[j].getPosition()))
                     {
                        isSame = true;
                     }
                     
                  }
                  
                  if(!isSame)
                  {
                     console.log("마커배열길이",jsonData.count,markers.length);
                     //if(data.count < markers.length)
                     marker.setMap(map);
                     console.log("중복이 아닌 마커",marker.getPosition());
                     markers.push(marker);
                     
                  }
                  else
                  {
                     console.log("중복 마커",marker.getPosition());
                     //marker.setMap(null);
                  }
               });
            },
            error:function(e){
               
            }
         });
      }
      function loadCovidMap()
      {
         $.ajax({
            url:"<c:url value='/Homespital/Map/Covid.hst'/>",
            type:'get',
            datatype:'json',
            beforeSend: function () {
               console.log("beforeSend");
               FunLoadingBarStart();
            },
            complete: function () {
               console.log("complete");
               FunLoadingBarEnd();
            },
            success:function(data){
               var jsonData = JSON.parse(data);
               console.log("코로나 데이터",jsonData);
               $.each(jsonData, function(i, item) {
                  console.log("코로나 데이터",item);
                  geocoder.addressSearch(item.ADDRESS, function(result, status) {
                      if (status === kakao.maps.services.Status.OK) {
                         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                         
                         var marker = new kakao.maps.Marker({
                            image :  new kakao.maps.MarkerImage(
                                    "<c:url value='/images/map/corona_image/corona_patient.png'/>",
                                      new kakao.maps.Size(65, 65)),
                              position: coords
                          });
                         
                         var isSame = false;
                           for (var j = 0; j < markers.length; j++)
                           {
                              console.log(marker.getPosition().equals(markers[j].getPosition()));
                              if(marker.getPosition().equals(markers[j].getPosition()))
                              {
                                 isSame = true;
                              }
                              
                           }
                           
                           if(!isSame)
                           {
                              marker.setMap(map);
                              console.log("중복이 아닌 마커",marker.getPosition());
                              markers.push(marker);
                              
                           }
                           else
                           {
                              console.log("중복 마커",marker.getPosition());
                           }
                         
                      }
                  });
               });
            },
            error:function(e){
               
            }
         });
      }
      function loadHospitalList(search_val)
      {
         $.ajax({
            url:"<c:url value='/Homespital/Map/hospitalList.hst'/>",
            type:'get',
            datatype:'json',
            data:{"search_keyword":search_val},
            beforeSend: function () {
               console.log("beforeSend");
               FunLoadingBarStart();
            },
            complete: function () {
               console.log("complete");
               FunLoadingBarEnd();
            },
            success:function(data){
               var jsonData = JSON.parse(data);
               console.log("연결성공", jsonData,typeof(jsonData));
               var items = '';
               $.each(jsonData, function(i, item) {
                  console.log(item);
               
                  items += '<div class="search_item" onclick="searchItemClick(\''+item['ADDRESS']+'\');">'+
                           '<div class="search_item_detail">'+
                              '<div class="detail_content">'+
                                 '<div class="content_title">'+
                                    '<strong>'+item['HOSP_NAME']+'</strong>'+
                                 '</div>'+
                                 '<div class="content_body">'+
                                    //item['ADDRESS']+
                                    '내과 '+ 
                                    item['TEL']+
                                 '</div>'+
                                 '<div class="content_body">'+
                                    item['ADDRESS']+
                                 '</div>'+
                              '</div>'+
                           '</div>'+
                        '</div>'
               });
               $('.search_list').html(items);
            },
            error:function(e){
               
            }
         });
      }
      function loadPharmacyList(search_val)
      {
         $.ajax({
            url:"<c:url value='/Homespital/Map/pharmacyList.hst'/>",
            type:'get',
            datatype:'json',
            data:{"search_keyword":search_val},
            beforeSend: function () {
               console.log("beforeSend");
               FunLoadingBarStart();
            },
            complete: function () {
               console.log("complete");
               FunLoadingBarEnd();
            },
            success:function(data){
               var jsonData = JSON.parse(data);
               console.log("연결성공", jsonData,typeof(jsonData));
               var items = '';
               $.each(jsonData, function(i, item) {
                  console.log(item);
               
                  items += '<div class="search_item" onclick="searchItemClick(\''+item['ADDRESS']+'\');">'+
                           '<div class="search_item_detail">'+
                              '<div class="detail_content">'+
                                 '<div class="content_title">'+
                                    '<strong>'+item['PHAR_NAME']+'</strong>'+
                                 '</div>'+
                                 '<div class="content_body">'+
                                    item['TEL']+
                                 '</div>'+
                                 '<div class="content_body">'+
                                    item['ADDRESS']+
                                 '</div>'+
                              '</div>'+
                           '</div>'+
                        '</div>'
               });
               $('.search_list').html(items);
            },
            error:function(e){
               
            }
         });
      }
      function translateType(type)
      {
         switch (type) {
         case "01":
            return "약국"
         case "02":
            return "우체국"
         default:
            return "농협"
         }
      }
      
      function translateRemainStat(remain_stat)
      {
         switch (remain_stat) {
         case "plenty":
            return "충분"
         case "some":
            return "보통"
         case "few":
            return "부족"
         case "empty":
            return "재고x"
         default:
            return "판매X"
         }
      }
      
      function translateRemainStatImage(remain_stat)
      {
         switch (remain_stat) {
         case "plenty":
            return "<c:url value='/images/map/maskmap_image/mask_plenty.png'/>"
         case "some":
            return "<c:url value='/images/map/maskmap_image/mask_some.png'/>"
         case "few":
            return "<c:url value='/images/map/maskmap_image/mask_few.png'/>"
         default:
            return "<c:url value='/images/map/maskmap_image/mask_empty.png'/>"
         }
      }
      
      function translateRemainStatCount(remain_stat)
      {
         switch (remain_stat) {
         case "plenty":
            return "100개 이상"
         case "some":
            return "30개 이상 100개미만"
         case "few":
            return "2개 이상 30개 미만"
         case "empty":
            return "1개 이하"
         default:
            return "판매중지"
         }
      }
      
      var element_wrap = document.getElementById('search_wrap');
      
      function foldDaumPostcode() {
           // iframe을 넣은 element를 안보이게 한다.
           element_wrap.style.display = 'none';
       }
      function addressSearch()
      {
         if($('.info-toggle').hasClass('left_toggle')==true)
         {
            $('.info_wrap').removeClass('warp_invisible');
            $('.info-toggle').removeClass('left_toggle');
            
         }
         /*
         var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
         new daum.Postcode({
               oncomplete: function(data) {
                   var addr = data.address; // 최종 주소 변수

                   // 주소 정보를 해당 필드에 넣는다.
                   document.getElementById("searchAddress").value = addr;
                  
                   // 주소로 상세 정보를 검색
                   geocoder.addressSearch(data.address, function(results, status) {
                       // 정상적으로 검색이 완료됐으면
                       if (status === kakao.maps.services.Status.OK) {

                           var result = results[0]; //첫번째 결과의 값을 활용

                           // 해당 주소에 대한 좌표를 받아서
                           var coords = new kakao.maps.LatLng(result.y, result.x);
                           // 지도를 보여준다.
                           mapContainer.style.display = "block";
                           map.relayout();
                           // 지도 중심을 변경한다.
                           map.setCenter(coords);
                           
                           element_wrap.style.display = 'none';
                           document.body.scrollTop = currentScroll;
                           //storesByGeo(result.y, result.x);
                           loadMapApi(result.y, result.x,apiStatus);
                       }
                   });
               },
               onresize : function(size) {
                   element_wrap.style.height = '500px';
               },
               width : '100%',
               height : '100%'
           }).embed(element_wrap);
         
         element_wrap.style.display = 'block';
         */
      }
      function currentPosition()
      {
         navigator.geolocation.getCurrentPosition(function(position) {

            removeMarker();
            lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
      
            console.log(lat);
            console.log(lon);
            //storesByGeo(lat,lon);
            loadMapApi(lat,lon,apiStatus);
            
            var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
      
            currentLatLng = locPosition;
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition);
      
         });
      }
      function searchAddrFromCoords(coords, callback) {
          geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
      }
      function displayCenterInfo(result, status) {
          if (status === kakao.maps.services.Status.OK) {
              var infoDiv = document.getElementById('searchAddress');

              for(var i = 0; i < result.length; i++) {
                  // 행정동의 region_type 값은 'H' 이므로
                  if (result[i].region_type === 'H') {
                      infoDiv.value = result[i].address_name;
                      break;
                  }
              }
          }    
      }
      function searchItemClick(address)
      {
         geocoder.addressSearch(address,function(result, status){
            if (status === kakao.maps.services.Status.OK) {

                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
                 console.log(apiStatus);
                 
                 removeMarker();
                 
                 map.setCenter(coords);

                 $.ajax({
                  url:"<c:url value='/Homespital/Map/detailView.hst'/>",
                  type:'get',
                  datatype:'json',
                  data:{"address":address,"apiStatus" : apiStatus},
                  beforeSend: function () {
                     console.log("beforeSend");
                     FunLoadingBarStart();
                  },
                  complete: function () {
                     console.log("complete");
                     FunLoadingBarEnd();
                     loadMapApi(coords.getLat(),coords.getLng(),apiStatus);
                  },
                  success:function(data){
                     var jsonData = JSON.parse(data);
                     console.log("연결성공", jsonData,typeof(jsonData));
                     var item = '';
                     if(apiStatus == 0)
                     {
                        console.log(jsonData[0]['HOSP_NAME']);
                        item = getDetailHospItem(jsonData[0]['HOSP_NAME'],jsonData[0]['DEPT_NAME'],jsonData[0]['ADDRESS'],jsonData[0]['TEL'])
                     }
                     else if (apiStatus == 1)
                     {
                        console.log(jsonData[0]['PHAR_NAME']);
                        item = getDetailHospItem(jsonData[0]['PHAR_NAME'],jsonData[0]['ADDRESS'],jsonData[0]['TEL'])
                     }
                     
                     $('.search_list').html(item);
                  },
                  error:function(e){
                     
                  }
               });
                 
            }
         });
      }

      function getDetailHospItem(hospname,deptname,address,tel)
      {
         item = '<div class="inner_top">'+
                  '<div class="inner_title_area">'+
                     '<div class="inner_title">'+
                        '<strong>'+hospname+'</strong>'+
                     '</div>'+
                     '<div class="inner_summary_info">'+
                        '<span>내과</span>'+
                     '</div>'+
                  '</div>'+
                  '<div class="inner_btn_area">'+
                     '<div class="btn_direction">'+
                        '<button class="find_way_btn">길찾기</button>'+
                        '<button class="reservation_btn" onclick="reservation_show();">예약</button>'+
                     '</div>'+
                  '</div>'+
                  '<div class="inner_final_area">'+
                     '<div class="inner_detail_address">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">'+address+'</div>'+
                     '</div>'+
                     '<div class="inner_detail_tel">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">'+tel+'</div>'+
                     '</div>'+
                     '<div class="inner_detail_time">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">11:00~16:00</div>'+
                     '</div>'+
                     '<div class="inner_detail_time2">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">'+
                           '영업시간 11:00~ 14:40 16:00~ 20:30<br/>'+
                           '휴무: 매주 월요일'+
                        '</div>'+
                     '</div>'+
                  '</div>'+
               '</div>';
         return item;
      }
      
      function getDetailPharItem(pharname,address,tel)
      {
         item = '<div class="inner_top">'+
                  '<div class="inner_title_area">'+
                     '<div class="inner_title">'+
                        '<strong>'+pharname+'</strong>'+
                     '</div>'+
                     '<div class="inner_summary_info">'+
                        '<span>약국</span>'+
                     '</div>'+
                  '</div>'+
                  '<div class="inner_btn_area">'+
                     '<div class="btn_direction">'+
                        '<button class="find_way_btn">길찾기</button>'+
                     '</div>'+
                  '</div>'+
                  '<div class="inner_final_area">'+
                     '<div class="inner_detail_address">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">'+address+'</div>'+
                     '</div>'+
                     '<div class="inner_detail_tel">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">'+tel+'</div>'+
                     '</div>'+
                     '<div class="inner_detail_time">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">11:00~16:00</div>'+
                     '</div>'+
                     '<div class="inner_detail_time2">'+
                        '<img class="inner_final_icon" >'+
                        '<div class="inner_end_box">'+
                           '영업시간 11:00~ 14:40 16:00~ 20:30<br/>'+
                           '휴무: 매주 월요일'+
                        '</div>'+
                     '</div>'+
                  '</div>'+
               '</div>';
         return item;
      }
      
      function reservation_show(){
         console.log($('#reservation-modal'));
         console.log($(".inner_title").text());
         $('#modal_hosp_name').attr('value',$(".inner_title").text());
         $('#reservation-modal').modal('show');
   
      }

      function changeApi(status)
      {
         apiStatus = status;
         console.log('상태',apiStatus);
         refreshMap();
      }
      function refreshMap()
      {
         removeMarker();
         var latlng = map.getCenter(); 
         //storesByGeo(latlng.getLat(),latlng.getLng());
         loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);
      }
      function removeMarker()
      {
         for(var i = 0; i < markers.length; i++ )
         {
            markers[i].setMap(null);
         }
         markers = [];
      }
      
      function FunLoadingBarStart() {
         console.log($('.load_wrap'),$('.load_img'));
         
         $('.load_wrap').show();
      }
      function FunLoadingBarEnd() {
         
         $('.load_wrap').hide();
         
      }
      
      function changeAM_PM(date,day) {
    	  var AMPM = ["오전","오후"];
    	  $("#AM_PM").empty();

    	  //console.log(day==new date());
    	  
    	  var option
    	  
    	  if(date < 13 && date >= 0)
    	  {
    		  option += "<option>"+AMPM[0]+"</option>"; 
    		  option += "<option>"+AMPM[1]+"</option>";
    	  }
    	  else
    	  {
    		  option += "<option>"+AMPM[1]+"</option>";
    	  }
    	  $('#AM_PM').append(option);
    	  /* for(var count = 0; count < AMPM.size(); count++){                
              var option = $("<option>"+AMPM[count]+"</option>");
              $('#AM_PM').append(option);
          } */
	  }
      
      function deg2rad(deg){
    	  return (deg * Math.PI / 180.0);
      }
      function rad2deg(rad){
    	  return (rad * 180 / Math.PI);
      }
      function distance(lat1, lon1, lat2, lon2, unit){
    	  var theta = lon1 - lon2;
    	  var dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
    	  
    	  dist = Math.acos(dist);
          dist = rad2deg(dist);
          dist = dist * 60 * 1.1515;
          
          if (unit == "kilometer") {
              dist = dist * 1.609344;
          } else if(unit == "meter"){
              dist = dist * 1609.344;
          }

          return dist;
      }
   }

</script>