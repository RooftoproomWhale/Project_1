/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	var start ="";
    $('#deleteEvent_no1').data('id', event._id); //클릭한 이벤트 ID
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
    
    addBtnContainer.hide();
    modifyBtnContainer.show();
    
    
    if(event.type=="복용약등록"){
    	 modalTitle.html('복용중인 약 상세보기');
    	 	eventdrugModal.modal('show');
    	 
    }
     else if(event.type=="병원예약"){
    	 start = moment(event.start).format('YYYY-MM-DD HH:mm');
  
    	 $('#apply_time').html(event.apply_TIME);
    	 $('input[name="update-start"]').val(start);
    	 change();
    	 	eventhosModal.modal('show');
    	
    	 }
     else{
    	   eventModal.modal('show');
     }


    //업데이트 버튼 클릭시-
    $('#updateEvent_no1,#updateEvent2').unbind();
    $('#updateEvent_no1,#updateEvent2').on('click', function () {
    
    	if($(this).attr('id')=='updateEvent_no1'){
    		 modalTitle.html('예약 변경');
    		 
    		$('#updateEvents_no1').css('display','');
        	$('#updateEvent_no1').css('display','none');
        	$('#titlecall').html('<input type="text" id="update_title" value='+event.title+'>')
        	$('#namecall').html('<input type="text" id="update_name" value='+event.username+'>')
        	
        	$('#timecall').css('display','none');
        	$('#timecall2').css('display','');
        	
        	
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
	
*/		
		
		event.title= $('#update_title').val();
     
       /* event.title = editTitle.val();*/
        event.username=$('#update_name').val();
       event.start = $('input[name="update-start"]').val();
       /*        event.end = displayDate;
        event.type = editType.val();
        event.description = editDesc.val();*/
        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "",//<c:url value='/Calendar/update.hst'/>
            data: {
                //...
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

	change();
});
//상세보기로 변경
function change() {
	 modalTitle.html('예약 상세페이지');
	 $('#apply_time').html(event.apply_Time);
	 $('#titlecall').html(event.title);
	 $('#namecall').html(event.username);
	 starts= moment(event.start).format('YYYY-MM-DD HH:mm')
	 $('#timecall').text(starts);
	 $('#timecall').css('display','');
 	$('#timecall2').css('display','none');
	 $('#updateEvents_no1').css('display','none');
 	$('#updateEvent_no1').css('display','');
}
};

// 삭제버튼
$('#deleteEvent_no1').on('click', function () {
    $('#deleteEvent_no1').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
  
    eventModal.modal('hide');
    eventdrugModal.modal('hide');
    eventhosModal.modal('hide');
    //삭제시
    $.ajax({
        type: "get",
        url: "",//<c:url value='/Calendar/delete.hst'/>
        data: {
            //...
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });
});