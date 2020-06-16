/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	var start ="";
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");
  

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }
    
    if(event.type=="복용약등록"){
    	 modalTitle.html('복용중인 약 상세보기');
    	 
    }
   
    else if(event.type=="병원예약"){
    	 start = moment(event.start).format('YYYY-MM-DD HH:mm');
    	change();
    	 }
function change() {
	 modalTitle.html('예약 상세페이지');
	 $('#titlecall').html(event.title);
/*	 $('#timecall').html(start);*/
	 $('#namecall').html(event.username);
	 $('#updateEvents_no1').css('display','none');
 	$('#updateEvent_no1').css('display','inline');
}
    addBtnContainer.hide();
    modifyBtnContainer.show();
    if(event.type=="복용약등록"){
    	eventdrugModal.modal('show');
    }
    else if(event.type=="병원예약"){
    	eventhosModal.modal('show');
    }else{
    
    eventModal.modal('show');
    }
    //업데이트 버튼 클릭시
    $('#updateEvent_no1,#updateEvent2').unbind();
    $('#updateEvent_no1,#updateEvent2').on('click', function () {
    	console.log(start)
    	if($(this).attr('id')=='updateEvent_no1'){
    		 modalTitle.html('예약 변경');
    		$('#updateEvents_no1').css('display','inline');
        	$('#updateEvent_no1').css('display','none');
        	$('#titlecall').html('<input type="text" id="update-title" value='+event.title+'>')
        	$('#namecall').html('<input type="text" id="update_name" value='+event.username+'>')
        	$('#timecall').html('<input  type="datetime-local" id="update_start" value="'+event.start+'">')
        	
    	}
    	
    	 

    });
    /*예약변경후 */
$('#updateEvents_no1').on('click',function(){
/*
        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

*/		console.log("테스트1"+$('#update_start').val())     
		
		event.title= $('#update_title').val();
        event.start = moment($('#update_start').val()).format('YYYY-MM-DD HH:mm');
        console.log(event.start);
       /* event.title = editTitle.val();*/
        event.username=$('#update_name').val();
 /*       event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.description = editDesc.val();*/

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "",
            data: {
                //...
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

	change();
});
};

// 삭제버튼
$('#deleteEvent').on('click', function () {
    console.log('삭제')
    $('#deleteEvent').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');
    eventdrugModal.modal('hide');
    eventhosModal.modal('hide');
    //삭제시
    $.ajax({
        type: "get",
        url: "",
        data: {
            //...
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });
    change();
});