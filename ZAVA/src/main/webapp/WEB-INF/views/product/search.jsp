<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Search</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <link href="../../../resources/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="../quickmenu.jsp"/>
   <section class="container">
	<form action="/product/search" method="get" class="collapse d-flex" style="margin-top: 150px; width:1100px;">
		<input type="search" name="pname" class="search form-control" placeholder="검색할 상품을 입력해주세요.." aria-label="Search">
		&nbsp;<button type="submit" class="search_btn btn btn-dark">Search</button>
	</form>
	
	  

	<div class="container" style="margin-top: 50px">
		<div class="uploadedList row">
		<c:choose>
         <c:when test="${empty pList}">
                		<div align="center" style="font-size: 30px;">검색된 결과가 없습니다.</div>
         </c:when>
       <c:otherwise>
       <c:forEach items="${pList}" var="pList" varStatus="status">
        <div class="uploadedItemForRead2">
          <div class="prdimg card">
			<a href='/product/read/${pList.pid}'><img src="/resources/productupload/${pList.filename}"></a>
  			<a href='/product/read/${pList.pid}'><div class="namebody">${pList.pname}</div></a>
          </div>    
        </div>
        		  </c:forEach>
        	    </c:otherwise>
       </c:choose>
		</div>
	 </div>

</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>