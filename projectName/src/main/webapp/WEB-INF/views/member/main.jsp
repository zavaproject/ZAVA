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
<a href="/member/insert">회원 가입</a> | 
<a href="/member/list">회원 목록</a> | 
<a href="/member/searchByName">회원 검색</a>

<script type="text/javascript">
	$(document).ready(function() {
		$("a").eq(2).click(function(event) {
			event.preventDefault();
			
			var username = prompt("회원명을 입력하세요.");
			
			var url = $(this).attr("href");
			
			location.assign(url+"/"+username);		
			
			
		});
	});
	


</script>
</body>
</html>