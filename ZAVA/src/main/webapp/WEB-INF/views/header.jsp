<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="inline-block fixed">
	<div class="layout-header__main">
		<div class="left-menu">
			<input id="BT" type="button" value="≡" onclick="view()">
			<div id="category">
				<ul id="hidden" style="display: none" type="none">
					<li class="menu">
						<p>MAN</p>
						<ul class="hide">
							<li><a href="/product/list/1010">TOP</a></li>
							<li><a href="/product/list/2010">PANTS</a></li>
						</ul>
					</li>
					<li class="menu">
						<p>WOMAN</p>
						<ul class="hide">
							<li><a href="/product/list/2010">TOP</a></li>
							<li><a href="/product/list/2020">PANTS</a></li>
						</ul>
					</li>
					<li class="menu">
						<p>KIDS</p>
						<ul class="hide">
							<li><a href="/product/list/3010">GIRL</a></li>
							<li><a href="/product/list/3020">BOY</a></li>
						</ul>
					</li>
					<li class="menu">
						<p>BEAUTY</p>
						<ul class="hide">
							<li><a href="#">MAKEUP</a></li>
							<li></li>
						</ul>
					</li>
					<li class="menu">
						<p>SHOES & BAGS</p>
						<ul class="hide">
							<li></li>
							<li></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

		<a href="/zava" class="zava">ZAVA</a>
		<div class="right-menu">
			<a href="#">검색</a>
			
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
				<a href="/member/list">고객목록</a>
			</c:if>
			<c:if test="${login.mcode == 2}">
				<div class="dropdown">
					<button class="dropbtn">CEOmenu</button>
					<div class="dropdown-content">
						<a href="/member/mkoperator">make operator</a>
						<a href="#">Link 2</a>
						<a href="#">Link 3</a>
					</div>
				</div>
			</c:if>
			<a href="#">도움말</a>
			<a href="#">바스켓백</a>
		</div>
	</div>
</header>
<script>
	function view() {
		if (hidden.style.display == "none") {
			hidden.style.display = "block";
			BT.value = "Ⅹ";
		} else {
			hidden.style.display = "none";
			BT.value = "≡";
		}
	}
	$(document).ready(function() {
		$("#category .menu>p").click(function() {
			var submenu = $(this).next("ul");
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
</script>