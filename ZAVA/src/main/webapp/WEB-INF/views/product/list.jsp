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
</head>
<body>
<c:if test="${category == 1010}">
<h1>MAN TOP PRODUCT</h1>
</c:if>
<c:if test="${category == 1020}">
<h1>MAN PANTS PRODUCT</h1>
</c:if>
<c:if test="${category == 2010}">
<h1>WOMAN TOP PRODUCT</h1>
</c:if>
<c:if test="${category == 2020}">
<h1>WOMAN PANTS PRODUCT</h1>
</c:if>
<c:if test="${category == 3010}">
<h1>KID GIRL PRODUCT</h1>
</c:if>
<c:if test="${category == 3020}">
<h1>KID BOY PRODUCT</h1>
</c:if>

<div class="container">
 <c:forEach items="${list}" var="list">
 	<a href="/product/read/${list.pid}">${list.pname}</a> &nbsp; &nbsp;
 </c:forEach>
</div>

</body>
</html>