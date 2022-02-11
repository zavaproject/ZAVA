<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="../../../resources/css/style.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<jsp:include page="../member/header.jsp" />
	<section>
		<table class="login">
			<thead>
				<tr>
					<th style="width: 50%">
						<h2>
							<span>로그인</span>
						</h2>
						<form action="/member/login" method="post">
							id: <input name="mid"><br>
							pw: <input type="password" name="mpw"><br>
							<div id="logincheck"></div>
							<input type="submit" value="login" id="login">
						</form>
					</th>
					<th style="border: none;">
						<h2>
							<span>등록</span>
						</h2> <strong>ZAVA</strong> 회원으로 가입하시면 빠르고 편리하게 이용하실 수 있습니다.<br>
						아직 <strong>ZAVA</strong> 의 회원이 아니시라면 간편하게 가입하실 수 있습니다.
						<div>
							<button class="insert button"><strong>계정 만들기</strong></button>
						</div>
					</th>
				</tr>
			</thead>
		</table>
	</section>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#login").click(function(event) {
				event.preventDefault();
				var id = $("[name='mid']").val();
				if (id == '') {
					$("[name='mid']").focus();
					return;
				}
				var pw = $("[name='mpw']").val();
				if (pw == '') {
					$("[name='mpw']").focus();
					return;
				}
				$.getJSON("/member/logincheck/"+id+"/"+pw, function(data) {
					$("#logincheck").empty();
		           if(data > 0){
		        	   $("form").submit();
		        	}else{
			        	var msg = "아이디와 비밀번호가 일치하지 않습니다."
			        		$("#logincheck").append(msg);
			        	return;
		         	}
		         });

			});
			
			$("body").on("click", ".insert", function() {
				location.assign("/member/insert");
			});
		});
	</script>
</body>
</html>