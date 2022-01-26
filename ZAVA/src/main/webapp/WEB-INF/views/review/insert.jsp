<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 작성</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/resources/js/product.js"> </script>
  <script type="text/javascript" src="../../resources/js/review.js"> </script>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
   <section>
<h5>구매상품 평점과 리뷰를 남겨주세요.</h5>
<form action="/review/insert" method="post"><br>
평점 : <select name="rating" class="rating">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select><br>

작성자 : <input name="mid" value="${login.mid}" readonly><br>
후기상품 : <input name="pid" value="${pid}" readonly><br>
제목 : <input name="title"><br>
후기 : <br>
<textarea rows="5" name="content" maxlength="1000" placeholder="후기를 작성해주세요"></textarea><br>
<input type="submit" value = "후기작성완료">
</form>



</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>