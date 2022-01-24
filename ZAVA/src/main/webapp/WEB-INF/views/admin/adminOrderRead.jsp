<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
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

	<style>
	
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:900px; margin:0 auto; }
		
		
		section#container { }
			section#content { float:right; width:700px; }
			aside#aside { float:left; width:180px; }
			section#container::after { content:""; display:block; clear:both; }	
			
		/* ---------- */
		
	
	
		section#container { }
		

		
	</style>
	
	
<style>

	.order { border:5px solid #eee; padding:10px 20px; margin:20px 0;} 
	.order span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
	
	.orderRead li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
	.orderRead li::after { content:""; display:block; clear:both; }
	/* 
	.img { float:left; width:200px; }
	.img img { width:200px; height:200px; }
	 */
	.productInfo { float:right; width:calc(100% - 220px); line-height:2; }
	.productInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	
	.changeOstock { text-align:right; }
	.ostatus1_btn,
	.ostatus2_btn,
	.ostatus3_btn { font-size:15px; background:#fff; border:1px solid #999; margin-left:20px; }
	
</style>

	
</head>

<body>
<div id="root">
<%-- 	<jsp:include page="../header.jsp" /> --%>

<section id="container">
	<div id="container_box">	
		
	<section id="content">		
	<div class="order">
		<c:forEach items="${adOrderRead}" var="adOrderRead" varStatus="status">
		
 	<c:if test="${status.first}">
			<p><span>수령인</span>${adOrderRead.oname}</p>
			<p><span>주소</span>${adOrderRead.address} ${adOrderRead.extraAddress} ${adOrderRead.detailAddress}</p>
			<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${adOrderRead.amount}" /> 원</p>
			<p><span>배송상황</span>${adOrderRead.ostatus}</p>		
			
			<div class="changeOstock">
				<form role="form" method="post" class="ostatusForm">
					<input type="hidden" name = "oid" value="${adOrderRead.oid}" />
					<input type="hidden" name = "ostatus" class = "ostatus" value="" />
					
					<button type="button" class="ostatus1_btn">배송 중</button>
					<button type="button" class="ostatus2_btn">배송 완료</button>
					<button type="button" class="ostatus3_btn">주문 취소</button>					
					
<script>
$(".ostatus1_btn").click(function(){
	$(".ostatus").val("배송 중");
	run();
});

$(".ostatus2_btn").click(function(){
	$(".ostatus").val("배송 완료");
	run();
});	
	
$(".ostatus3_btn").click(function(){
	$(".ostatus").val("주문 취소");
	run();	
});

function run(){
	$(".ostatusForm").submit();
}
</script>
				
				</form>			
			</div>
			
			
		</c:if>	
	</c:forEach>
	</div>	
	<ul class="adOrderRead">
		<c:forEach items="${adOrderRead}" var="adOrderRead">
		<li>
		 <%--   <div class="img">
             <a href="/product/read/${orderRead.pid}">
          		<img alt="thumbnail" src="/resources/productupload/${orderRead.filename}" width="40">
           	</a>
           </div>
              <div class="pname">
                 <span><a href="/product/read/${orderRead.pid}">${orderRead.pname}</a></span><br>
                 <span style="font-size: 12px;">옵션:${orderRead.pname}, ${orderRead.ocolor}, ${orderRead.osize}</span>
              </div> --%>
              
		<div class="productInfo">
			<p>
				<span>상품명</span>${adOrderRead.pname}<br />
				<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${adOrderRead.price}" /> 원<br />
				<span>수량</span>${adOrderRead.pcnt} 개<br />
				<span>총 가격</span><fmt:formatNumber pattern="###,###,###" value="${adOrderRead.price * adOrderRead.pcnt}" /> 원               
			</p>
		</div>		
		</li>
		</c:forEach>
		</ul>		
	</section>
	
		</div>
	</section>


	<%-- <jsp:include page="../footer.jsp" /> --%>
</div>
</body>
</html>