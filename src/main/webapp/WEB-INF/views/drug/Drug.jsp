<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
*:before, *:after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: "Lato", sans-serif;
  font-weight: 300;
  line-height: 1.5;
  color: #333;
}

a {
  color: #fff;
}

.row {
  width: 100%;
  max-width: 1170px;
  margin: 0 auto;
  padding: 0;
  clear: both;
}
.row img {
  max-width: 100%;
  height: auto;
  padding: 0;
  margin: 0;
}

.gallery ul li {
  float: left;
  margin: 0 0.8771929825%;
  overflow: hidden;
}

header {
  background-color: #84b4b1;
  color: #fff;
  text-align: center;
  padding: 40px 0 30px;
}
header h1 {
  text-align: center;
  text-transform: uppercase;
  font-size: 65px;
  font-weight: 400;
  letter-spacing: 3px;
  line-height: 0.8;
  padding-top: 50px;
  font-family: "Montserrat", sans-serif;
}
header h1 span {
  text-transform: uppercase;
  letter-spacing: 7px;
  font-size: 25px;
  line-height: 1;
}
header p {
  padding-top: 30px;
}

.gallery {
  padding: 40px 0 300px;
  position: relative;
  overflow: hidden;
}
.gallery ul {
  padding-top: 50px;
  position: relative;
}
.gallery ul li {
  margin-bottom: 20px;
  width: 23.2456140351%;
  position: relative;
}
.gallery ul li a {
  display: block;
  position: relative;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  line-height: 0;
}
.gallery ul li a:before {
  position: absolute;
  width: 32px;
  height: 32px;
  top: 40%;
  left: 50%;
  margin: -14px 0 0 -16px;
  background: url(data:image/svg+xml;utf8,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22utf-8%22%3F%3E%0A%3C%21--%20Generator%3A%20Adobe%20Illustrator%2017.1.0%2C%20SVG%20Export%20Plug-In%20.%20SVG%20Version%3A%206.00%20Build%200%29%20%20--%3E%0A%3C%21DOCTYPE%20svg%20PUBLIC%20%22-//W3C//DTD%20SVG%201.1//EN%22%20%22http%3A//www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd%22%3E%0A%3Csvg%20version%3D%221.1%22%0A%09%20id%3D%22svg2%22%20xmlns%3Adc%3D%22http%3A//purl.org/dc/elements/1.1/%22%20xmlns%3Acc%3D%22http%3A//creativecommons.org/ns%23%22%20xmlns%3Ardf%3D%22http%3A//www.w3.org/1999/02/22-rdf-syntax-ns%23%22%20xmlns%3Asvg%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Asodipodi%3D%22http%3A//sodipodi.sourceforge.net/DTD/sodipodi-0.dtd%22%20xmlns%3Ainkscape%3D%22http%3A//www.inkscape.org/namespaces/inkscape%22%20inkscape%3Aversion%3D%220.48.4%20r9939%22%20sodipodi%3Adocname%3D%22icon-fullscreen.svg%22%0A%09%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20viewBox%3D%220%200%20960%20560%22%0A%09%20enable-background%3D%22new%200%200%20960%20560%22%20xml%3Aspace%3D%22preserve%22%3E%0A%3Csodipodi%3Anamedview%20%20borderopacity%3D%221%22%20pagecolor%3D%22%23ffffff%22%20bordercolor%3D%22%23666666%22%20objecttolerance%3D%2210%22%20gridtolerance%3D%2210%22%20guidetolerance%3D%2210%22%20showgrid%3D%22false%22%20fit-margin-top%3D%220%22%20fit-margin-left%3D%220%22%20inkscape%3Azoom%3D%227.375%22%20inkscape%3Acx%3D%22-5.1525424%22%20inkscape%3Acy%3D%2216%22%20id%3D%22namedview11%22%20inkscape%3Awindow-x%3D%22-8%22%20inkscape%3Awindow-y%3D%22-8%22%20fit-margin-right%3D%220%22%20inkscape%3Apageopacity%3D%220%22%20fit-margin-bottom%3D%220%22%20inkscape%3Awindow-width%3D%221366%22%20inkscape%3Awindow-height%3D%22706%22%20inkscape%3Awindow-maximized%3D%221%22%20inkscape%3Apageshadow%3D%222%22%20inkscape%3Acurrent-layer%3D%22svg2%22%3E%0A%09%3C/sodipodi%3Anamedview%3E%0A%3Cg%3E%0A%09%3Crect%20x%3D%22220%22%20y%3D%22260%22%20fill%3D%22%23FFFFFF%22%20width%3D%22536%22%20height%3D%2224%22/%3E%0A%3C/g%3E%0A%3Cg%3E%0A%09%3Crect%20x%3D%22476%22%20y%3D%224%22%20fill%3D%22%23FFFFFF%22%20width%3D%2224%22%20height%3D%22556%22/%3E%0A%3C/g%3E%0A%3C/svg%3E%0A) no-repeat;
  content: "";
  opacity: 0;
  z-index: 1;
  -webkit-transition: all 0.3s linear;
  -moz-transition: all 0.3s linear;
  transition: all 0.3s linear;
}
.gallery ul li a:hover:before {
  top: 50%;
  opacity: 1;
}
.gallery ul li a:after {
  position: absolute;
  width: 100%;
  top: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.3);
  content: "";
  opacity: 0;
  -webkit-transition: all 0.3s linear;
  -moz-transition: all 0.3s linear;
  transition: all 0.3s linear;
}
.gallery ul li a:hover:after {
  opacity: 1;
}

.port {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  padding-top: 100px;
  background: #ffffff;
  background-color: #fafafa;
  z-index: 103;
  visibility: hidden;
  -webkit-transform: translateY(-100%);
  transform: translateY(-100%);
  border-bottom: 1px solid #d0d0d0;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
}
.port img {
  width: 50%;
}
.port .description {
  float: left;
  width: 50%;
  max-height: 100%;
  padding: 0 40px 40px;
  overflow: auto;
}
.port h1 {
  font-size: 35px;
  line-height: 2.3;
  padding: 0;
}
.port > * {
  opacity: 0;
  -webkit-transition: all 0.5s linear;
  -moz-transition: all 0.5s linear;
  transition: all 0.5s linear;
}
.port.item_open {
  visibility: visible;
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
  -webkit-transition: all 0.4s ease-in-out;
  -moz-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}
.port > * {
  opacity: 1;
  -webkit-transition-delay: 0.5s;
  transition-delay: 0.5s;
}

.close {
  width: 21px;
  height: 21px;
  background: url(data:image/svg+xml;utf8,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22utf-8%22%3F%3E%0A%3C%21--%20Generator%3A%20Adobe%20Illustrator%2017.1.0%2C%20SVG%20Export%20Plug-In%20.%20SVG%20Version%3A%206.00%20Build%200%29%20%20--%3E%0A%3C%21DOCTYPE%20svg%20PUBLIC%20%22-//W3C//DTD%20SVG%201.1//EN%22%20%22http%3A//www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd%22%3E%0A%3Csvg%20version%3D%221.1%22%0A%09%20id%3D%22svg2%22%20xmlns%3Adc%3D%22http%3A//purl.org/dc/elements/1.1/%22%20xmlns%3Acc%3D%22http%3A//creativecommons.org/ns%23%22%20xmlns%3Ardf%3D%22http%3A//www.w3.org/1999/02/22-rdf-syntax-ns%23%22%20xmlns%3Asvg%3D%22http%3A//www.w3.org/2000/svg%22%0A%09%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20viewBox%3D%220%200%2021%2021%22%0A%09%20enable-background%3D%22new%200%200%2021%2021%22%20xml%3Aspace%3D%22preserve%22%3E%0A%3Cg%20id%3D%22layer1%22%20transform%3D%22translate%280%2C-1031.3622%29%22%3E%0A%09%3Cpath%20id%3D%22path2987%22%20fill%3D%22none%22%20stroke%3D%22%23000000%22%20d%3D%22M0%2C1031.4l21%2C21%22/%3E%0A%09%3Cpath%20id%3D%22path2989%22%20fill%3D%22none%22%20stroke%3D%22%23000000%22%20d%3D%22M21%2C1031.4l-21%2C21%22/%3E%0A%3C/g%3E%0A%3C/svg%3E%0A%0A) no-repeat;
  position: absolute;
  right: 10px;
  top: -121px;
  opacity: 1;
  z-index: 1004;
  -webkit-transition: all 0.1s ease-in-out;
  -moz-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
.item_open .close {
  opacity: 1;
  top: 0px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

figure.snip0018:hover img {
  opacity: 0.7;
}
figure.snip0018:hover figcaption h2,
figure.snip0018:hover figcaption p {
  -webkit-transform: translate3d(0%, 0%, 0);
  transform: translate3d(0%, 0%, 0);
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}
figure.snip0018:hover figcaption h2 {
  opacity: 1;
}
figure.snip0018:hover figcaption p {
  opacity: 1;
}
figure.snip0018:hover figcaption::before {
  background: #ffffff;
  left: 0px;
  right: 0px;
  opacity: 1;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
/****/
figure.effect-zoe figcaption {
	top: auto;
	bottom: 0;
	padding: 1em;
	height: 3.75em;
	background: #fff;
	color: #3c4a50;
	-webkit-transition: -webkit-transform 0.35s;
	transition: transform 0.35s;
	-webkit-transform: translate3d(0,100%,0);
	transform: translate3d(0,100%,0);
}

figure.effect-zoe h4 {
	float: left;
}

figure.effect-zoe p.icon-links a {
	float: right;
	color: #3c4a50;
	font-size: 1.4em;
}

figure.effect-zoe:hover p.icon-links a:hover,
figure.effect-zoe:hover p.icon-links a:focus {
	color: #252d31;
}

figure.effect-zoe p.description {
	position: absolute;
	bottom: 8em;
	padding: 2em;
	color: #fff;
	text-transform: none;
	font-size: 90%;
	opacity: 0;
	-webkit-transition: opacity 0.35s;
	transition: opacity 0.35s;
	-webkit-backface-visibility: hidden; /* Fix for Chrome 37.0.2062.120 (Mac) */
}

figure.effect-zoe h2,
figure.effect-zoe p.icon-links a {
	-webkit-transition: -webkit-transform 0.35s;
	transition: transform 0.35s;
	-webkit-transform: translate3d(0,200%,0);
	transform: translate3d(0,200%,0);
}

figure.effect-zoe p.icon-links a span::before {
	display: inline-block;
	padding: 8px 10px;
	font-family: 'feathericons';
	speak: none;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.icon-eye::before {
	content: '\e000';
}

.icon-paper-clip::before {
	content: '\e001';
}

.icon-heart::before {
	content: '\e024';
}

figure.effect-zoe h2 {
	display: inline-block;
}

figure.effect-zoe:hover p.description {
	opacity: 1;
}

figure.effect-zoe:hover figcaption,
figure.effect-zoe:hover h2,
figure.effect-zoe:hover p.icon-links a {
	-webkit-transform: translate3d(0,0,0);
	transform: translate3d(0,0,0);
}

figure.effect-zoe:hover h2 {
	-webkit-transition-delay: 0.05s;
	transition-delay: 0.05s;
}

figure.effect-zoe:hover p.icon-links a:nth-child(3) {
	-webkit-transition-delay: 0.1s;
	transition-delay: 0.1s;
}

figure.effect-zoe:hover p.icon-links a:nth-child(2) {
	-webkit-transition-delay: 0.15s;
	transition-delay: 0.15s;
}

figure.effect-zoe:hover p.icon-links a:first-child {
	-webkit-transition-delay: 0.2s;
	transition-delay: 0.2s;
}




</style>

<header>
	<h1>
		Homespital <br> <span>[ 안전상비의약품 ]</span>
	</h1>
</header>

<div id="top"></div>
<section class="gallery">
	<div class="row grid">
		<ul>
			<a href="#" class="close"></a>
			<c:forEach items="${medi1 }" var="medi">
				<li>
				<figure class="effect-zoe">
				<a href="#${medi }"> 
				<img src='<c:url value="/images/medicine/${medi }.jpg"/>' alt="">
				</a>
					<figcaption style="text-align: center;">
						<h4>${medi}</h4>
						<p class="icon-links">
							<i class="fas fa-tablets"></i>
							<i class="fas fa-capsules"></i>
							<i class="fas fa-clinic-medical"></i>
						</p>
					</figcaption>
				</figure>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- / row -->

	<!-- Item 01 -->
	<c:forEach items="${medi1 }" var="medi">
	<div id="${medi }" class="port">
		<div class="row">
			<div class="description">
				<h1>${medi }</h1>
				<p>약물정보</p>
			</div>
			<img src='<c:url value="/images/medicine/${medi}.jpg"/>' alt="">
		</div>
	</div>
	</c:forEach>
	<!-- / row -->
</section>
<!-- / projects -->


<script>
// portfolio
$('.gallery ul li a').click(function() {
    var itemID = $(this).attr('href');
    $('.gallery ul').addClass('item_open');
    $(itemID).addClass('item_open');
    return false;
});
$('.close').click(function() {
    $('.port, .gallery ul').removeClass('item_open');
    return false;
});

$(".gallery ul li a").click(function() {
    $('html, body').animate({
        scrollTop: parseInt($("#top").offset().top)
    }, 400);
});

</script>