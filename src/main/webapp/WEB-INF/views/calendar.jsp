<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<!-- 캘린더 필요 -->
<link href='<c:url value="/calendar/core/main.css"/>' rel='stylesheet' />
<link href='<c:url value="/calendar/daygrid/main.css"/>' rel='stylesheet' />
<link href='<c:url value="/calendar/timegrid/main.css"/>' rel='stylesheet' />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/css/style.css"> -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        columnHeaderText: function(date) {
           let weekList = ["일", "월", "화", "수", "목", "금", "토"];
           return weekList[date.getDay()];
        },
        selectable: true,
        selectMirror: true,
        select: function(arg) {
            $("#date").val(arg.start);
            $("#createEventModal").modal("show");
               $('#submitButton').click(function() {
               var title= $('#title1').val();
            console.log(title);
                if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
                arg.start="";
                end: arg.end="";
                $("#createEventModal").modal("hide");
                })
                  $('#close').click(function() {
                         arg.start="";
                             end: arg.end="";
                         $("#createEventModal").modal("hide");
                  })
          calendar.unselect();
               
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
.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        .modal-dialog {z-index: 1050;}
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
</head>


  <div id='calendar'>
  </div>

<div id="createEventModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
                <h4>복용중인 약 등록</h4>
            </div>
            <div id="modalBody" class="modal-body">
               <div class="form-group">
                    <input class="form-control" type="text" placeholder="test" >
                </div>

                <div class="form-group form-inline">
                    <div class="input-group date" data-provide="datepicker">
                        <input type="text" class="form-control" placeholder="" id="date" >
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar" id="datepicker"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <textarea class="form-control" type="text" rows="4" placeholder="약 이름" id="title1"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true" id="close">Cancel</button>
                <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

   <script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</html>
