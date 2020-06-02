<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>



<style>
.korea-map-font-v1 {
	width: 600px;
	font-size: 600px;
	color: #D4F4FA;
}

.경기, .경북 {
	
}

.경남, .강원 {
	color: #d45b5b;
}

.충북 {
	color: #e8aeae;
}


</style>
<script>
	
			window.onload = function () {
				var chart = new CanvasJS.Chart("chartContainer1", {
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					exportEnabled: true,
					animationEnabled: true,
					backgroundColor: "#f6f6f6",
					title: {
						text: "시/도별 현황"
					},
					data: [{
						type: "pie",
						startAngle: 25,
						toolTipContent: "<b>{label}</b>: {y}%",
						showInLegend: "true",
						
						legendText: "{label}",
						indexLabelFontSize: 16,
						indexLabel: "{label} - {y}%",
						dataPoints: [
							{ y: 51.08, label: "대구" },
							{ y: 27.34, label: "서울" },
							{ y: 10.62, label: "경기" },
							{ y: 5.02, label: "경북" },
							{ y: 4.07, label: "기타" }
						]
					}]
				});
				chart.render();//핏자

				var chart = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					backgroundColor: "#f6f6f6",
					title:{
						text: "검사현황",
						horizontalAlign: "left"
					},
					data: [{
						type: "doughnut",
						startAngle: 60,
						//innerRadius: 60,
						indexLabelFontSize: 17,
						indexLabel: "{label} - #percent%",
						toolTipContent: "<b>{label}:</b> {y} (#percent%)",
						dataPoints: [
							{ y: 834952, label: "음성" },
							{ y: 11344, label: "양성(확진)" },
							{ y: 22370, label: "검사중"}
						]
					}]
				});
				chart.render();	//도넛

				function toggleDataSeries(e) {
					if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
						e.dataSeries.visible = false;
					} else {
						e.dataSeries.visible = true;
					}
					e.chart.render();
				}// 
				
				var options = {
						animationEnabled: true,
						theme: "light2",
						backgroundColor: "#f6f6f6",
						title:{
							text: "일별 확진자 추이"
						},
						axisX:{
							valueFormatString: "DD MMM"
						},
						axisY: {
							title: "Number of Sales",
							suffix: "K",
							minimum: 30
						},
						toolTip:{
							shared:true
						},  
						legend:{
							cursor:"pointer",
							verticalAlign: "bottom",
							horizontalAlign: "left",
							dockInsidePlotArea: true,
							itemclick: toogleDataSeries
						},
						data: [{
							type: "line",
							showInLegend: true,
							name: "Projected Sales",
							markerType: "square",
							xValueFormatString: "DD MMM, YYYY",
							color: "#F08080",
							yValueFormatString: "#,##0K",
							dataPoints: [
								{ x: new Date(2017, 10, 1), y: 63 },
								{ x: new Date(2017, 10, 2), y: 69 },
								{ x: new Date(2017, 10, 3), y: 65 },
								{ x: new Date(2017, 10, 4), y: 70 },
								{ x: new Date(2017, 10, 5), y: 71 },
								{ x: new Date(2017, 10, 6), y: 65 },
								{ x: new Date(2017, 10, 7), y: 73 },
								{ x: new Date(2017, 10, 8), y: 96 },
								{ x: new Date(2017, 10, 9), y: 84 },
								{ x: new Date(2017, 10, 10), y: 85 },
								{ x: new Date(2017, 10, 11), y: 86 },
								{ x: new Date(2017, 10, 12), y: 94 },
								{ x: new Date(2017, 10, 13), y: 97 },
								{ x: new Date(2017, 10, 14), y: 86 },
								{ x: new Date(2017, 10, 15), y: 89 }
							]
						}]
					};
					$("#chartContainer3").CanvasJSChart(options);

					function toogleDataSeries(e){
						if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
							e.dataSeries.visible = false;
						} else{
							e.dataSeries.visible = true;
						}
						e.chart.render();
					}
					var chart = new CanvasJS.Chart("chartContainer4", {
						animationEnabled: true,
						backgroundColor: "#f6f6f6",
						title: {
							text: "국가별"
						},
						axisX: {
							interval: 1
						},
						axisY: {
							title: "추이",
							scaleBreaks: {
								type: "wavy",
								customBreaks: [{
									startValue: 80,
									endValue: 210
									},
									{
										startValue: 230,
										endValue: 600
									}
							]}
						},
						data: [{
							type: "bar",
							toolTipContent: "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP",
							dataPoints: [
								{ label: "Israel", y: 17.8, gdp: 5.8, url: "israel.png" },
								{ label: "United Arab Emirates", y: 22.8, gdp: 5.7, url: "uae.png" },
								{ label: "Brazil", y: 22.8, gdp: 1.3, url: "brazil.png"},
								{ label: "Australia", y: 24.3, gdp: 2.0, url: "australia.png" },
								{ label: "South Korea", y: 36.8, gdp: 2.7, url: "skorea.png" },
								{ label: "Germany", y: 41.1, gdp: 1.2, url: "germany.png" },
								{ label: "Japan", y: 46.1, gdp: 1.0, url: "japan.png" },
								{ label: "United Kingdom", y: 48.3, gdp: 1.9, url: "uk.png" },
								{ label: "India", y: 55.9, gdp: 2.5, url: "india.png" },
								{ label: "Russia", y: 69.2, gdp: 5.3, url: "russia.png" },
								{ label: "China", y: 215.7, gdp: 1.9, url: "china.png" },
								{ label: "United States", y: 611.2, gdp: 3.3, url: "us.png" }
							]
						}]
					});
					chart.render();
			}//온로드
		
		
</script>
	<!-- 가로배치용 -->
	<div class="col-lg-5 col-lg-offset-2" style="padding-top: 100px; padding-bottom: 100px">
<div class="row">	
	<div id="chartContainer3" style="height: 300px; width: 500px; padding-bottom: 50px"></div>
</div>	
<div class="row">	
	<div id="chartContainer2" style="height: 300px; width: 500px; padding: 50px"></div>
</div>	
	
	</div>
<div class="col-lg-5 " style="padding-top: 100px; padding-bottom: 100px">
<div class="row">	
	<div id="chartContainer1" style="height: 300px; width: 500px;"></div>
</div>	
<div class="row" >
	<div id="chartContainer4" style="height: 300px; width: 500px; padding: 50px""></div>
</div>	

</div>