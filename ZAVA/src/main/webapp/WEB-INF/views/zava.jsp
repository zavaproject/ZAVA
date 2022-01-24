<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!--slick slider 필요 태그 st-->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.8/slick-theme.min.css">
<!-- jQuery CDN -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- slick Carousel CDN -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.min.js"></script>
<!--slick slider 필요 태그 en-->

<title>ZAVA</title>
<style type="text/css">		

/* 노멀라이징 */

/* 라이브러리 */
.con{
  width: 60vw;
  margin: 0 auto ;
}
/* 스타일 */
/* 슬릭js 스타일 변경 st */
/* 슬라이드 높이 변경  */
.slick-track{
  height: 60vh;
}

/* 화살표 색상 변경*/
.slick-prev:before, .slick-next:before{
  color: black !important;
  opacity: 1 ; 
}
/* 화살표 위치 변경 */
.slick-prev{
  left: 20px !important ;
  z-index: 9;
}
.slick-next{
  right: 20px !important ;
  z-index: 9;  
}

/* 버튼 위치 변경 */
.slick-dots{
  bottom : 0 !important;
}
/* 버튼 색상 변경 (마우스 오버)  */
.slick-dots li button:hover:before, .slick-dots li button:focus:before{
  color: black ;
}

/* 버튼 색상 변경 (활성화)  */
.slick-dots li.slick-active button:before{
  color: black !important;  
}

/* 버튼 색상 변경 (비활성화)  */
.slick-dots li button:before{
  color: black !important;  
}
/* 슬릭js 스타일 변경 en */
.slider-items{
  background-repeat: no-repeat ;
  background-size: cover ;
}

.item1{
 width: 100%;
 height: 100%;
}
.item2{
width: 100%;
height: 100%;
}
.item3{
width: 100%;
height: 100%;
}
</style>

</head>

<body>
<jsp:include page="member/header.jsp"/>
<jsp:include page="nav.jsp"/>
<section class="section">

<div class="con">
  <div class="slider slider-wrap">
    <div class="slider-items item1"><img alt="" src="../../resources/img/Fashion1.png"class="item1"></div>
    <div class="slider-items item2"><img alt="" src="../../resources/img/Fashion2.png"class="item2"></div>
    <div class="slider-items item3"><img alt="" src="../../resources/img/Fashion3.png"class="item3"></div>
  </div>
</div>
<table>
  <tr>
    <td><a href="product/list/1010/"><img alt="Fashion1" src="../../resources/img/Fashion1.png" style="width:100%;height:auto;"/></a></td>
    <td><a href="product/list/2010/"><img alt="Fashion2" src="../../resources/img/Fashion2.png" style="width:100%;height:auto;"/></a></td>
    <td><a href="product/list/3010/"><img alt="Fashion3" src="../../resources/img/Fashion3.png" style="width:100%;height:auto;"/></a></td>
  <tr>
</table>
</section>
<jsp:include page="aside.jsp"/>
<jsp:include page="footer.jsp"/>
		
		
<script type="text/javascript"> 
$(document).ready(function(){
	  $('.slider').slick({    
	    infinite: false,       // 무한반복
	     slidesToShow: 1,     // 보여지는 슬라이드 개수
	     slidesToScroll: 1,   // 넘어가는 슬라이드 개수
	     dots: true,          // 점 네비게이션 표시
	     autoplay : true,     //자동넘김 구현
		 autoplaySpeed: 1000, //자동넘김 속도
		 prevArrow : "<button class='slick-prev' style='position: absolute; z-index: 2;'></button>",
		 nextArrow : "<button class='slick-next' style='position: absolute; z-index: 2;'></button>"
	  });
	});

</script>
</body>
</html>