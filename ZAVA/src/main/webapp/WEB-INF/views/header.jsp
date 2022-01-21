<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<header class="inline-block fixed">
	<div class="layout-header__main">
		<div class="left-menu">
			<div id="menu-container" style="float: left;">
				<div id="menu-wrapper">
					<div id="hamburger-menu">
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				<ul class="menu-list accordion accordiontop">
					<li id="nav1" class="toggle accordion-toggle">
					<span class="icon-plus"></span>
					<a class="menu-link">MAN</a></li>
					<ul class="menu-submenu accordion-content">
						<li><a class="head" href="/product/list/1010/">TOP</a></li>
						<li><a class="head" href="/product/list/1020/">PANTS</a></li>
					</ul>
					<li id="nav2" class="toggle accordion-toggle">
					<spanclass="icon-plus"></span> 
					<a class="menu-link">WOMAN</a>
					</li>
					<ul class="menu-submenu accordion-content">
						<li><a class="head" href="/product/list/2010/">TOP</a></li>
						<li><a class="head" href="/product/list/2020/">PANTS</a></li>
					</ul>
					<li id="nav3" class="toggle accordion-toggle">
					<span class="icon-plus"></span> 
					<a class="menu-link">KIDS</a></li>
					<ul class="menu-submenu accordion-content">
						<li><a class="head" href="/product/list/3010/">GIRL</a></li>
						<li><a class="head" href="/product/list/3020/">BOY</a></li>
					</ul>
				</ul>
			</div>
			<div style="float: left;">
				<a href="/zava" class="zava"><img src="../../resources/img/ZAVA.png" alt="ZAVA"></a>	
			</div>
		</div>
		<div class="right-menu">
			<a href="/product/searchui">검색</a>
				
			<c:choose>
				<c:when test="${empty login}">
					<a href="/member/login">로그인</a>
				</c:when>
				<c:when test="${not empty login}">
					<a href="/member/read/${login.mid}">${login.mid}</a>님환영합니다.
					<a href="/member/logout">로그아웃</a>
				</c:when>
			</c:choose>
			<c:if test="${login.mcode == 1}">
				<a href="/member/list/">고객목록</a>
				<a href="/product/insert">제품등록</a>
			</c:if>
			<c:if test="${login.mcode == 2}">
				<div class="dropdown">
					<a class="dropbtn">CEOmenu</a>
					<div class="dropdown-content">
						<a href="/member/mkoperator">Make Operator</a>
						<a href="/member/dailysales">Daily Sales</a>
						<a href="/member/monthlysales">Monthly Sales</a>
					</div>
				</div>
			</c:if>
			<a href="/board/list/1">공지사항</a>
			<a href="/cart/list">바스켓백</a>
		</div>
	</div>
</header>
<script>
	
	$(function() {
		  function slideMenu() {
		    var activeState = $("#menu-container .menu-list").hasClass("active");
		    $("#menu-container .menu-list").animate({left: activeState ? "0%" : "-100%"}, 400);
		  }
		  $("#menu-wrapper").click(function(event) {
		    event.stopPropagation();
		    $("#hamburger-menu").toggleClass("open");
		    $("#menu-container .menu-list").toggleClass("active");
		    slideMenu();

		    $("body").toggleClass("overflow-hidden");
		  });

		  $(".menu-list").find(".accordion-toggle").click(function() {
		    $(this).next().toggleClass("open").slideToggle("fast");
		    $(this).toggleClass("active-tab").find(".menu-link").toggleClass("active");

		    $(".menu-list .accordion-content").not($(this).next()).slideUp("fast").removeClass("open");
		    $(".menu-list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".menu-link").removeClass("active");
		  });
		}); // jQuery load
</script>