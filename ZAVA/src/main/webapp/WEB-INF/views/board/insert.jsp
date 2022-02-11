<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE insert</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  
</head>
<body>
  <jsp:include page="../member/header.jsp"/>
   <section>
<h1>공지사항 등록</h1>

<form action="/board/insert" method="post">
<div class="container">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input class="form-control" name="title" id="exampleFormControlInput1" placeholder="제목을 입력해 주세요">
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">작성자</label>
  <input class="form-control" name="mid" id="exampleFormControlInput1" value="${login.mid}" readonly>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="10"></textarea>
</div>
	<input type="submit" value="글 작성 완료">
</div>
</form>




<script type="text/javascript">
	$(document).ready(function() {
			
		
		$("input[type='submit']").click(function(event) {
			event.preventDefault();
			
			var title = $("[name='title']").val();
			if(title == ''){
				$("[name='title']").focus();
				return;
			}
			
			var mid = $("[name='mid']").val();
			if(mid == ''){
				$("[name='mid']").focus();
				return;
			}
			
			var content = $("[name='content']").val();
			if(content == ''){
				 $("[name='content']").focus();
				return;
			}
			
			
			
			$("form").submit();
			
		});
	});
	
	


</script>



</section>
   <jsp:include page="../footer.jsp" />

</body>
</html>