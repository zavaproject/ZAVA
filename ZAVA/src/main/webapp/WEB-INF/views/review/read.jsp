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
 <jsp:include page="../member/header.jsp"/>
   <section>
   <div class="container">
 <h3><font color="#555555"></font>${vo.mid}님의 상품후기</h3>
 <br>
 <a href="/product/read/${vo.pid}">상품으로 돌아가기</a>
 <div style="float: right;">
 <c:if test="${vo.mid == login.mid}">
   <button id="update" class="btn btn-warning btn-sm">후기 수정</button>
   <button id="delete" class="btn btn-danger btn-sm">후기 삭제</button>
</c:if>
</div>
 <table class="table" style="margin-top: 30px;">
<colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
   <tr>
		<th scope="row">후기상품</th>
          <td style="text-align: left;"> ${vo.pid} </td>
   </tr>
	<tr>
		<th scope="row">작성자</th>
          <td style="text-align: left;">${vo.mid}</td>
   </tr>
	<tr>
		<th scope="row">평점</th>
          <td style="text-align: left;"> ${vo.rating} </td>
   </tr>
   <tr>
		<th scope="row">제목</th>
          <td style="text-align: left;"> ${vo.title} </td>
   </tr>
   <tr>
		<th scope="row">상품후기</th>
          <td style="text-align: left;"> ${vo.content} </td>
   </tr>
</tbody>
</table>   
<!--  로그인데이터 확인후 운영자만 나오게 -->

</div>
 

<form>
   <input type="hidden" name="rno" value="${vo.rno}">
</form>

   
   <script type="text/javascript">
         $(document).ready(function() {
         $("button#update").click(function() {
            $("form").attr("method","post")
            $("form").attr("action","/review/updateui/${curPage}")
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