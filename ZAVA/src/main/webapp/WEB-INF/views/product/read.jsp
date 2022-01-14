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
<script type="text/javascript" src="/resources/js/product.js"> </script>
<script src="/resources/js/review.js" type="text/javascript"></script>
<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
<link href="../../../resources/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../header.jsp"/>
   <section>

<c:if test="${vo.category == 1010}">
<h1>MAN TOP PRODUCT</h1>
</c:if>
<c:if test="${vo.category == 1020}">
<h1>MAN PANTS PRODUCT</h1>
</c:if>
<c:if test="${vo.category == 2010}">
<h1>WOMAN TOP PRODUCT</h1>
</c:if>
<c:if test="${vo.category == 2020}">
<h1>WOMAN PANTS PRODUCT</h1>
</c:if>
<c:if test="${vo.category == 3010}">
<h1>KID GIRL PRODUCT</h1>
</c:if>
<c:if test="${vo.category == 3020}">
<h1>KID BOY PRODUCT</h1>
</c:if>
<div class="container">
<div style="float:right">
   NAME : <input name="pname" class="pname" readonly value="${vo.pname}"><br>
   가격 : <input name="price" type="number" class="price" readonly value="${vo.price}"><br>
   
   옵션 :
    <select name="option" id="product-option">
         <option value="">--Please choose an option--</option>
         <c:forEach items="${ovo}" var="ovo">
         <option value="option" ${ovo.ostock == 0 ? "disabled" : ""}>색상 : ${ovo.ocolor} |사이즈 : ${ovo.osize} ${ovo.ostock == 0 ? "| 품절" : ""} </option>
        
         </c:forEach>
      </select>   
      <br>
      
   제품 설명 : <br><textarea rows="10" name="descript" readonly class="descript"> ${vo.descript}  </textarea>
   <br>
   <%--   <c:if test="${vo.mid == login.mid}"> --%>
   <button id="update" class="btn btn-warning btn-sm">제품 수정</button>
   <button id="delete" class="btn btn-danger btn-sm">제품 삭제</button><br>
<%-- </c:if> --%>
 </div>
 
 <div class="uploadedList row"></div>
 <br>
 
 
 <a href="/product/list/${vo.category}">목록</a>
 
<!--  로그인데이터 확인후 운영자만 나오게 -->


	<button id="review_write" class="btn btn-success btn-sm">상품후기 작성</button>
	<button id="review_list" class="btn btn-info btn-sm">상품후기 목록</button>
	
	<table class ="mt-5">
   		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody id="reviews">
		
		</tbody>
   </table>
	
<form>
	<input type="hidden" name="pid" value="${vo.pid}">
	<input type="hidden" name="category" value="${vo.category}">
</form>

</div>
   
   <script type="text/javascript">
   var pid = '${vo.pid}';
   		$(document).ready(function() {
   			
getReviews(pid, $("#reviews"));
   			
			$("button#update").click(function() {
				$("form").attr("method","post")
				$("form").attr("action","/product/updateui")
				$("form").submit();
			});
   			
   			
			$("button#review_write").click(function(){
				if(${sessionScope.login == null}) {
						alert("제품사용 후기를 작성하시려면 먼저 로그인 하셔야 합니다.");
						return;
					} 
					location.assign("/review/insert/${vo.pid}");				
				});
				
				$("button#review_list").click(function(){
						location.assign("/review/list/${vo.pid}");				
					});
   			
   			
   			
   			
   			
//    			---------------
   			$.getJSON("/productimg/getAttach/"+pid, function(farr) {
   				for(var key in farr){
   					
   					if (farr[key][0] == null) {
   						return;
   					}
   					var filename = farr[key];
   					
   					
   					
   					for(var i =0; i<filename.length; i++){
   					var msg = uploadedItemForRead(farr[key][i]);
   					$(".uploadedList").append(msg);
   					}
   				}
   			});
   			
			$("button#update").click(function() {
				$("form").attr("method","post")
				$("form").attr("action","/product/updateui")
				$("form").submit();
			});
			$("button#delete").click(function() {
				$("form").attr("method","post")
				$("form").attr("action","/product/delete")
				$("form").submit();
			});
		});
   
   </script>
    </section>
   <jsp:include page="../footer.jsp" />
   
</body>
</html>