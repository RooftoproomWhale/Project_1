<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Gender</h3>
                                        <canvas id="pieChart2"></canvas>
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
