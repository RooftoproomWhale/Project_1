<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.map_wrap {margin-top: 80px;height: 100%;}
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px;height: 75px;}
    .desc .addr {overflow: hidden;text-overflow: addr;white-space: normal;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .modal { position: absolute; top: 30%;}
	.body_title {font-size: 24px;font-weight: bold;}
	.load_wrap {position: absolute; top: 50%; left: 50%; z-index: 1231234;transform: translate(-50%, -50%);display: flex;flex-direction: column;}
	.search {position: absolute;top:120px;left: 16px;z-index: 2;}
	.current {position: absolute;bottom: 30px;right: 10px;z-index: 2;}
	.refresh_map{position: absolute;bottom: 5px;right: 10px;z-index: 2;}
	.menu_wrap{left: 13px;bottom: 19px;text-align: center;position: absolute;z-index: 2;}
</style>
<div class="map_wrap">
	<div class="load_wrap">
		<img class="load_img" src="<c:url value='/images/mask_loader.gif'/>">
	</div>
	<div class="search">
		<input class="searchInput" id="searchAddress" placeholder="검색 버튼을 클릭해주세요" disabled>
		<button type="button" onclick="addressSearch()">검색</button>
	</div>
	<div class="current">
		<button type="button" onclick="currentPosition()">현재위치</button>
	</div>
	<div class="refresh_map">
		<button type="button" onclick="refreshMap()">갱신</button>
	</div>
	<div class="menu_wrap">
		<button type="button" onclick="changeApi(0)">병원</button>
		<button type="button" onclick="changeApi(1)">약국</button>
		<button type="button" onclick="changeApi(2)">공적마스크</button>
		<button type="button" onclick="changeApi(3)">코로나 확진자 동선</button>
	</div>
	<div id="map" style="width: 100%; height: 100%;position: relative;overflow: hidden;"></div>
</div>
<div class="modal fade" id="maskInfo-modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="body_title"></div>
				<div class="body_content">
					<div class="content_type"></div>
					<div class="content_addr"></div>
					<div class="content_stock"></div>
					<div class="content_stock_count"></div>
					<div class="content_stock_at"></div>
					<div class="content_created_at"></div>
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12d8eede943e602b615bb4e2dc8e5e30&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	lat, lon,
	mapOption = {
		center : new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
		level : 3, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP
	// 지도종류
	};
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var geocoder = new kakao.maps.services.Geocoder();
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	var apiStatus = 2; // 0:병원, 1: 약국, 2: 공적마스크, 3: 확진자 동선
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	kakao.maps.event.addListener(map, 'dragend', function() {
		// 지도의  레벨을 얻어옵니다
	    var level = map.getLevel();
	
	    // 지도의 중심좌표를 얻어옵니다 
	    var latlng = map.getCenter(); 
	    
	    var bound = map.getBounds();
	    
	    console.log("마커길이(드래그)",markers.length);
	    for (var i = 0; i<markers.length; i++)
	    {
	    	console.log(bound.contain(markers[i].getPosition()),markers[i]);
	    	if(!bound.contain(markers[i].getPosition()))
	    	{
	    		markers[i].setMap(null);
	    		markers.splice(i, 1);
	    		
	    		console.log("지도밖 삭제처리",markers.length,markers);
	    	}
	    }
	   
	    console.log("지도레벨(드래그)",level);
	    console.log("위치(드래그)",latlng);
	    console.log("바운드(드래그)",bound);
	    //storesByGeo(latlng.getLat(),latlng.getLng());
	    loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);
	});
	
	kakao.maps.event.addListener(map, 'zoom_changed', function() {
		// 지도의  레벨을 얻어옵니다
	    var level = map.getLevel();
	    
		var latlng = map.getCenter(); 
	    
	    var bound = map.getBounds();
	    
	    removeMarker();
	    
	    
	    console.log("지도레벨(드래그)",level);
	    console.log("위치(드래그)",latlng);
	    console.log("바운드(드래그)",bound);
	    //storesByGeo(latlng.getLat(),latlng.getLng());
	    loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);
	});
	
	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
		map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		minLevel : 10
	// 클러스터 할 최소 지도 레벨 
	});
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		currentPosition()
	
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
	
			// 마커를 생성합니다
			var marker_present = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});
	
			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;
	
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});
	
			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker_present);
	
			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		
		/* function storesByGeo(latitude,longitude)
		{
			$.get("https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat="+latitude+"&lng="+longitude,function(data){
				console.log("https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat="+latitude+"&lng="+longitude);
				console.log(data.stores);
				var markers = $(data.stores).map(function(i, position) {
					return new kakao.maps.Marker({
		                position : new kakao.maps.LatLng(position.lat, position.lng),
		            	title : position.name
		            });
				});
				clusterer.addMarkers(markers);
			});
		} */
		function loadMapApi(latitude,longitude,status)
		{
			console.log('API 상태',status);
			switch (status) {
			case 0:
				loadHospital(latitude,longitude);
				break;
			case 1:
				loadPharmacy(latitude,longitude);
				break;
			case 2:
				storesByGeo(latitude,longitude);
				break;
			default:
				
				break;
			}
		}
		function loadHospital(latitude,longitude)
		{
			$.ajax({
				url:"<c:url value='/Homespital/Map/Hospital.hst'/>",
				type:'get',
				datatype:'json',
				data:{"lat":latitude,"lng":longitude},
				beforeSend: function () {
					console.log("beforeSend");
					FunLoadingBarStart();
				},
				complete: function () {
					console.log("complete");
					FunLoadingBarEnd();
				},
				success:function(data){
					var jsonData = JSON.parse(data);
					console.log("연결성공", jsonData.response.body,typeof(jsonData));
				},
				error:function(e){
					
				}
			});
		}
		function loadPharmacy(latitude,longitude)
		{
			$.ajax({
				url:"<c:url value='/Homespital/Map/Pharmacy.hst'/>",
				type:'get',
				datatype:'json',
				data:{"lat":latitude,"lng":longitude},
				beforeSend: function () {
					console.log("beforeSend");
					FunLoadingBarStart();
				},
				complete: function () {
					console.log("complete");
					FunLoadingBarEnd();
				},
				success:function(data){
					var jsonData = JSON.parse(data);
					console.log("연결성공", jsonData.response.body,typeof(jsonData));
				},
				error:function(e){
					
				}
			});
		}
		function storesByGeo(latitude,longitude)
		{
			$.ajax({
				url:"<c:url value='/Homespital/Map/Mask.hst'/>",
				type:'get',
				datatype:'json',
				data:{"lat":latitude,"lng":longitude},
				beforeSend: function () {
					console.log("beforeSend");
					FunLoadingBarStart();
				},
				complete: function () {
					console.log("complete");
					FunLoadingBarEnd();
				},
				success:function(data){
					var jsonData = JSON.parse(data)
					console.log("연결성공", jsonData,typeof(jsonData));
					$.each(jsonData.stores, function(i, item) {
						var marker = new kakao.maps.Marker({
							//map : map,
							position : new kakao.maps.LatLng(item.lat, item.lng)
						});
			            
						//kakao.maps.event.addListener(marker, 'click', makeOverListener(map));
						kakao.maps.event.addListener(marker, 'click', function(){
							console.log("modal",item,i)
							$('.body_title').html(item.name);
							$('.content_addr').html(item.addr);
							$('.content_stock').html(translateRemainStat(item.remain_stat));
							$('.content_stock_count').html(translateRemainStatCount(item.remain_stat));
							$('.content_type').html(translateType(item.type));
							$('.content_stock_at').html('입고시간:'+item.stock_at);
							$('.content_created_at').html('갱신시간:'+item.created_at);
							$('#maskInfo-modal').modal('show');
						});
					    
						var isSame = false;
						for (var j = 0; j < markers.length; j++)
						{
							console.log(marker.getPosition().equals(markers[j].getPosition()));
							//console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());
							//if(marker.getPosition().getLat() == markers[j].getLat())
							if(marker.getPosition().equals(markers[j].getPosition()))
							{
								isSame = true;
							}
							
						}
						
						if(!isSame)
						{
							console.log("마커배열길이",jsonData.count,markers.length);
							//if(data.count < markers.length)
							marker.setMap(map);
							console.log("중복이 아닌 마커",marker.getPosition());
							markers.push(marker);
							
						}
						else
						{
							console.log("중복 마커",marker.getPosition());
							//marker.setMap(null);
						}
					});
				},
				error:function(e){
					
				}
			});
			/* $.get("https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat="+latitude+"&lng="+longitude,function(data){
				console.log(data);
				console.log(data.stores[0].lat);
				
				console.log("위치에 따른 마커 적용 전 마커 길이",markers.length);
				$.each(data.stores, function(i, item) {
					var marker = new kakao.maps.Marker({
						//map : map,
						position : new kakao.maps.LatLng(item.lat, item.lng)
					});
		            
					//kakao.maps.event.addListener(marker, 'click', makeOverListener(map));
					kakao.maps.event.addListener(marker, 'click', function(){
						console.log("modal",item,i)
						$('.body_title').html(item.name);
						$('.content_addr').html(item.addr);
						$('.content_stock').html(translateRemainStat(item.remain_stat));
						$('.content_stock_count').html(translateRemainStatCount(item.remain_stat));
						$('.content_type').html(translateType(item.type));
						$('.content_stock_at').html('입고시간:'+item.stock_at);
						$('.content_created_at').html('갱신시간:'+item.created_at);
						$('#maskInfo-modal').modal('show');
					});
				    
					var isSame = false;
					for (var j = 0; j < markers.length; j++)
					{
						console.log(marker.getPosition().equals(markers[j].getPosition()));
						//console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());
						//if(marker.getPosition().getLat() == markers[j].getLat())
						if(marker.getPosition().equals(markers[j].getPosition()))
						{
							isSame = true;
						}
						
					}
					
					if(!isSame)
					{
						console.log("마커배열길이",data.count,markers.length);
						//if(data.count < markers.length)
						marker.setMap(map);
						console.log("중복이 아닌 마커",marker.getPosition());
						markers.push(marker);
						
					}
					else
					{
						console.log("중복 마커",marker.getPosition());
						//marker.setMap(null);
					}
				});
				
				console.log("중복처리후 마커배열",markers);
				console.log("맵",map);
			}) */
			
		}
		
		function translateType(type)
		{
			switch (type) {
			case "01":
				return "약국"
			case "02":
				return "우체국"
			default:
				return "농협"
			}
		}
		
		function translateRemainStat(remain_stat)
		{
			switch (remain_stat) {
			case "plenty":
				return "충분"
			case "some":
				return "보통"
			case "few":
				return "부족"
			case "empty":
				return "재고x"
			default:
				return "판매X"
			}
		}
		function translateRemainStatCount(remain_stat)
		{
			switch (remain_stat) {
			case "plenty":
				return "100개 이상"
			case "some":
				return "30개 이상 100개미만"
			case "few":
				return "2개 이상 30개 미만"
			case "empty":
				return "1개 이하"
			default:
				return "판매중지"
			}
		}
		function addressSearch()
		{
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("searchAddress").value = addr;
	               
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === kakao.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new kakao.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        
	                        storesByGeo(result.y, result.x);
	                    }
	                });
	            }
	        }).open();
		}
		function currentPosition()
		{
			navigator.geolocation.getCurrentPosition(function(position) {

				removeMarker();
				lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
		
				console.log(lat);
				console.log(lon);
				storesByGeo(lat,lon);
				
				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
		
				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);
		
			});
		}
		function changeApi(status)
		{
			apiStatus = status;
			console.log('상태',apiStatus);
			refreshMap();
		}
		function refreshMap()
		{
			removeMarker();
			var latlng = map.getCenter(); 
			//storesByGeo(latlng.getLat(),latlng.getLng());
			loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);
		}
		function removeMarker()
		{
			for(var i = 0; i < markers.length; i++ )
			{
				markers[i].setMap(null);
			}
			markers = [];
		}
		function FunLoadingBarStart() {
			console.log($('.load_wrap'),$('.load_img'));
			$('.load_img').show();
		}
		function FunLoadingBarEnd() {
			$('.load_img').hide();
			
		}
	}

</script>