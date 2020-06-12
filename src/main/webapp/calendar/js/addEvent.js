//일정추가
var eventModal = $('#eventModal');
//예약세부
var eventhosModal=$('#eventhosModal')
//복용약 세부
var eventdrugModal = $('#eventdrugModal');
//복용약 수정
var eventdrugModaladd=$('#eventdrugModaladd');
var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $("input[name='edit-title']");
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김
    
    if(eventType =="복용약등록"){
    	modalTitle.html("복용약 등록")
     }else{
    modalTitle.html('병원 예약');
     }
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    if(eventType=="복용약등록"){
    	eventdrugModaladd.modal('show');
    		
    }
	else{
    eventModal.modal('show');
 
    }
  

   
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    
    //새로운 일정 저장버튼 클릭
    $('#save-event1,#save-event2',).unbind();
    $('#save-event1,#save-event2',).on('click',function () {
    	var editTitles="";

    	for(i=0;i <= editTitle.length;i++){
    		if(editTitle.eq(i).val()!=null)
    			editTitles = editTitle.eq(i).val();	
    	};
        var eventData = {
        	
            _id: eventId,
        	
            title: editTitles,

            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: '가길동',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        	
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');
        eventdrugModaladd.modal('hide');
   	
   
     eventhosModal.modal('hide');
        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "",
            data: {
                //.....
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};