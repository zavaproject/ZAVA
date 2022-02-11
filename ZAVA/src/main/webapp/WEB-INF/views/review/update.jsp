<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 수정</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/resources/js/product.js"> </script>
  <script type="text/javascript" src="../../resources/js/review.js"> </script>
  <style type="text/css">
.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
  </style>
</head>
<body>
 <jsp:include page="../member/header.jsp"/>
   <section>

<form class="container" action="/review/update/${curPage}" method="post"><br>
<h3>수정할 상품후기를 입력해주세요</h3>
<div class="star-rating">
  <input type="radio" id="5-stars" name="rating" value="5" ${vo.rating==5? "checked" : ""}/>
  <label for="5-stars" class="star">★</label>
  <input type="radio" id="4-stars" name="rating" value="4" ${vo.rating==4? "checked" : ""}/>
  <label for="4-stars" class="star">★</label>
  <input type="radio" id="3-stars" name="rating" value="3" ${vo.rating==3? "checked" : ""}/>
  <label for="3-stars" class="star">★</label>
  <input type="radio" id="2-stars" name="rating" value="2" ${vo.rating==2? "checked" : ""}/>
  <label for="2-stars" class="star">★</label>
  <input type="radio" id="1-star" name="rating" value="1" ${vo.rating==1? "checked" : ""}/>
  <label for="1-star" class="star">★</label>
</div>

<input type="hidden" name="rno" value="${vo.rno}">
작성자 : <input name="mid" value="${vo.mid}" readonly><br>
후기상품 : <input name="pid" value="${vo.pid}" readonly><br>
제목 : <input name="title" value="${vo.title}"><br>
후기 : <br>
<textarea rows="5" cols="100" name="content" maxlength="1000">${vo.content}</textarea><br>
<input type="submit" value = "후기수정완료" class="btn btn-info btn-sm">
</form>

  </section>
   <jsp:include page="../footer.jsp" />
   <jsp:include page="../quickmenu.jsp"/>
</body>
</html>