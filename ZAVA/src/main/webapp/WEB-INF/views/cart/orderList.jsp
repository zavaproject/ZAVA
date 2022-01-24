<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
	
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin: 0 auto; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:900px; margin:100px; auto; }
		header#header {}
		nav#nav {}
		section#container { }
			section#content { float:left; width:700px; }
			/* aside#aside { float:left; width:180px; } */
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:20px; }
		
		/* ---------- */
		
		header#header div#header_box { text-align:center; padding:30px 0; }
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; }
		
		section#container { }
		
		footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 20px; }
		
	</style>
	
	<style>

	section#content ul li { border:5px solid; padding:10px 20px; margin-bottom:20px; }
	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
<title>주문 목록</title>
</head>
<body>

<jsp:include page="../header.jsp"/>


<section id="container">
		<div id="container_box">
			<section id="content">
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
						<li>
							<div>
								<p><span>주문번호</span><a href="/cart/orderRead?oid=${orderList.oid}">${orderList.oid}</a></p>
								<p><span>주문날짜</span>${orderList.odate}</p>
								<p><span>수령인</span>${orderList.oname}</p>
								<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" />원</p>
								<p><span>연락처</span>${orderList.ophone}</p>
								<p><span>배송상황</span>${orderList.ostatus}</p>
							</div>
					</li>
					</c:forEach>
				</ul>
				</section>
			</div>
</section>
<jsp:include page="../footer.jsp" />
</body>

</html>