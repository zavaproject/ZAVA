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

	userid: ${vo.userid}<br>
	userpw: ${vo.userpw}<br>
	username: ${vo.username}<br>
	email: ${vo.email}<br>
	regdate: ${vo.regdate}<br>
	updatedate: ${vo.updatedate}<br>
	
	<button>수정화면</button> 	<button>삭제</button>
	<form>
		
	</form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("button").eq(0).click(function() {
				location.assign("/member/update/${vo.userid}");
			});
			
			
			$("button").eq(1).click(function() {
				var userpw = prompt("비밀번호를 입력하세요.");
				
				
				$("form").attr("method", "post");
				$("form").attr("action", "/member/delete");
				$("form").append('<input type="password" name="userpw" value="'+userpw+'">');
				$("form").append('<input type="hidden" name="userid" value="${vo.userid}">');
				$("form").submit();
			});
			
			
			
		});
	
	
	</script>

</body>
</html>