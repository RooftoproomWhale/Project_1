<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.map_wrap {margin-top: 80px}
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 10px;height: 75px;}
    .desc .addr {overflow: hidden;text-overflow: addr;white-space: nowrap;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<div class="map_wrap">
	<div id="map" style="width: 100%; height: 90vh;"></div>
</div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12d8eede943e602b615bb4e2dc8e5e30&libraries=services,clusterer,drawing"></script>
<script>
	var markers = [];
	var overlays = [];
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
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
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
	    storesByGeo(latlng.getLat(),latlng.getLng());
	});
	kakao.maps.event.addListener(map, 'zoom_changed', function() {
		// 지도의  레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    console.log(level);
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
		navigator.geolocation.getCurrentPosition(function(position) {
	
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
		function storesByGeo(latitude,longitude)
		{
			
			$.get("https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat="+latitude+"&lng="+longitude,function(data){
				
				console.log(data);
				console.log(data.stores[0].lat);
				
				console.log("위치에 따른 마커 적용 전 마커 길이",markers.length);
				for (var i = 0; i < data.count; i++)
				{
					
					var marker = new kakao.maps.Marker({
						//map : map,
						position : new kakao.maps.LatLng(data.stores[i].lat, data.stores[i].lng)
					});
					
					var content =  '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		           						 data.stores[i].name + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="desc">' + 
		            '                <div class="addr">'+data.stores[i].addr+'</div>' + 
		            '                <div>'+data.stores[i].remain_stat+'</div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';
					
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    position: marker.getPosition()       
					});
					
					kakao.maps.event.addListener(marker, 'click', makeOverListener(map, overlay));
				    //kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(overlay));
					
				   
				    
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
					
				}
				console.log("중복처리후 마커배열",markers);
				console.log("맵",map);
			});
			
		}
		function makeOverListener(map, overlay) {
		    return function() {
		    	overlay.setMap(map);
		    	overlays.push(overlay);
		    };
		}
	
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(overlay) {
		    return function() {
		    	overlay.setMap(null);
		    };
		}
		
		
	}
</script>