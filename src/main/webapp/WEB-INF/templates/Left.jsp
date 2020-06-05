<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
    <script src="<c:url value="/bootstrap/js/script.js"/>"></script>
    <script src="https://code.jquery.com/ui/1.12.3/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
    <style>
    *:hover{text-decoration: none;}
 .sidebar>li>a {
  
  display: block;
  width: 200px;			/* 메뉴 */
  text-align: center;
  line-height: 3.4;
  color: #fff;
  background-color: #2056ac;
  font-size: 15px;
  position: sticky;
}
 .sidebar>li>a:hover {
  
  display: block;
  width: 190px;			/* 메뉴 */
  text-align: center;
  line-height: 3.4;
  color: black;
  background-color: #fff;
  font-size: 15px;
  border: #2056ac;
  transition-duration: 0.4s;
  position: sticky;
}
.sidebar>li>a:first-child {
}
    </style>
    <script>
    
    </script>
<aside>
	<ul style="padding-top: 250px" class="sidebar">
	<li ><a href="#" style="border-radius: 0px 7px 0px 0px;">사이드1</a></li>
	<li><a href="#">사이드2</a></li>
	<li><a href="#">사이드3</a></li>
	<li><a href="#">사이드4</a></li>	
	<li><a href="#" style="border-radius: 0px 0px 7px 0px;">사이드5</a></li>	
	</ul>
</aside>