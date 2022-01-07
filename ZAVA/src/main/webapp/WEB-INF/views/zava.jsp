<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<title>ZAVA</title>

</head>

<body>
<<<<<<< HEAD
<jsp:include page="header.jsp" />
=======
	<header class="inline-block fixed">
		<div class="layout-header__main">
			<div class="left-menu">
				<input id="BT" type="button" value="≡" onclick="view()">
				<div id="category">
					<ul id="hidden" style="display: none" type="none">
						<li class="menu">
							<p>WOMAN</p>
							<ul class="hide">
								<li><a href="/product/list/2010">TOP</a></li>
								<li><a href="/product/list/2020">PANTS</a></li>
							</ul>
						</li>
						<li class="menu">
							<p>MAN</p>
							<ul class="hide">
								<li><a href="/product/list/1010">TOP</a></li>
								<li><a href="/product/list/1020">PANTS</a></li>
							</ul>
						</li>
						<li class="menu">
							<p>KIDS</p>
							<ul class="hide">
								<li><a href="/product/list/3010">GIRL</a></li>
								<li><a href="/product/list/3020">BOY</a></li>
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

>>>>>>> c6ab329 (product 50% 진행중)
	<section class="inline-block">
	<img src="../../resources/img/Fashion.png" alt="Fashion">
     </section>
<jsp:include page="footer.jsp" />
</body>
</html>