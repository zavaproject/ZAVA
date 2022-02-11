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
<jsp:include page="../quickmenu.jsp"/>
   <section>
<form class="container" action="/review/insert" method="post"><br>
<h3>구매상품 별점과 리뷰를 남겨주세요.</h3>
<div class="star-rating">
  <input type="radio" id="5-stars" name="rating" value="5" checked="checked"/>
  <label for="5-stars" class="star">★</label>
  <input type="radio" id="4-stars" name="rating" value="4" />
  <label for="4-stars" class="star">★</label>
  <input type="radio" id="3-stars" name="rating" value="3"/>
  <label for="3-stars" class="star">★</label>
  <input type="radio" id="2-stars" name="rating" value="2" />
  <label for="2-stars" class="star">★</label>
  <input type="radio" id="1-star" name="rating" value="1" />
  <label for="1-star" class="star">★</label>
</div>

작성자 : <input name="mid" value="${login.mid}" readonly><br>
후기상품 : <input name="pid" value="${pid}" readonly><br>
제목 : <input name="title"><br>
후기 : <br>
<textarea rows="5" name="content" maxlength="1000" cols="100" placeholder="후기를 작성해주세요"></textarea><br>
<input type="submit" value = "후기작성완료">
</form>



</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>