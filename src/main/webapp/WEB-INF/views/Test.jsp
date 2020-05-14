<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
@charset "utf-8";
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

/*RESET*/
* { margin: 0; padding: 0; }
body { font: 17px 'Nanum Gothic', sans-serif; }
a { text-decoration: none; color: #404040; }
li { list-style: none; }

/*BODY*/
#nav {
    width: 100%;
}

#nav:after {
    content: "";
    display: block;
    clear: both;
}

.main {
    margin: 30px;
}

.main>li {
    position: relative;
    float: left;
    width: 210px;
    height: 30px;
    box-sizing: border-box;
    line-height: 30px;
    text-align: center;
    background: #ccc;
}

.main>li:hover .sub {
    /*display: block;*/
}

.main>li a {
    display: block;
    transition: all 0.3s;
}

.main>li a:hover {
    background: #009688;
    color: #fff;
}

.sub {
    display: none;
    position: absolute;
    top: 30px;
    left: 0;
    z-index: 1;
    width: 100%;
    background: #eee;
    opacity: 0.8;
}
</style>
<script>
$(document).ready(function(){
    $(".main>li").mouseover(function(){
        $(this).children(".sub").stop().slideDown(200);
    });
    $(".main>li").mouseleave(function(){
        $(this).children(".sub").stop().slideUp(200);
    });
});
</script>
<head>
    <meta charset="utf-8">
    <title>Accordion Dropdown nav Menu</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="script/jquery-1.12.3.js"></script>
    <script src="script/script.js"></script>
</head>
<body>
    <nav>
        <div id="nav">
            <ul class="main">
                <li><a href="#">MAIN 01</a></li>
                <li><a href="#">MAIN 02</a>
                    <ul class="sub">
                        <li><a href="#">SUB 01</a></li>
                        <li><a href="#">SUB 02</a></li>
                        <li><a href="#">SUB 03</a></li>
                        <li><a href="#">SUB 04</a></li>
                    </ul>
                </li>
                <li><a href="#">MAIN 03</a>
                    <ul class="sub">
                        <li><a href="#">SUB 05</a></li>
                        <li><a href="#">SUB 06</a></li>
                        <li><a href="#">SUB 07</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</body>
</html>