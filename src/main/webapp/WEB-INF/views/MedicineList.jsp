<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
	padding-top: 100px;
}

hr {
	width: 100%;
	background-color: gray;
}

img {
	width: 531px;
	height: 300px;
}
</style>
<div class="container">
	<ul class="nav nav-tabs" role="tablist" id="myTab">
		<li role="presentation" class="active"><a href="#medi-1"
			role="tab" data-toggle="tab">해열/진통제</a></li>
		<li role="presentation"><a href="#medi-2" role="tab"
			data-toggle="tab">감기약</a></li>
		<li role="presentation"><a href="#medi-3" role="tab"
			data-toggle="tab">소화제</a></li>
		<li role="presentation"><a href="#medi-4" role="tab"
			data-toggle="tab">파스</a></li>
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="medi-1">
			<c:forEach items="${medi1}" var="medi">
				<div class="col-lg-6 mb-4">
					<div class="card h-100">
						<a href="#"><img id="${medi}"  class="card-img-top"
							src='<c:url value="/img/medicine/${medi}.jpg"/> ' /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a class="mediSelec" id="${medi}" href="#">${medi}</a>
							</h4>
							<p class="card-text"></p>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
		<div role="tabpanel" class="tab-pane" id="medi-2">
			<c:forEach items="${medi2}" var="medi">
				<div class="col-lg-6 mb-4">
					<div class="card h-100">
						<a href="#"><img id="${medi}" class="card-img-top"
							src='<c:url value="/img/medicine/${medi}.jpg"/> ' /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a class="mediSelec" id="${medi}" href="#">${medi}</a>
							</h4>
							<p class="card-text"></p>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
		<div role="tabpanel" class="tab-pane" id="medi-3">
			<c:forEach items="${medi3}" var="medi">
				<div class="col-lg-6 mb-4">
					<div class="card h-100">
						<a href="#"><img id="${medi}"  class="card-img-top"
							src='<c:url value="/img/medicine/${medi}.jpg"/> ' /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a class="mediSelec" id="${medi}" href="#">${medi}</a>
							</h4>
							<p class="card-text"></p>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
		<div role="tabpanel" class="tab-pane" id="medi-4">
			<c:forEach items="${medi4}" var="medi">
				<div class="col-lg-6 mb-4">
					<div class="card h-100">
						<a href="#"><img id="${medi}" class="card-img-top"
							src='<c:url value="/img/medicine/${medi}.jpg"/> ' /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a class="mediSelec" id="${medi}" href="#">${medi}</a>
							</h4>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--  
		<form>
				<input type="text" id="mediSearch" placeholder="검색할 약품명을 적어주세요">
				<button onclick="mediList();">검색</button>
				<div id="mediForm">
				</div>
			</form>
		-->
	</div>


</div>

<script>
	$(function() {
		$('#myTab a:first').tab('show')
	})
</script>
<script>

	$('img,.mediSelec').click(function(){
		var id = $(this).attr('id').replace('mg','밀리그람');
		console.log(id);
		$.ajax({
			url : '<c:url value="/Homespital/Medicine.hst"/>',
			type : 'get',
			data : { "search" : id },
			dataType : 'json',
			success : function(data) {
				var itemSeq='';
				if (data.length == 0) {
					itemSeq+='데이터가 없어요';
				}
				itemSeq=data.response.body.items.item['ITEM_SEQ'];
				console.log(itemSeq);
				var url = "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq="+itemSeq;
				var name = "약정보";
				var option = "width = 1300, height = 700, top = 100, left = 300, location = no";
				window.open(url, name, option);
			}
		});
	})

	function mediList() {
		var mediSearch = $('#mediSearch').val();
		if (mediSearch != null) {
			$.ajax({
				url : '<c:url value="/Homespital/Medicine.hst"/>',
				type : 'get',
				data : {
					"search" : mediSearch
				},
				dataType : 'json',
				success : function(data) {
					console.log("약품정보", data);
					var mediStr = '<ul>';
					if (data.length == 0) {
						mediStr += "<li>데이터가 없습니다</li>";
						return;
					}
					$.each(data.response.body.items.item, function(i, item) {
						console.log(i);
						console.log(item['ITEM_NAME']);
						var originName = item['ITEM_NAME'];
						var reName = originName.replace(/밀리그람/g, "mg");
						mediStr += "<li>제품명:" + reName + ",제조사:"
								+ item['ENTP_NAME'] + ",성상:" + item['CHART']
								+ "</li>"
					})
					mediStr += "</ul>"
					$('#mediForm').html(mediStr)
				}

			});

		}
	}

</script>
