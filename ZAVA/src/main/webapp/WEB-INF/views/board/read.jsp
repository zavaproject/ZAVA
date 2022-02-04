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
  <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="../quickmenu.jsp"/>
<section>        

 
<div class="container">
 <h2><font color="#555555">NOTICE</font> </h2>
 <table class="table">
<colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
   <tr>
		<th scope="row">NO</th>
          <td style="text-align: left;"> ${vo.bno} </td>
   </tr>
	<tr>
		<th scope="row">TITLE</th>
          <td style="text-align: left;">${vo.title}</td>
   </tr>
	<tr>
		<th scope="row">POSTED BY</th>
          <td style="text-align: left;"> ${vo.mid} </td>
   </tr>
   <tr>
		<th scope="row">DATE</th>
          <td style="text-align: left;"> ${vo.updatedate} </td>
   </tr>
   <tr>
		<th scope="row">VIEW</th>
          <td style="text-align: left;"> ${vo.viewcnt} </td>
   </tr>
</tbody>
</table>   

   <hr>
<textarea class="form-control" rows="30" maxlength="1000" name="content" disabled>${vo.content}</textarea> 
 <br>
 <button class="btn btn-outline-warning btn-sm">목록</button> 
 <div style="float: right;">
  	<c:if test="${login.mcode == 1}">
 <button class="updateui btn btn-outline-danger btn-sm">수정</button>
 <button class="delete btn btn-outline-danger btn-sm" name="fordelete">삭제</button>
	</c:if>
 </div>
</div>
<form name="fordelete"></form>




<script type="text/javascript">
var bno = ${vo.bno};



$(document).ready(function(){
	
	
	$("body").on("click", ".updateui", function() {
		location.assign("/board/updateui/${vo.bno}/${curPage}");
	});
	
	$("body").on("click", ".delete", function() {
		var delConfirm = confirm("공지사항을 삭제하시겠습니까?")
		if(delConfirm){
		$("[name='fordelete']").attr("action", "/board/delete/${vo.bno}/${curPage}");
		$("[name='fordelete']").attr("method", "post");
		$("[name='fordelete']").submit();
		}
	});
	
		
	
	$("button").eq(0).click(function() {
		location.assign("/board/list/${curPage}");
	});
});
</script>
</section>
   <jsp:include page="../footer.jsp" />

</body>
</html>