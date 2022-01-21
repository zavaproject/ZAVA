<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 자세히 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">

</style>

</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="order">
		<c:forEach items="${orderRead}" var="orderRead" varStatus="stat">
		<c:if test="${stat.first}">
			<p><span>수령인</span>${orderRead.oname}</p>
			<p><span>주소</span>${orderRead.address} ${orderRead.extraAddress} ${orderRead.detailAddress}</p>
			<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderRead.amount}" /> 원</p>
			<p><span>배송상황</span>${orderRead.ostatus}</p>		
		</c:if>	
		</c:forEach>
		
	<ul class="orderRead">
		<c:forEach items="${orderRead}"  var="orderRead">
		<li>
		<div class="productInfo">
			<p>
				<span>상품명</span>${orderRead.pname}<br />
				<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderRead.price}" /> 원<br />
				<span>수량</span>${orderRead.pcnt} 개<br />
				<span>총 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderRead.price * orderRead.pcnt}" /> 원                   
							
			</p>
		</div>		
		</li>
		</c:forEach>
	</ul>		
	</div>
	
	<script type="text/javascript">
	
	</script>

	<jsp:include page="../footer.jsp" />
</body>
</html>