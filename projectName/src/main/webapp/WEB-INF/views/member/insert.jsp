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
<form action="/member/insert" method="post">
userid: <input name="userid"><button id="idcheck">중복검사</button><br>
<p id="idCheckResult"></p>
userpw: <input name="userpw" type="password"><br>
username: <input name="username"><br>
email: <input type="email" name="email"><br>
<input type="submit" value="회원 등록">
</form>

<script type="text/javascript">
	$(document).ready(function() {
		$("#idcheck").click(function(event) {
			event.preventDefault();
			
			var userid = $("[name='userid']").val();
			
			if(userid == ''){
				$("[name ='userid']").focus();
			}else{
				$.ajax({
					type : 'post',
					url : '/member/idcheck',
					data : {
						'userid' : userid
					},
					dataType : 'text',
					success : function(result) {
						
						$("p#idCheckResult").text(result);
						
					}
				});
			}
			
		})		
	});
</script>









</body>
</html>