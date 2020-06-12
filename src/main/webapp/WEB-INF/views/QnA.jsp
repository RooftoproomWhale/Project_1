<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: 0px;
	background-color: #474747;
	height: 150px
}
</style>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top: 88px">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: blue">Q&A</h2>
				</div>
				<p class="lead">회원님의 궁금증을 풀어드립니다.</p> <br />
				<table id="report" class="table table-striped" style="max-width: 1300px;">
					<tr>
						<th scope="col" class="" style="width: 20px; text-align: center;">번호</th>
						<th scope="col" class="" style="width: 80px; text-align: center;">제목</th>
						<th scope="col" class="" style="width: 80px; text-align: center;">작성자</th>
						<th scope="col" class="" style="width: 70px; text-align: center;">작성일자</th>
					</tr>
					<tr>
						<th scope="row" class="" style="text-align: center;">10</th>
						<td class="" style="text-align: center;">홈스피탈은 어떤 활용도입니까</td>
						<td class="" style="text-align: center;">윤승중</td>
						<td class="" style="text-align: center;">2020-06-10</td>
					</tr>
					<tr>
						<td colspan="5">
							<h4>답글</h4> Java는 뛰어난 객체 지향 특성과 플랫폼 독립성을 가진 프로그래밍 언어로 인터넷 기반의
							프로그램과 응용 프로그램 개발에 널리 사용되고 있다. 본 교과의 목적은 Java 언어의 기능과 특성을 이해하고 기초적
							Java 프로그래밍 기술을 익히는 것이다. 차후 Java 언어를 이용한 고급 프로그래밍 기술을 학습하려면 반드시
							수강하여야 한다. 선수과목은 객체지향 프로그래밍으로 객체지향 개념과 객체지향 언어의 기본 지식을 갖추고 있어야 한다.
							교재를 중심으로 Java 언어의 기초적 프로그래밍 기술을 이해하고 나아가 최신 기술들인 GUI, 입출력, 멀티스레딩,
							예외처리, 데이터베이스 연동 및 네트워크 프로그래밍 등의 내용을 학습하도록 한다. 예제로 주어지는 소스 코드를
							분석하며 실습 위주의 강의를 통해 학생 스스로 원리를 이해하고 문제를 풀고 응용할 수 있는 능력과 기회를 제공하도록
							한다.
							<div style="text-align: right; padding-top: 40px">
								<button class="btn btn-default" href="<c:url value="/Homespital/Notice.hst"/>">수정</button>
								<button class="btn btn-default">삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="" style="text-align: center;">9</th>
						<td class="" style="text-align: center;">홈스피탈은 어떤 활용도입니까</td>
						<td class="" style="text-align: center;">윤승중</td>
						<td class="" style="text-align: center;">2020-06-10</td>
					</tr>
					<tr>
						<td colspan="5">
							<h4>답글</h4> Java는 뛰어난 객체 지향 특성과 플랫폼 독립성을 가진 프로그래밍 언어로 인터넷 기반의
							프로그램과 응용 프로그램 개발에 널리 사용되고 있다. 본 교과의 목적은 Java 언어의 기능과 특성을 이해하고 기초적
							Java 프로그래밍 기술을 익히는 것이다. 차후 Java 언어를 이용한 고급 프로그래밍 기술을 학습하려면 반드시
							수강하여야 한다. 선수과목은 객체지향 프로그래밍으로 객체지향 개념과 객체지향 언어의 기본 지식을 갖추고 있어야 한다.
							교재를 중심으로 Java 언어의 기초적 프로그래밍 기술을 이해하고 나아가 최신 기술들인 GUI, 입출력, 멀티스레딩,
							예외처리, 데이터베이스 연동 및 네트워크 프로그래밍 등의 내용을 학습하도록 한다. 예제로 주어지는 소스 코드를
							분석하며 실습 위주의 강의를 통해 학생 스스로 원리를 이해하고 문제를 풀고 응용할 수 있는 능력과 기회를 제공하도록
							한다.
							<div style="text-align: right; padding-top: 40px">
								<button class="btn btn-default" href="<c:url value="/Homespital/Notice.hst"/>">수정</button>
								<button class="btn btn-default">삭제</button>
							</div>
						</td>
					</tr>
				</table>

				<br />
				<div style="text-align: right;">
					<a href="<c:url value='/QnA/QnAwrite.hst'/>" class="btn btn-primary float-right">글쓰기</a>
				</div>

				<div style="text-align: center;">
					<ul class="pagination">
						<li class="page-item"><span class="page-link">&laquo;</span></li>
						<li class="page-item"><a class="page-link mobile" href="#">1</a></li>
						<li class="page-item"><a class="page-link mobile" href="#">2</a></li>
						<li class="page-item"><a class="page-link mobile" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a> </li>
					</ul>
				</div>
				<!-- 검색용 UI -->
				<div class="row">
					<div class="text-center">
						<form class="form-inline" method="post" action="" style="margin-bottom: 20px;">
							<div class="form-group">
								<select name="searchColumn" class="form-control">
									<option value="title">제목</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" name="searchWord" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {

		$("#report tr:odd").addClass("odd");
		$("#report tr:not(.odd)").hide();
		$("#report tr:first-child").show(); //열머리글 보여주기

		$("#report tr.odd").click(function() {
			$(this).next("tr").toggle();
			$(this).find(".arrow").toggleClass("up");
		});
	});
</script>
</html>