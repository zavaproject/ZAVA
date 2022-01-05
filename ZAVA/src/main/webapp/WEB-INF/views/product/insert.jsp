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
	<h1>제품등록</h1>
	<form action="/product/insert" method="post"> <br>
		등록 ID : <input name="mid" maxlength="33"><br>
		제품 ID : <input name="pid" maxlength="33"><br>
		제품 NAME : <input name="pname" maxlength="30"><br>
		카테고리 : <input name="category" type="number"><br>
		제품 가격 : <input name="price" type="number"><br>
		제품 재고 : <input name="stock" type="number"><br>
		제품 설명 : <br><textarea rows="20" name="descript" maxlength="1000"></textarea>
	<input type="submit" value="제품등록">
	</form>
	
</body>
</html>