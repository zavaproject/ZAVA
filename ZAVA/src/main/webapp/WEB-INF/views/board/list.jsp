<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZAVA NOTICE</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="../quickmenu.jsp"/>
   <section>
	<div class="container">
 <h2><font color="#555555">NOTICE</font> </h2>
 	<c:if test="${login.mcode == 1}">
	<a style="float: right" href="/board/insertui">공지사항 작성</a>
	</c:if>
	<table class="table">
		<thead>
			<tr>
				<th>NO</th>
				<th>TITLE</th>
				<th>POSTED BY</th>
				<th>DATE</th>
				<th>VIEW</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pt.list}" var="vo">
				<tr>
					<td style="text-align: left;">${vo.bno}</td>
					<td style="text-align: left;"><a href="/board/read/${vo.bno}/${pt.curPage}">${vo.title}</a></td>
					<td style="text-align: left;">${vo.mid}</td>
					<td style="text-align: left;">${vo.updatedate}</td>
					<td style="text-align: left;">${vo.viewcnt}</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
</div>
<jsp:include page="../member/page.jsp"/>
 </section>
   <jsp:include page="../footer.jsp" />
</body>
</html>