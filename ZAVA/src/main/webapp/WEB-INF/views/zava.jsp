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
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<title>ZAVA</title>
<style type="text/css">		

.swiper {
        width: 100%;
        height: auto;
        z-index: 7;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        width:99%;
        margin: 0;
        padding: 0;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100vw;
        height: 100vh;
        object-fit: cover;
        margin: 0 13px 0 0;
        padding: 0 0 0 0 ;
      }
      .section{
      width: 100%
      }
</style>

</head>

<body>
<jsp:include page="member/header.jsp" />
<%-- <jsp:include page="nav.jsp"/> --%>
<section class="section">

    <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img alt="" src="../../resources/img/Fashion1.jpg"class="item1"></div>
        <div class="swiper-slide"><img alt="" src="../../resources/img/Fashion2.jpg"class="item1"></div>
        <div class="swiper-slide"><img alt="" src="../../resources/img/Fashion3.jpg"class="item1"></div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
    <a href="product/list/2010/"><img alt="Fashion1" src="../../resources/img/Fashion5.png" style="padding:5px;width:33%;height:auto; float: left;"/></a>
    <a href="product/list/3010/"><img alt="Fashion2" src="../../resources/img/Fashion6.png" style="padding:5px;width:33%;height:auto; float: left;"/></a>
    <a href="product/list/1010/"><img alt="Fashion3" src="../../resources/img/Fashion4.png" style="padding:5px;	width:33%;height:auto; float: left;"/></a>

</section>
<%-- <jsp:include page="aside.jsp"/> --%>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        autoplay: {
    	   delay: 2500,
    	},
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    
</body>
<jsp:include page="footer.jsp"/>
</html>
