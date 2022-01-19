<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/test.js" type="text/javascript"></script>
  <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">

 <style type="text/css">
	#replyContainer{
		margin-top: 20px;
		display: none;
	}
	
	.uploadedItemForReadP{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	}
	
	.notice_table{
	border:0;
	}
</style>

</head>
<body>
<jsp:include page="../header.jsp"/>
   <section>        

 
<div class="container">
 <h2><font color="#555555">NOTICE</font> </h2>
            <p>공지사항입니다.</p>
 <table class="notice_table">
<colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
   <tr>
		<th scope="row">번호</th>
          <td> ${vo.bno} </td>
   </tr>
	<tr>
		<th scope="row">제목</th>
          <td>${vo.title}</td>
   </tr>
	<tr>
		<th scope="row">작성자</th>
          <td> ${vo.writer} </td>
   </tr>
   <tr>
		<th scope="row">작성일</th>
          <td> ${vo.updatedate} </td>
   </tr>
   <tr>
		<th scope="row">조회</th>
          <td> ${vo.viewcnt} </td>
   </tr>
</tbody>
</table>   

   <hr>
<textarea class="form-control" rows="15" maxlength="1000" name="content" disabled>${vo.content}</textarea> 
 <br>
   <button class="updateui">수정 화면</button> 
<button class="delete">삭제</button> 
<button>목록</button> 
</div>




<script type="text/javascript">
var bno = ${vo.bno};



$(document).ready(function(){
	
	
	$("body").on("click", ".updateui", function() {
		location.assign("/board/updateui/${vo.bno}/${curPage}");
	});
	
	$("body").on("click", ".delete", function() {
		$("[name='fordelete']").attr("action", "/board/delete/${vo.bno}/${curPage}");
		$("[name='fordelete']").attr("method", "post");
		$("[name='fordelete']").submit();
	});
	
		
	
	$("button").eq(2).click(function() {
		location.assign("/board/list/${curPage}");
	});
});
</script>
</section>
   <jsp:include page="../footer.jsp" />

</body>
</html>