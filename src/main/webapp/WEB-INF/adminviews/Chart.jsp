<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script>
//Recent Chart
$.ajax({
    url:"<c:url value='/Admin/RecentChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
       console.log("연결성공", typeof(data));
       try {
   	    //pie chart
   	    var ctx = document.getElementById("genderChart");
//    	    var male = document.getElementById("maleCount").value;
//    	   	var female = document.getElementById("femaleCount").value;
		var male= $('#maleCount').val();
		var female= $('#femaleCount').val();
   	   	console.log(genderChart + male + female);
   	    if (ctx) {
   	      ctx.height = 200;
   	      var myChart = new Chart(ctx, {
   	        type: 'pie',
   	        data: {
   	          datasets: [{
   	            data: [male, female],
   	            backgroundColor: [
   	              "rgba(0, 123, 255,0.9)",
   	              "rgba(255, 82, 122,0.7)"
   	            ],
   	            hoverBackgroundColor: [
   	              "rgba(0, 123, 255,0.9)",
   	              "rgba(255, 82, 122,0.7)"
   	            ]

   	          }],
   	          labels: [
   	            "남",
   	            "녀"
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

//Gender Chart
$.ajax({
    url:"<c:url value='/Admin/GenderChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
       console.log("연결성공", typeof(data));
       try {
   	    //pie chart
   	    var ctx = document.getElementById("genderChart");
//    	    var male = document.getElementById("maleCount").value;
//    	   	var female = document.getElementById("femaleCount").value;
		var male= $('#maleCount').val();
		var female= $('#femaleCount').val();
   	   	console.log(genderChart + male + female);
   	    if (ctx) {
   	      ctx.height = 200;
   	      var myChart = new Chart(ctx, {
   	        type: 'pie',
   	        data: {
   	          datasets: [{
   	            data: [male, female],
   	            backgroundColor: [
   	              "rgba(0, 123, 255,0.9)",
   	              "rgba(255, 82, 122,0.7)"
   	            ],
   	            hoverBackgroundColor: [
   	              "rgba(0, 123, 255,0.9)",
   	              "rgba(255, 82, 122,0.7)"
   	            ]

   	          }],
   	          labels: [
   	            "남",
   	            "녀"
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

//Age Chart
$.ajax({
    url:"<c:url value='/Admin/AgeChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
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
</script>
<body class="animsition">
    <div class="page-wrapper">
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- MAIN CONTENT-->
                <div class="section__content section__content--p30" style="padding-top: 50px">
                    <div class="container-fluid">
                    <div class="row">
                            <div class="col-xl-12">
                                <!-- RECENT REPORT 2-->
                                <div class="recent-report2">
                                    <h3 class="title-3">Recent Increase</h3>
                                    <div class="chart-info">
                                        <div class="chart-info__left">
                                            <div class="chart-note">
                                                <span class="dot dot--blue"></span>
                                                <span>Members</span>
                                            </div>
                                            <div class="chart-note">
                                                <span class="dot dot--green"></span>
                                                <span>Appointments</span>
                                            </div>
                                        </div>
                                        <div class="chart-info-right">
                                            <div class="rs-select2--dark rs-select2--md m-r-10">
                                                <select class="js-select2" name="property">
                                                    <option selected="selected">All Properties</option>
                                                    <option value="">Members</option>
                                                    <option value="">Appointments</option>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-report__chart">
                                        <canvas id="recent-rep2-chart"></canvas>
                                    </div>
                                </div>
                                <!-- END RECENT REPORT 2             -->
                            </div>
                            
                        </div>
                        <div class="row">
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Yearly Sales</h3> -->
<%--                                         <canvas id="sales-chart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Team Commits</h3> -->
<%--                                         <canvas id="team-chart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
							<div class="col-lg-6">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Appointment Counts</h3>
                                        <canvas id="singelBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Bar chart</h3> -->
<%--                                         <canvas id="barChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Rader chart</h3> -->
<%--                                         <canvas id="radarChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="col-lg-6">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Using Times</h3>
                                        <canvas id="lineChart"></canvas>
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Doughut Chart</h3> -->
<%--                                         <canvas id="doughutChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="col-lg-6">
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
                            <div class="col-lg-6">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Gender</h3>
                                        <input type="hidden" value="${male }" id="maleCount"/>
                                        <input type="hidden" value="${female }" id="femaleCount"/>
                                        <canvas id="genderChart"></canvas>
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Polar Chart</h3> -->
<%--                                         <canvas id="polarChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
</body>

</html>
<!-- end document-->
