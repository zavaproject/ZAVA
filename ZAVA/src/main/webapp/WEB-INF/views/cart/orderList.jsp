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
		
	</style>
	

<title>주문 목록</title>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="../quickmenu.jsp"/>

<section id="content">

	<ul class="orderList">
		
		<h3>${login.mid} 님 주문 목록</h3><br>
		<div class="container">
<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>수령인</th>
				<th>가격</th>
				<th>연락처</th>
				<th>배송상황</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderList}" var="orderList">
				<tr>
										
								<td><a href="/cart/orderRead?oid=${orderList.oid}">${orderList.oid}</a></td>
								<td><fmt:formatDate value="${orderList.odate}" pattern="yyyy.MM.dd" /></td>
								<td>${orderList.oname}</td>
								<td><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" />원</td>
								<td>${orderList.ophone}</td>
								<td>${orderList.ostatus}</td>							
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	</div>
				</ul>
				
				</section>
<jsp:include page="../footer.jsp" />
</body>

</html>