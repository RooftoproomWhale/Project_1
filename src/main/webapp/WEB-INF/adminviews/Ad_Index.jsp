<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script>
$(function() {
	
	$.ajax({
	      url:"<c:url value='/Admin/Counts.hst'/>",
	      type:'get',
	      datatype:'json',
	      data:{},
	      beforeSend: function () {
	         console.log("beforeSend");
//	          FunLoadingBarStart();
	      },
	      complete: function () {
	         console.log("complete");
//	          FunLoadingBarEnd();
	      },
	      success:function(data){
	    	  console.log("성공", data);
	    	  
	      },
	      error:function(request,status,error){
				console.log("연결 실패");
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			} 
	       
	    });
	
	$.ajax({
	    url:"<c:url value='/Admin/RecentChart.hst'/>",
	    type:'get',
	    datatype:'html',
	    data:{},
	    beforeSend: function () {
	       console.log("beforeSend");
//	        FunLoadingBarStart();
	    },
	    complete: function () {
	       console.log("complete");
//	        FunLoadingBarEnd();
	    },
	    success:function(data){
//	        console.log(data);
	       console.log("연결성공", typeof(data));
	       try {
	    	   	var janMemCount = $('#janMemCount').val();
	    	   	var febMemCount = $('#febMemCount').val();
	    	   	var marMemCount = $('#marMemCount').val();
	    	   	var aprMemCount = $('#aprMemCount').val();
	    	   	var mayMemCount = $('#mayMemCount').val();
	    	   	var junMemCount = $('#junMemCount').val();
	    	   	var julMemCount = $('#julMemCount').val();
	    	   	
	    	   	var janAptCount = $('#janAptCount').val();
	    	   	var febAptCount = $('#febAptCount').val();
	    	   	var marAptCount = $('#marAptCount').val();
	    	   	var aprAptCount = $('#aprAptCount').val();
	    	   	var mayAptCount = $('#mayAptCount').val();
	    	   	var junAptCount = $('#junAptCount').val();
	    	   	var julAptCount = $('#julAptCount').val();
	    	    // Recent Report 2
	    	    const bd_brandProduct2 = 'rgba(0,181,233,0.9)'
	    	    const bd_brandService2 = 'rgba(0,173,95,0.9)'
	    	    const brandProduct2 = 'rgba(0,181,233,0.2)'
	    	    const brandService2 = 'rgba(0,173,95,0.2)'

	    	    var data3 = [janMemCount, febMemCount, marMemCount, aprMemCount, mayMemCount, junMemCount, julMemCount, ""]
	    	    var data4 = [janAptCount, febAptCount, marAptCount, aprAptCount, mayAptCount, junAptCount, julAptCount, ""]

	    	    var ctx = document.getElementById("recentChart");
	    	    if (ctx) {
	    	      ctx.height = 230;
	    	      var myChart = new Chart(ctx, {
	    	        type: 'line',
	    	        data: {
	    	          labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', ''],
	    	          datasets: [
	    	            {
	    	              label: '예약 수',
	    	              backgroundColor: brandService2,
	    	              borderColor: bd_brandService2,
	    	              pointHoverBackgroundColor: '#fff',
	    	              borderWidth: 0,
	    	              data: data3
	    	            },
	    	            {
	    	              label: '회원 수',
	    	              backgroundColor: brandProduct2,
	    	              borderColor: bd_brandProduct2,
	    	              pointHoverBackgroundColor: '#fff',
	    	              borderWidth: 0,
	    	              data: data4
	    	            }
	    	          ]
	    	        },
	    	        options: {
	    	          maintainAspectRatio: true,
	    	          legend: {
	    	            display: false
	    	          },
	    	          responsive: true,
	    	          scales: {
	    	            xAxes: [{
	    	              gridLines: {
	    	                drawOnChartArea: true,
	    	                color: '#f2f2f2'
	    	              },
	    	              ticks: {
	    	                fontFamily: "Poppins",
	    	                fontSize: 12
	    	              }
	    	            }],
	    	            yAxes: [{
	    	              ticks: {
	    	                beginAtZero: true,
	    	                maxTicksLimit: 1,
	    	                stepSize: 10,
	    	                max: 50,
	    	                fontFamily: "Poppins",
	    	                fontSize: 12
	    	              },
	    	              gridLines: {
	    	                display: true,
	    	                color: '#f2f2f2'
	    	              }
	    	            }]
	    	          },
	    	          elements: {
	    	            point: {
	    	              radius: 0,
	    	              hitRadius: 10,
	    	              hoverRadius: 4,
	    	              hoverBorderWidth: 3
	    	            },
	    	            line: {
	    	              tension: 0
	    	            }
	    	          }
	    	        }
	    	      });
	    	    }
	    	  } catch (error) {
	    	    console.log(error);
	    	  }
	    }
	});
	
	//Age Chart
	$.ajax({
	    url:"<c:url value='/Admin/AgeChart.hst'/>",
	    type:'get',
	    datatype:'html',
	    data:{},
	    beforeSend: function () {
	       console.log("beforeSend");
//	        FunLoadingBarStart();
	    },
	    complete: function () {
	       console.log("complete");
//	        FunLoadingBarEnd();
	    },
	    success:function(data){
//	        console.log(data);
	       console.log("연결성공", typeof(data));
	       try {
	    	    //pie chart
	    	    var ctx = document.getElementById("ageChart");
	    	    var under10 = $('#under10').val();
	    	    var over10under20 = $('#over10under20').val();
	    	    var over20under30 = $('#over20under30').val();
	    	    var over30under40 = $('#over30under40').val();
	    	    var over40under50 = $('#over40under50').val();
	    	    var over50under60 = $('#over50under60').val();
	    	    var over60 = $('#over60').val();
	    	    if (ctx) {
	    	      ctx.height = 200;
	    	      var myChart = new Chart(ctx, {
	    	        type: 'pie',
	    	        data: {
	    	          datasets: [{
	    	            data: [under10, over10under20, over20under30, over30under40, over40under50, over50under60, over60],
	    	            backgroundColor: [
	    	              "rgba(0, 123, 255,0.9)",
	    	              "rgba(0, 123, 255,0.8)",
	    	              "rgba(0, 123, 255,0.7)",
	    	              "rgba(0, 123, 255,0.6)",
	    	              "rgba(0, 123, 255,0.5)",
	    	              "rgba(0, 123, 255,0.4)",
	    	              "rgba(0, 123, 255,0.3)",
	    	              "rgba(0,0,0,0.07)"
	    	            ],
	    	            hoverBackgroundColor: [
	    	              "rgba(0, 123, 255,0.9)",
	    	              "rgba(0, 123, 255,0.7)",
	    	              "rgba(0, 123, 255,0.5)",
	    	              "rgba(0,0,0,0.07)"
	    	            ]
	    	          }],
	    	          labels: [
	    	            "10세 이하",
	    	            "10대",
	    	            "20대",
	    	            "30대",
	    	            "40대",
	    	            "50대",
	    	            "60세 이상"
	    	          ]
	    	        },
	    	        options: {
	    	          legend: {
	    	            position: 'top',
	    	            labels: {
	    	              fontFamily: 'Poppins'
	    	            }
	    	          },
	    	          responsive: true
	    	        }
	    	      });
	    	    }
	    	  } catch (error) {
	    	    console.log(error);
	    	  }
	    }
	});
});
</script>

<body class="animsition">
    <div class="page-wrapper">
        <!-- PAGE CONTAINER-->
        <div class="page-container2">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop2">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap2">
                            <div class="header-button2">
                                <div class="header-button-item has-noti js-item-menu">
                                    <i class="zmdi zmdi-notifications"></i>
                                    <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__title">
                                            <p>You have 3 Notifications</p>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 img-cir img-40">
                                                <i class="zmdi zmdi-email-open"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a email notification</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c2 img-cir img-40">
                                                <i class="zmdi zmdi-account-box"></i>
                                            </div>
                                            <div class="content">
                                                <p>Your account has been blocked</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c3 img-cir img-40">
                                                <i class="zmdi zmdi-file-text"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a new file</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__footer">
                                            <a href="#">All notifications</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- END HEADER DESKTOP-->

            <!-- BREADCRUMB-->
            <section class="au-breadcrumb m-t-75">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                            <div class="overview-wrap">
                                    <h2 class="title-1">overview</h2>
                                    <button class="au-btn au-btn-icon au-btn--blue" onClick="location.href='<c:url value='/Admin/NoticeWrite.hst'/>'">
                                        <i class="zmdi zmdi-plus"></i>공지작성</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END BREADCRUMB-->

            <!-- STATISTIC-->
            <section class="statistic">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number">${memberCount }</h2>
                                    <span class="desc">members</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number">${hospCount }</h2>
                                    <span class="desc">authorzied hospitals</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number">${presCount }</h2>
                                    <span class="desc">prescriptions</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number">${aptCount }</h2>
                                    <span class="desc">appointments</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-money"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END STATISTIC-->

            <section>
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- RECENT REPORT 2-->
                                <div class="recent-report2">
                                    <h3 class="title-3">Recent Increase</h3>
<!--                                     <div class="chart-info"> -->
<!--                                         <div class="chart-info__left"> -->
<!--                                             <div class="chart-note"> -->
<!--                                                 <span class="dot dot--blue"></span> -->
<!--                                                 <span>Members</span> -->
<!--                                             </div> -->
<!--                                             <div class="chart-note"> -->
<!--                                                 <span class="dot dot--green"></span> -->
<!--                                                 <span>Appointments</span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    <div class="recent-report__chart">
                                    <input type="hidden" value="${janMemCount }" id="janMemCount"/>
                                    <input type="hidden" value="${febMemCount }" id="febMemCount"/>
                                    <input type="hidden" value="${marMemCount }" id="marMemCount"/>
                                    <input type="hidden" value="${aprMemCount }" id="aprMemCount"/>
                                    <input type="hidden" value="${mayMemCount }" id="mayMemCount"/>
                                    <input type="hidden" value="${junMemCount }" id="junMemCount"/>
                                    <input type="hidden" value="${julMemCount }" id="julMemCount"/>
                                    
                                    <input type="hidden" value="${janAptCount }" id="janAptCount"/>
                                    <input type="hidden" value="${febAptCount }" id="febAptCount"/>
                                    <input type="hidden" value="${marAptCount }" id="marAptCount"/>
                                    <input type="hidden" value="${aprAptCount }" id="aprAptCount"/>
                                    <input type="hidden" value="${mayAptCount }" id="mayAptCount"/>
                                    <input type="hidden" value="${junAptCount }" id="junAptCount"/>
                                    <input type="hidden" value="${julAptCount }" id="julAptCount"/>
                                        <canvas id="recentChart"></canvas>
                                    </div>
                                </div>
                                <!-- END RECENT REPORT 2             -->
                            </div>
                            
                        </div>
                    </div>
                </div>
            </section>

            <section>
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6">
                            	<div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Using Times</h3>
                                        <canvas id="lineChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                            	<div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">User Groups</h3>
                                        <input type="hidden" value="${under10 }" id="under10"/>
                                        <input type="hidden" value="${over10under20 }" id="over10under20"/>
                                        <input type="hidden" value="${over20under30 }" id="over20under30"/>
                                        <input type="hidden" value="${over30under40 }" id="over30under40"/>
                                        <input type="hidden" value="${over40under50 }" id="over40under50"/>
                                        <input type="hidden" value="${over50under60 }" id="over50under60"/>
                                        <input type="hidden" value="${over60 }" id="over60"/>
                                        <canvas id="ageChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END PAGE CONTAINER-->
        </div>

    </div>
</body>

</html>
<!-- end document-->
