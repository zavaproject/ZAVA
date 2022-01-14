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
 <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
 <jsp:include page="../header.jsp"/>
   <section>
   후기상품 : <input name="pid" value="${vo.pid}" readonly> <br>
   작성자 : <input name="mid" value="${vo.mid}" readonly> <br>
   평점 : <input name="rating" value="${vo.rating}" readonly> <br>
   제목 : <input name="title" value="${vo.title}" readonly> <br>
   상품후기 : <input name="content" value="${vo.content}" readonly> <br>
   <br>
   
 
<!--  로그인데이터 확인후 운영자만 나오게 -->
<c:if test="${vo.mid == login.mid}">
   <button id="update" class="btn btn-warning btn-sm">후기 수정</button>
   <button id="delete" class="btn btn-danger btn-sm">후기 삭제</button>
</c:if>

<form>
	<input type="hidden" name="rno" value="${vo.rno}">
</form>

   
   <script type="text/javascript">
   		$(document).ready(function() {
			$("button#update").click(function() {
				$("form").attr("method","post")
				$("form").attr("action","/review/updateui")
				$("form").submit();
			});
			
			$("button#delete").click(function() {
				$("form").attr("method","post")
				$("form").attr("action","/review/delete/${vo.pid}")
				$("form").submit();
			});
		
		});
   
   </script>
   
     </section>
   <jsp:include page="../footer.jsp" />
</body>
</html>