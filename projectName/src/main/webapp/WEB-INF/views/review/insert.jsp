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
  <style type="text/css">


.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 30px;
    height: 30px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}

.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 30px;
    height: 30px;
    background-image: url('../../resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 30px 30px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: red;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}

  </style>
  
</head>
<body>
<jsp:include page="../member/header.jsp"/>
   <section>
<form action="/review/insert" method="post"><br>
<input type="hidden" name="rate" id="rate" value="0"/>
<p class="title_star">구매상품 평점과 리뷰를 남겨주세요.</p>
평점 : <select name="rating" class="rating">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select><br>
<!-- 	<div class="rating">
             <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
             <label for="rating1"></label>
             <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
             <label for="rating2"></label>
             <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
             <label for="rating3"></label>
             <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
             <label for="rating4"></label>
             <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
             <label for="rating5"></label>
     </div>      -->   
작성자 : <input name="mid" value="${login.mid}" readonly><br>
후기상품 : <input name="pid" value="${pid}" readonly><br>
제목 : <input name="title"><br>
후기 : <br>
<textarea rows="5" name="content" maxlength="1000" placeholder="후기를 작성해주세요"></textarea><br>
<input type="submit" value = "후기작성완료">
</form>

<!-- <script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
  	 document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    });
}); -->



</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>