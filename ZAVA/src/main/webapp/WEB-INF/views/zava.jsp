<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>ZAVA</title>
<style>
body {
	font-family: Neue-Helvetica, Helvetica, Arial;
	display: grid;
	grid-template-areas: "header" "section" "footer";
	grid-template-rows: 80px 1fr 80px;
	grid-template-columns: 100vw;
	grid-gap: 5px;
	height: 100vh;
	margin: 5px;
}

#BT {
  background-color: dimgray;
  margin-top: 16px;
  border: none;
  color: white;
  padding: 5px 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	height: 80px;
	padding: 1rem;
	font-weight: bold;
	display: flex;
	justify-content: space-between;
	grid-area: header;
	background-color: #999;
}

.inline-block {
	display: inline-block;
}

.left-menu {
	float: left;
}

.right-menu {
	float: right;
}

.zava {
font-size: 3em;
}

p,a{
	cursor:pointer;
	color: black;
	text-decoration:none;
}
a:hover{
	cursor:pointer;
	color: #666666;
	text-decoration:none;
}

.menu .hide {
	display: none;
}

img { 
	display: block; 
	margin: 0px auto; 
}

ul {
	list-style: none;
}

section {
	grid-area: section;
}

footer {
	grid-area: footer;
	background-color: #666666;
}

header, nav, section, aside, footer {
	border-radius: 10px;
	padding: 5px;
}
</style>
</head>

<body>
	<header class="inline-block fixed">
		<div class="layout-header__main">
			<div class="left-menu">
				<input id="BT" type="button" value="≡" onclick="view()">
				<div id="category">
					<ul id="hidden" style="display: none" type="none">
						<li class="menu">
							<p>WOMAN</p>
							<ul class="hide">
								<li><a href="#">TOP</a></li>
								<li><a href="#">PANTS</a></li>
							</ul>
						</li>
						<li class="menu">
							<p>MAN</p>
							<ul class="hide">
								<li><a href="#">TOP</a></li>
								<li><a href="#">PANTS</a></li>
							</ul>
						</li>
						<li class="menu">
							<p>KIDS</p>
							<ul class="hide">
								<li><a href="#">GIRL</a></li>
								<li><a href="#">BOY</a></li>
							</ul>
						</li>
						<li class="menu">
							<p>BEAUTY</p>
							<ul class="hide">
								<li><a href="#">MAKEUP</a></li>
								<li></li>
							</ul>
						</li>
						<li class="menu">
							<p>SHOES & BAGS</p>
							<ul class="hide">
								<li></li>
								<li></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<a href="#" class="zava">ZAVA</a>
			<div class="right-menu">
				<a href="#">검색</a> <a href="#">로그인</a> <a href="#">도움말</a> <a
					href="#">바스켓백</a>
			</div>
		</div>
	</header>

	<section class="inline-block">
	<img src="../../resources/img/Fashion.png" alt="Fashion">
     </section>

	<footer class="inline-block"> ⓒ2022. HiMedia 유화평,박창수,강동현,박윤재,한승규,김수빈,정희원 all rights reserved</footer>

	<script>
		function view() {
			if (hidden.style.display == "none") {
				hidden.style.display = "block";
				BT.value = "Ⅹ";
			} else {
				hidden.style.display = "none";
				BT.value = "≡";
			}
		}
		$(document).ready(function() {
			$("#category .menu>p").click(function() {
				var submenu = $(this).next("ul");
				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				}
			});
		});
	</script>
</body>
</html>