<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<style>

		<!--캐러셀 css-->
        /*jssor slider bullet skin 057 css*/
        .jssorb057 .i {position:absolute;cursor:pointer;}
        .jssorb057 .i .b {fill:none;stroke:#fff;stroke-width:2200;stroke-miterlimit:10;stroke-opacity:0.4;}
        .jssorb057 .i:hover .b {stroke-opacity:.7;}
        .jssorb057 .iav .b {stroke-opacity: 1;}
        .jssorb057 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 051 css*/
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
</style>
<script>
	window.onload = function(){
		Notification.requestPermission().then(function(result) {
			  console.log(result);
			});
		
		Notification.requestPermission();
		
		function askNotificationPermission() {
			  // 권한을 실제로 요구하는 함수
			  function handlePermission(permission) {
			    // 사용자의 응답에 관계 없이 크롬이 정보를 저장할 수 있도록 함
			    if(!('permission' in Notification)) {
			      Notification.permission = permission;
			    }

			    // 사용자 응답에 따라 단추를 보이거나 숨기도록 설정
			    if(Notification.permission === 'denied' || Notification.permission === 'default') {
			      notificationBtn.style.display = 'block';
			    } else {
			      notificationBtn.style.display = 'none';
			    }
			  }

			  // 브라우저가 알림을 지원하는지 확인
			  if (!('Notification' in window)) {
			    console.log("이 브라우저는 알림을 지원하지 않습니다.");
			  } else {
			    if(checkNotificationPromise()) {
			      Notification.requestPermission()
			      .then((permission) => {
			        handlePermission(permission);
			      })
			    } else {
			      Notification.requestPermission(function(permission) {
			        handlePermission(permission);
			      });
			    }
			  }
			}
		
		function checkNotificationPromise() {
		    try {
		      Notification.requestPermission().then();
		    } catch(e) {
		      return false;
		    }

		    return true;
		  }
		
		//web notification 설정
		var icon = '../img/logo.png';
		var userRole = $('#userRole').val();
		var userId = $('#userId').val();
		var preAptCount = 0;
		
	
		console.log("id: " + userId +"type:"+ typeof(userId));
		console.log("role: " + userRole +"type:"+ typeof(userRole));
		
		if(userRole == "MEM")
		{
			var date = new Date();
			var currHour = date.getHours().toString();
			var currMin = (date.getMinutes()<10?'0':'') + date.getMinutes();
			var currTime = parseInt(currHour) * 60 + parseInt(currMin);
			
			$.ajax({
				url:'<c:url value="/Noti/getMediTime.hst"/>',
				dataType:'json',
				success:function(data){
					console.log("멤버 성공")
					console.log(data);
					console.log("현재시간: " + currTime);
					$.each(data, function(i, item) {
			             console.log(item.alarm);
			             var takeTime = item.alarm;
			             console.log("takeTime: " + takeTime);
			             var hour = takeTime.substring(0, 2);
			             var min = takeTime.substring(2, 4);
			             var time = parseInt(hour) * 60 + parseInt(min);
			             console.log("time: " + time);
			             timeGap = time - currTime;
			             console.log("gap: " + timeGap);
			             if(timeGap > 0 && timeGap <= 30)
			             {
			            	 memNoti();
								return false;
			             }
			         })
					},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
			
			window.setInterval(function(){
				date = new Date();
				currHour = date.getHours().toString();
				currMin = (date.getMinutes()<10?'0':'') + date.getMinutes();
				currTime = parseInt(currHour) * 60 + parseInt(currMin);
				
				$.ajax({
					url:'<c:url value="/Noti/getMediTime.hst"/>',
					dataType:'json',
					success:function(data){
						console.log("멤버 성공")
						console.log(data);
						console.log("현재시간: " + currTime);
						$.each(data, function(i, item) {
				             console.log(item.alarm);
				             var takeTime = item.alarm;
				             console.log("takeTime: " + takeTime);
				             var hour = takeTime.substring(0, 2);
				             var min = takeTime.substring(2, 4);
				             var time = parseInt(hour) * 60 + parseInt(min);
				             console.log("time: " + time);
				             timeGap = time - currTime;
				             console.log("gap: " + timeGap);
				             if(timeGap == 30)
				             {
				            	 memNoti();
									return false;
				             }
				         })
						},
					error:function(request,error){
						console.log('에러:',error);
					}
				});
			}, 60000);
		}
		else if(userRole == "HOS")
		{
			$.ajax({
				url:'<c:url value="/Noti/dayAptCount.hst"/>',
				dataType:'html',
				success:function(data){
						console.log("병원 성공");
						console.log("오늘 예약 수: " + data);
							hosNotiDay(data);
						},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
			
			$.ajax({
				url:'<c:url value="/Noti/preAptCount.hst"/>',
				dataType:'html',
				success:function(data){
						console.log("성공");
//	 					console.log("로드 예약 수: " + data);
						preAptCount = data;
					},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
			
			window.setInterval(function(){
				
				$.ajax({
					url:'<c:url value="/Noti/hosAptGap.hst"/>',
					dataType:'html',
					success:function(data){
							console.log("병원 성공");
							console.log("현재 예약 수: " + data);
							if(data - preAptCount != 0 )
							{
								console.log(data - preAptCount);
								gapCount = data - preAptCount;
								hosNoti(gapCount);
								preAptCount = data;
							}
						},
					error:function(request,error){
						console.log('에러:',error);
					}
				});
			}, 5000);
		}
		else
		{
			
		}
	
		var text;
		function memNoti() {
			text = '30분 안에 복용 해야할 약이 있습니다';
			var options = 
				{
				      body: text,
				      icon: icon
			  	}
				var noti = new Notification('복약 알림이 있습니다', options)
				
				noti.onclick = function(event) {
					console.log('noti click');
					window.location.href = "<c:url value='/mypage/administration.hst'/>";
				};
			}
		
		function hosNoti(count) {
			text = count + '개의 새로운 예약이 있습니다';
			console.log(text);
			var options = 
				{
				      body: text,
				      icon: icon
			  	}
				var noti = new Notification('예약 알림이 있습니다', options)
				
				noti.onclick = function(event) {
					console.log('noti click');
					window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
				};
			}
		
		function hosNotiDay(count) {
			text = '오늘 ' + count + '개의 예약이 있습니다';
			console.log(text);
			var options = 
				{
				      body: text,
				      icon: icon
			  	}
				var noti = new Notification('예약 알림이 있습니다', options)
				
				noti.onclick = function(event) {
					console.log('noti click');
					window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
				};
			}
		
	}
</script>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Interact</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- 캐러셀에 필요 -->
<script type="text/javascript" src="<c:url value="/js/jssor.slider-28.0.0.min.js"/>" ></script>

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<input type="hidden" id="userId" value="${user }"/>
<input type="hidden" id="userRole" value="${role }"/>
<%-- <input type="hidden" id="preAptCount" value="${preAptCount }"/> --%>
	<!-- Header -->
	<header id="header">
		<div class="intro">
			<div class="overlay">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 intro-text">
							<h1> We Are Interact ${currAptCount}</h1>
							<p style="font-weight: bold;">컴퓨터와 스마트폰으로 병원 예약 및 복약 관리를 손쉽게 하세요!</p>
							<a href="#" id="notiTest" class="btn btn-custom btn-lg page-scroll"><span style="font-weight: bold; font-size: 16px;">이용하기</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container-fluid">
		<div class="row" style="padding-top: 50px">
			<div class="col-md-5 col-md-offset-1 col-sm-12">
				<div id="jssor_1"
					style="position: relative; margin-top: 10px; margin-bottom: 50px; top: 0px; left: 0px; width: 680px; height: 380px; overflow: hidden; visibility: hidden; "
					align="left">

					<!-- Loading Screen -->
					<div class="img-thumbnail" data-u="slides"
						style="cursor: default; position: relative; top: 0px; left: 0px; width: 680px; height: 380px; overflow: hidden;">
						<div data-p="680">
							<a href="/Covid/status.hst"><img data-u="image"
								src="<c:url value="/img/1.jpg"/>" /></a>
						</div>
						<div data-p="680">
							<a href="/corona/Corona_Mask.hst"><img data-u="image"
								src='<c:url value="/img/2.jpg"/>' /></a>
						</div>
						<div data-p="680">
							<a href="/corona/Corona_Patient.hst"><img data-u="image"
								src="<c:url value="/img/3.jpg"/>" /></a>
						</div>
						<div data-p="680">
							<a href="/prev/Season.hst"><img data-u="image"
								src="<c:url value="/img/about.jpg"/>" /></a>
						</div>
					</div>
					<!-- Bullet Navigator -->
					<div data-u="navigator" class="jssorb057"
						style="position: absolute; bottom: 16px; right: 16px;"
						data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
						<div data-u="prototype" class="i"
							style="width: 14px; height: 14px;">
							<svg viewbox="0 0 16000 16000"
								style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                    <circle class="b" cx="8000" cy="8000" r="5000"
									fill="red"></circle>
                </svg>
						</div>
					</div>
					<!-- Arrow Navigator -->
					<div data-u="arrowleft" class="jssora051"
						style="width: 65px; height: 65px; top: 0px; left: 25px;"
						data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
						<svg viewbox="0 0 16000 16000"
							style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <polyline class="a"
								points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
					</div>
					<div data-u="arrowright" class="jssora051"
						style="width: 65px; height: 65px; top: 0px; right: 25px;"
						data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
						<svg viewbox="0 0 16000 16000"
							style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <polyline class="a"
								points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
					</div>
				</div>
			</div>
			<!-- Issue Section -->
			<div class="col-md-5 col-md-offset-1 col-sm-12" style="">
				<div class="row" style="margin-bottom: 14px">
					<span style="color: #000000; font-size: 20pt; font-weight: bold;">코로나 속보</span>
				</div>
				<div class="row" id="news" style="font-size: 12pt; padding-bottom: 20px;"></div>
			</div>
		</div>
	


	<!-- Services Section -->
	<div id="services" class="text-center">
		<div class="container">
			<div class="section-title">
				<h2>Our Services</h2>
				<p>홈스피탈에서 제공 하는 서비스</p>
			</div>
			<div class="row">
				<div class="col-md-4" style="cursor: pointer"  
					onclick="location.href='<c:url value='/Homespital/Map.hst'/>'">
					<i class="fa fa-plus-square"></i>
					<div class="service-desc">
						<h3>약국 찾기</h3>
						<p>현 위치 중심으로 공적 마스크 및 약국 찾기 서비스</p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer"
					onclick="location.href='<c:url value='/Homespital/Map.hst'/>'">
					<i class="fa fa-hospital-o"></i>
					<div class="service-desc">
						<h3>병원 찾기</h3>
						<p>현 위치 중심으로  병원 위치 찾기 서비스 </p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer" onclick="location.href='<c:url value='/mypage/administration.hst'/>'">
					<i class="fa fa-medkit"></i>
					<div class="service-desc">
						<h3>복약 관리</h3>
						<p>현재 복용 중인 약에 관해 상세히 알아 볼 수 있는 서비스</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4" style="cursor: pointer"
					onclick="location.href='<c:url value='/Homespital/Health_info.hst'/>'">
					<i class="fa fa-language"></i>
					<div class="service-desc">
						<h3>예방 정보</h3>
						<p>시즌별 주의 해야 할 예방 정보 서비스</p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer" onclick="location.href='<c:url value='/Calendar/calendar.hst'/>'">
					<i class="fa fa-calendar"></i>
					<div class="service-desc">
						<h3>일정 관리</h3>
						<p>복용 알림 서비스 및 해당 병원 예약 서비스</p>
					</div>
				</div>

				<div class="col-md-4" style="cursor: pointer" onclick="location.href='<c:url value='/Covid/View.hst'/>'">

					<i class="fa fa-pie-chart"></i>
					<div class="service-desc">
						<h3>코로나 현황</h3>
						<p>각 국가별 코로나 현황 및 국내 (시/도) 코로나 현황 서비스</p>
					</div>
					<table>
						<tr style="border: thin; border-color: aqua;">
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	$(function(){
		showNews();	
		
		setInterval(() => {
			showNews();	
		}, 60000);
	
		function showNews(){
			
			$.ajax({
				/* url:"<c:url value='/News'/>",
				data:{"clientId":"GVe_m816Ap0X5nw8XFXQ","clientSecret":"6JAsTo47hF"},
				type:'get',
				dataType: "json",
				success:function(data){
					console.log(data);
					var news = "<table class='table' style='width:80%; border: 3px solid #0051ff'>";
					if(data.length==0){
						news+="<li>뉴스 데이터가 없습니다</li>";
					} 
					$.each(data.items, function(index, element) {
						console.log(element.title);
						news+="<tr><td><a href='"+element.originallink+"' target=_blank>"+element.title+"</a><td></tr>";
					});
					news+="</table>";
					
					$('#news').html(news);
				},
				error:function(e){console.log('에러:',e)} */
					url:"http://192.168.0.25:5001/covid/",
					type:'get',
					dataType:"json",
					success:function(data){
						var news = "<table class='table' style='width:80%; border: 3px solid #0051ff'>";
						if(data.length==0){
							news+="<li>뉴스 데이터가 없습니다</li>";
						} 
						$.each(data, function(index, element) {
							console.log(element)
							news+="<tr><td><a href='"+element.href+"' target=_blank>"+element.title+"</a><td></tr>";
						});
						news+="</table>";
						$('#news').html(news);
					},
					error:function(e){console.log('에러:',e)} 
			});			
		}
	});
</script>
</html>