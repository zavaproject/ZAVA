<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<title>고객 목록</title>
</head>
<body>
	<jsp:include page="../member/header.jsp" />
	<section>
		<h1>고객 목록</h1>
		<table id="table">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pt.list}" var="member">
					<tr>
						<td><a href="/member/read/${member.mid}">${member.mid}</a></td>
						<td>${member.mname}</td>
						<td>${member.mgender}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="page.jsp"/>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>