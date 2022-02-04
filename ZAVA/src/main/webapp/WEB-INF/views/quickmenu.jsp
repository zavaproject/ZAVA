<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/boxicons@2.1.1/dist/boxicons.js"></script>
  
  <style type="text/css">
  	.quickmenu{
  	position: absolute;
  	right: 160px;
  	top: 165px;
  	margin: 0;
  	}
  	ul{
  	padding: 0;
  	}
  	li{
  	font-size: 0.8em;
  	margin-top: 5px;
  	}
  	box-icon{
  	width: 48px;
  	height: auto;
  	}
  </style>
</head>
<body>

	<div class="quickmenu" style="text-align: center;">
		<ul>
			<li>
				<div style="cursor:pointer;" onclick="window.scrollTo(0,0);">
					<box-icon name='chevron-up'></box-icon>
				</div>
			</li>
			<li>추천 목록</li>
			<li><a href="/product/read/1"><img alt="img1" src="../../../resources/img/sideproduct1.jpg" style="width: 50px; height: auto;"></a></li>
			<li><a href="#"><img alt="img2" src="../../../resources/img/sideproduct2.jpg" style="width: 50px; height: auto;"></a></li>
			<li><a href="#"><img alt="img3" src="../../../resources/img/sideproduct3.jpg" style="width: 50px; height: auto;"></a></li>
			<li><a href="/board/list">1:1문의</a></li>
			<li>
				<div style="cursor:pointer;" onclick="window.scrollTo(0,document.body.scrollHeight);">
					<box-icon name='chevron-up' rotate='180' ></box-icon>
				</div>
			</li>
		</ul>
	</div>
	
<script type="text/javascript">
	$(document).ready(function() {
		var currentPosition = parseInt($(".quickmenu").css("top"));
		
		$(window).scroll(function() {
			var postion = $(window).scrollTop();
			$(".quickmenu").stop().animate({"top":postion+currentPosition+"px"}), 1000;
		});
	});
</script>

</body>
</html>