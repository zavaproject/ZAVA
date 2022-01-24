<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../member/header.jsp" />
		<section>
			<h1>고객정보</h1>
				<table id="table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>주소</th>
							<th>상세주소</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${vo.mid}</td>
							<td>${vo.mname}</td>
							<td>${vo.mgender}</td>
							<td>${vo.mphonenumber}</td>
							<td>${vo.memail}</td>
							<td>${vo.address}</td>
							<td>${vo.detailAddress}</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${login.mcode == 0}">
					<button class="button">수정</button>
					<button class="button">계정 삭제</button>
					<form></form>
				</c:if>
			</section>
		<jsp:include page="../footer.jsp" />
		
			<script type="text/javascript">
		$(document).ready(function() {
			$("button").eq(0).click(function() {
				location.assign("/member/update/${vo.mid}");
			});
			$("button").eq(1).click(function() {
				var mpw = prompt("비밀번호를 입력하세요.");
				
				$("form").attr("method", "post");
				$("form").attr("action", "/member/delete");
				$("form").append('<input type="password" name="mpw" value="'+mpw+'">');
				$("form").append('<input type="hidden" name="mid" value="${vo.mid}">');
				$("form").submit();
			});
		});
	</script>
	</body>
</html>