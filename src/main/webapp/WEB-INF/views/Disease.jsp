<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
<style>

/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 82%;
	margin-left: -250px;
   background:#F3F3F3;
	overflow-x: hidden;
	overflow-y: auto;
	border: 1px #DAD9FF solid;
	margin-top: 79px;
}

 #page-content-wrapper {
    width: 100%;
    padding: 20px;
 padding-top: 150px;
 margin-left:130px;
 
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
    background:#808080;
  }
	
 	.sidebar-nav2{
	margin-right:-1px
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
    border:1px #8C8C8C solid;
	 background:#E6E6E6;
  }
  
  .sidebar-nav li:first-child{ background:#4d4d4d}
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
    color:#fff
  }
  .sidebar-nav2 li {
    text-indent: 1.5em;
    line-height: 2.8em;
    color:#fff
  }
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #fff;
  }
   .sidebar-nav2 li a :not(first-child){
    display: block;
    text-decoration: none;
  color:#A6A6A6;
  }
/*현재페이지*/
.sidebar-nav :nth-child(2) a {
	color: #fff;

}

.sidebar-nav li:not (.sidebar-brand ):hover {
	color: #fff;
	background: #B2EBF4;
}


.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

	.sidebar-brand{
	margin-top:0px;
	margin-bottom: 0px;
	}








caption {
	font-size: 15px;
	font-weight: bold;
}
.input-inside-table{
margin-bottom: 15px
}
@media all and (min-width:500px) and (max-width:1024px){
#sidebar-wrapper{    left:-250px;}
.main{left:-150px;}
#page-wrapper{left:-150px;padding-left: 0px;margin-left: 0px}


}

#console,#cons {border: 1px solid #ccc; }
#console li:not(:last-child),#cons li:not(:last-child){border-bottom: 1px solid #ccc}
a{color:black;}

/*메인*/
* {
  box-sizing: border-box;
  outline: none;
}

:root {
  --bg-color: #f5f8ff;;
  --main-color: #353536;
  --secondary-color: #8e92a4;
  --main-text-color: #5d606b;
  --secondary-dark-color: #9496a5;
  --tag-color-one: #e0fbf6;
  --tag-color-text-one: #58c2a9;
  --tag-color-two: #ece7fe;
  --tag-color-text-two: #8972f3;
  --tag-color-three: #fde7ea;
  --tag-color-text-three: #e77f89;
  --tag-color-four: #f7f8fc;
  --tag-color-text-four: #a0a6b5;
  --checkbox-color: #009e90;
  --button-color: #49beb7;
  --box-color: #fff1d6;
  --box-color-2: #d3e6ff;
  --box-color-3: #ffd9d9;
  --box-color-4: #daffe5;
  --task-color: #777982;
}

%flex {
  display: flex;
  align-items: center;
}

body {
  margin: 0;
  @extend %flex;
  justify-content: center;
  flex-direction: column;
  overflow: auto;
  width: 100%;
  height: 100vh;

  font-family: 'DM Sans', sans-serif;;
  font-size: 12px;
  background-blend-mode: overlay,multiply,color,normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

button { 
  border: none; 
  background: none;
  cursor: pointer;
}

.task-manager {
	padding-top:60px;
  display: flex;
  justify-content: space-between;
  width: 100%;

  height: 90vh;

  max-height: 900px;
  background: #fff;
  border-radius: 4px;
  box-shadow:
  0 0.3px 2.2px rgba(0, 0, 0, 0.011),
  0 0.7px 5.3px rgba(0, 0, 0, 0.016),
  0 1.3px 10px rgba(0, 0, 0, 0.02),
  0 2.2px 17.9px rgba(0, 0, 0, 0.024),
  0 4.2px 33.4px rgba(0, 0, 0, 0.029),
  0 10px 80px rgba(0, 0, 0, 0.04);
  overflow: hidden;
}






.right-bar {
  width: 320px;
  border-left: 1px solid #e3e7f7;
  display: flex;
  flex-direction: column;
  
  
}
.right-bar .header { 
    font-size: 20px; 
    color: var(--main-text-color);
    margin-left: 30px;
  }
.top-part {
  padding: 30px;
  @extend %flex; 
  align-self: flex-end;
  }
 .top-part svg {
    width: 14px;
    height: 14px;
    color: var(--main-color);
    margin-right: 14px;
  }
  
.top-part  .count {
    font-size: 12px;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    background-color: #623ce8;
    color: #fff;
    @extend %flex;
    justify-content: center;
  
}

.top-part .right-content {
  padding: 10px 40px;
  overflow-y: auto;
  flex: 1;
}

.task-box {
  position: relative;
  border-radius: 12px;
  width: 100%;
  margin: 20px 0;
  padding: 16px;
  cursor: pointer;
  box-shadow: 2px 2px 4px 0px rgba(235,235,235,1);
  
 
}
 .task-box:hover {
    transform: scale(1.02);
  }
.time { margin-bottom: 6px; opacity: 0.4; font-size: 10px; }

.task-name { 
  font-size: 14px; 
  font-weight: 500;
  opacity: 0.6;
}

.yellow { 
  background-color: var(--box-color);
}

.blue { background-color: var(--box-color-2); }

.red { background-color: var(--box-color-3); }

.green { background-color: var(--box-color-4); }

.more-button {
  position: absolute;
  width: 3px;
  height: 3px;
  border-radius: 50%;
  background-color: #8e92a4;
  opacity: 0.4;
  right: 24px;
  top: 19px;
  cursor: pointer;
}

.members {
  display: flex;
  margin-top: 14px;
  
 
}
.members img {
    border-radius: 50%;
    width: 30px;
    height: 30px;
    margin-right: 4px;
    object-fit: cover;
  }

.page-content {
  display: flex;
  flex-direction: column;
  flex: 1;
  padding: 40px 20px 0 20px;
  
 }
.page-content:header { 
    font-size: 26px; 
    color: var(--main-color); 
    margin-top: 30px;
  }

.content-categories {
  display: flex;
  justify-content: space-evenly;
  width: 100%;
  border-bottom: 1px solid #ddd;
  padding: 20px 0;
}

.nav-item { display: none; }

.category { 
  font-weight: 500; 
  color: var(--secondary-color); 
  border-bottom: 1px solid #ddd;
  transition: .4s ease-in;
  padding: 20px 30px;
  cursor: pointer;
}

#opt-1:checked + label ,
#opt-2:checked +  label ,
#opt-3:checked +  label ,
#opt-4:checked +  label,
#opt-5:checked +  label,
#opt-6:checked +  label,
#opt-7:checked +  label,
#opt-8:checked +  label,
#opt-9:checked +  label,
#opt-10:checked +  label,
#opt-11:checked +  label {
  color: var(--checkbox-color);
  border-bottom: 2px solid var(--checkbox-color);
}

.task-item { display: none; }

.tasks-wrapper {
  padding: 30px 0;
  flex: 1;
  overflow-y: auto;
  height: 100%;
  padding-right: 8px;
}

.task {
  display: flex;
  justify-content: space-between;
  position: relative;
  margin-bottom: 16px;
  padding-left: 30px;
  color: var(--task-color);
  font-size: 13px;
  font-weight: 500;
  
 
  
  label {
    cursor: pointer;
  }

  .task:hover {
    transform: translatex(2px);
  }
}

 label .label-text { position: relative; }

 label .label-text:before {
  content:'';
  position: absolute;
  width: 14px;
  height: 14px;
  border: 1px solid #ddd;
  border-radius: 2px;
  left: -24px;
  transition: .2s ease;
}

.task-item:checked + label .label-text:before {
  background-color: var(--checkbox-color);
  border: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3E%3Cpolyline points='20 6 9 17 4 12'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-size: 10px;
  background-position: center;
  border: 1px solid var(--checkbox-color);
}

.tag {
  font-size: 10px;
  padding: 4px 8px;
  border-radius: 20px;
  }
  .tag .approved {
    background-color: var(--tag-color-one);
    color: var(--tag-color-text-one);
  }
 
  .tag .progress {
    background-color: var(--tag-color-two);
    color: var(--tag-color-text-two);
  }
  
  .tag .review {
    background-color: var(--tag-color-three);
    color: var(--tag-color-text-three);
  }
  
  .tag .waiting {
    background-color: var(--tag-color-four);
    color: var(--tag-color-text-four);
  }


.upcoming { 
  border-bottom: 1px solid #ddd; 
  padding-bottom: 30px;
  margin-bottom: 30px;
}

@media screen and (max-width: 900px) {
  .left-bar {
    display: none;
  }
}

@media screen and (max-width: 700px) {
  .task-manager {
    flex-direction: column;
    overflow-y: auto;
  }
  
  .right-bar, .page-content {
    width: 100%;
    display: block;
  }
  
  .tasks-wrapper { height: auto; }
}

@media screen and (max-width: 520px) {
  .page-content { padding: 40px 10px 0 10px; }
  
  .right-content { padding: 10px 16px; }
  
  .category { padding: 20px; }
}

</style>

      <script type="text/javascript">

		$(function() {
			$(".task-item").change(function(){
				 var txt = $(this).next().text();
	             var disease=$('.task-name');
	             var taskbox=$('.task-box');
	             var size = disease.length;
		        if($(".task-item").is(":checked")){
		        	
		             var is =true;
		              
		   
		               if(size==0){
		            	   $("<div class='task-box yellow'><div class='description-task'><div class='task-name'>"+txt+"</div></div> <div class='glyphicon glyphicon-remove more-button'></div><div class='members'></div></div>").appendTo('.right-content');
						 }
		               else{
		               		for (i=0;i<size;i++){
		            	   
		                		if(disease.eq(i).text()==txt){
		                		is = false;
		                  		}
		              		}
		               		if(is){
		            	  			 $("<div class='task-box yellow'><div class='description-task'><div class='task-name'>"+txt+"</div></div> <div class='glyphicon glyphicon-remove more-button'></div><div class='members'></div></div>").appendTo('.right-content');
		               	  }
		               }
		        	}
		        else{
		
		        	for(i=0;i <size;i++){
		        		if(txt == disease.eq(i).text()){
		        			taskbox.eq(i).remove()
		        		}
		        		
		        	}
		        	
	    		}
		    });
		

      		/*사이드바 클릭삭제*/
        	
          		 $(document).on("click",".more-button",function(){
            	var is = confirm("삭제 하시겠습니까?");
    			if(is){
           		$(this).closest('div').remove();
    			}
            }); 
            /*탑메뉴*/
     
            $("input[name=nav]").change(function(){
            	 
            	  var idx = $('input[name=nav]').index(this);
            	
            	 switch (idx) {
				case 0: 
					$('.task').hide();
          	 		 $('.task').show(); 
					break;
				case 1:
					$('.task').hide();
         	 		 $('input[name=task-gs]').closest("div").show(); 
					break;
				case 2:
					$('.task').hide();
         	 		 $('input[name=task-ns]').closest("div").show(); 
					break;
				case 3:
					$('.task').hide();
         	 		 $('input[name=task-os]').closest("div").show(); 
					break;
				case 4:
					$('.task').hide();
         	 		 $('input[name=task-uro]').closest("div").show(); 
					break;
				case 5:
					$('.task').hide();
         	 		 $('input[name=task-np]').closest("div").show(); 
					break;
				case 6:
					$('.task').hide();
         	 		 $('input[name=task-ent]').closest("div").show(); 
					break;
				case 7:
					$('.task').hide();
         	 		 $('input[name=task-nr]').closest("div").show(); 
					break;
				case 8:
					$('.task').hide();
         	 		 $('input[name=task-gi]').closest("div").show(); 
					break;
				case 9:
					$('.task').hide();
         	 		 $('input[name=task-p]').closest("div").show(); 
					break;
				default:
					$('.task').hide();
    	 			 $('input[name=task-der]').closest("div").show(); 
					break;
				}
            	});
    	});
		
    function gitas() {
		var txt = $('#gita').val();
		if(txt != null){
        var disease=$('li[name=disease]')
        var is =true;
         var size = disease.length

          if(size==0){
        	  return $("<li name='disease'><a href='https://ko.wikipedia.org/wiki/"+txt+"'>"+txt+"</a></li>").appendTo('#cons');
			 }
          else{
          	for (i=0;i<size;i++){
       	   		if(disease.eq(i).text()==txt){
          			is = false;
             }
         }
          if(is){
        	 return $("<li name='disease'><a href='https://ko.wikipedia.org/wiki/"+txt+"'>"+txt+"</a></li>").appendTo('#cons');
          }
	}
		}};
		
	
   	function save() {
			var is = confirm("저장하시겠습니까?");
			if(is){
			var str=""
			var dis = $('.task-name');
			for(i=0;i<dis.length;i++){
				str +=$.trim(dis.eq(i).text())+",";
			}
		

		
		    return  console.log(str.slice(0,-1));
			}
	};
	
	function dls() {
		var is = confirm("모두 삭제 하시겠습니까?");
		if(is){
			$('#console li').remove();
		}
	}
	
	
        </script>



<div id="page-wrapper" class="container-fluid">
<!-- 사이드 -->
	<div  id="sidebar-wrapper">

	  <h3 class="sidebar-brand" style="height: 90px;text-align: center;line-height: 90px;height: 120px">
    	<img style="width: 100%;height: 100%" src="<c:url value='/img/mypages.PNG'/>">
       </h3>
	<ul class="sidebar-nav">
	<li><span class="glyphicon glyphicon-leaf" style="left: -20px"><strong>김길동</strong>님</span></li>
      <li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
      <li><a href="<c:url value='/mypage/Yun.hst'/>">복약 관리</a></li>
      <li><a href="<c:url value='/mypage/ReservationList.hst'/>">진료 예약 현황</a></li>
      <li><a href="#">내 질병 관리</a></li>
      <li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
    </ul>
    <ul class="sidebar-nav2" style="margin-top:10px;">
    	  <li style="color:black;">예병관련 사이트</li>
      <li><a href="https://korean.cdc.gov/coronavirus/2019-ncov/index.html">코로나바이러스</a></li>
      <li><a href="http://www.cdc.go.kr/npt/">질병관리본부</a></li>
      <li><a href="<c:url value='/mypage/unmember.hst'/>">세브메뉴4</a></li>
    </ul>
  </div>
	<!-- 사이드 끝 -->
	
	<div class="task-manager">
  
  
  <div class="page-content">
    <div class="header">내 질병 관리</div>
    <div class="content-categories">
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-1" checked>
        <label class="category" for="opt-1">모두</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-2" >
        <label class="category" for="opt-2">외과</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-3">
        <label class="category" for="opt-3">신경외과</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-4">
        <label class="category" for="opt-4">정형외과</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-5">
        <label class="category" for="opt-5">비뇨기과</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-6">
        <label class="category" for="opt-6">정신과</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-7">
        <label class="category" for="opt-7">이비인후과</label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-8">
        <label class="category" for="opt-8">신경과 </label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-9">
        <label class="category" for="opt-9">소화기내과 </label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-10">
        <label class="category" for="opt-10">호흡기내과 </label>
      </div>
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-11">
        <label class="category" for="opt-11">피부과 </label>
      </div>
    </div>
    <div class="tasks-wrapper">
    <!-- 외과 -->
      <div class="task">
        <input class="task-item" name="task-gs" type="checkbox" id="item-1" >
        <label for="item-1">
          <span class="label-text">만성폐쇄성 폐질환</span>
        </label>
        <span class="tag approved">Approved</span>
      </div>
      <div class="task">
        <input class="task-item" name="task-gs" type="checkbox" id="item-2" >
        <label for="item-2">
          <span class="label-text">당뇨병</span>
        </label>
        <span class="tag progress">In Progress</span>
      </div>
      <div class="task">
        <input class="task-item" name="task-gs" type="checkbox" id="item-3">
        <label for="item-3">
          <span class="label-text">고혈압</span>
        </label>
        <span class="tag review">In Review</span>
      </div>
       <!-- 외과 끝-->
       <!-- 신경외과 -->
      <div class="task">
        <input class="task-item" name="task-ns" type="checkbox" id="item-4">
        <label for="item-4">
          <span class="label-text">천식</span>
        </label>
        <span class="tag progress">In Progress</span>
      </div>
        <!-- 신경외과 끝 -->
      <!-- 정형외과 -->
      <div class="task" >
        <input class="task-item" name="task-os" type="checkbox" id="item-5">
        <label for="item-5">
          <span class="label-text">치매</span>
        </label>
        <span class="tag approved">Approved</span>
      </div>
      <div class="task">
        <input class="task-item" name="task-os" type="checkbox" id="item-6">
        <label for="item-6" >
          <span class="label-text">골관절염</span>
        </label>
        <span class="tag review">In Review</span>
      </div>
      <!-- 정형외과 끝 -->
      <!-- 비뇨 기과 -->
        <div class="task">
        <input class="task-item" name="task-uro" type="checkbox" id="item-7">
        <label for="item-7">
          <span class="label-text">심장</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 비뇨 기과 끝 -->
      <!-- 정신과 -->
      <div class="task">
        <input class="task-item" name="task-np" type="checkbox" id="item-8">
        <label for="item-8">
          <span class="label-text">암</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 정신과 끝 -->
      <!-- 이비인후과 -->
      <div class="task">
        <input class="task-item" name="task-ent" type="checkbox" id="item-9">
        <label for="item-9">
          <span class="label-text">질병</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 이비인후과 끝 -->
      <!-- 신경과 -->
     <div class="task">
        <input class="task-item" name="task-nr" type="checkbox" id="item-9">
        <label for="item-9">
          <span class="label-text">질병</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 신경과 끝 -->
       <!-- 소화기내과  -->
      <div class="task">
        <input class="task-item" name="task-gi" type="checkbox" id="item-9">
        <label for="item-9">
          <span class="label-text">질병</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 소화기내과  끝 -->
       <!-- 호흡기내과 -->
      <div class="task">
        <input class="task-item" name="task-p" type="checkbox" id="item-9">
        <label for="item-9">
          <span class="label-text">질병</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 호흡기내과 끝 -->
       <!-- 피부과  -->
      <div class="task">
        <input class="task-item" name="task-der" type="checkbox" id="item-9">
        <label for="item-9">
          <span class="label-text">질병</span>
        </label>
        <span class="tag waiting">Waiting</span>
      </div>
      <!-- 피부과  끝 -->
      
      <div class="header upcoming">Upcoming Tasks</div>
    
    </div>
  </div>
  <div class="right-bar">
    <div class="top-part">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
        class="feather feather-users" onclick="save();">
        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
        <circle cx="9" cy="7" r="4" />
        <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
        <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
      <div class="count">6</div>
    </div>
    <div class="header">Schedule</div>
    <div class="right-content">
      <div class="task-box yellow">
        <div class="description-task">
          <div class="time">11:00 - 12:00 PM</div>
          <div class="task-name">기본</div>
        </div>
        <div class="glyphicon glyphicon-remove more-button"></div>
        <div class="members">
          
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<script>

</script>




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>