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
  <script type="text/javascript" src="/resources/js/product.js"> </script>
  <script type="text/javascript" src="../../resources/js/review.js"> </script>
 
</head>
<body>
<<<<<<< HEAD
<form action="/review/update/" method="post"><br>
<p class="title_star">수정할 상품후기를 입력해주세요</p>
평점 : <select name="rating" class="rating">
	<option value="1" ${vo.rating==1? "selected" : ""}>1</option>
	<option value="2" ${vo.rating==2? "selected" : ""}>2</option>
	<option value="3" ${vo.rating==3? "selected" : ""}>3</option>
	<option value="4" ${vo.rating==4? "selected" : ""}>4</option>
	<option value="5" ${vo.rating==5? "selected" : ""}>5</option>
=======
<form action="/review/update/${curPage}" method="post"><br>
<p class="title_star">수정할 상품후기를 입력해주세요</p>
평점 : <select name="rating" class="rating">
   <option value="1" ${vo.rating==1? "selected" : ""}>1</option>
   <option value="2" ${vo.rating==2? "selected" : ""}>2</option>
   <option value="3" ${vo.rating==3? "selected" : ""}>3</option>
   <option value="4" ${vo.rating==4? "selected" : ""}>4</option>
   <option value="5" ${vo.rating==5? "selected" : ""}>5</option>
>>>>>>> 5e8cb62 (product 90%)
</select><br>
<input type="hidden" name="rno" value="${vo.rno}">
작성자 : <input name="mid" value="${vo.mid}" readonly><br>
후기상품 : <input name="pid" value="${vo.pid}" readonly><br>
제목 : <input name="title" value="${vo.title}"><br>
후기 : <br>
<textarea rows="5" name="content" maxlength="1000">${vo.content}</textarea><br>
<input type="submit" value = "후기수정완료" class="btn btn-info btn-sm">
</form>
</body>
</html>