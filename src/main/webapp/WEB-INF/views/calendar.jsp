<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="<c:url value="/calendar/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">


<link href='<c:url value="/calendar/core/main.css"/>' rel='stylesheet' />
<link href='<c:url value="/calendar/daygrid/main.css"/>' rel='stylesheet' />
<link href='<c:url value="/calendar/timegrid/main.css"/>' rel='stylesheet' />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src='<c:url value="/calendar/core/main.js"/>'></script>
<script src='<c:url value="/calendar/interaction/main.js"/>'></script>
<script src='<c:url value="/calendar/daygrid/main.js"/>'></script>
<script src='<c:url value="/calendar/timegrid/main.js"/>'></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        defaultDate: '2020-05-21',
        locale:'ko',
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectMirror: true,
        select: function(arg) {
   			var title=prompt("일정을 입력해주세요");
         
          console.log(arg);
          		if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        editable: true,
        eventLimit: true, // allow "more" link when too many events
     events:  function(info, successCallback,failureCallback) {
  			$.ajax({
  				url: '<c:url value="/Calendar/View.do"/>',
  				type: 'POST',
  				dataType:'json',
  				data:{
  					start:moment(info.startStr).format('YYYY-MM-DD'),
  					end:moment(info.endStr).format('YYYY-MM-DD'),
  				},
  				success: function (data) {
  					
  					var events=[];
  					$.each(data,function(index,valeus){
 					console.log(data);
  					console.log(data[0].title);
  					
  					events.push({
  						title: data[0].title,
  						start: data[0].start,
  						end:data[0].end,
  				
  						});
  					console.log(events);
  					
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
	
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
  padding-top: 95px;
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>


  <div id='calendar'>
  </div>
  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

	<script src='<c:url value="/calendar/bootstrap/js/bootstrap.min.js"/>'></script>

</html>

