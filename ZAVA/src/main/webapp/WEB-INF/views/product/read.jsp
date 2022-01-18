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
<<<<<<< HEAD
<script src="/resources/js/review.js" type="text/javascript"></script>
=======
<script src="/resources/js/review.js?var=2" type="text/javascript"></script>
>>>>>>> 5e8cb62 (product 90%)
<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
<link href="../../../resources/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../header.jsp"/>
   <section>

<c:if test="${vo.category == 1010}">
<a href="/product/list/${vo.category}/"><h1>MAN TOP PRODUCT</h1></a>
</c:if>
<c:if test="${vo.category == 1020}">
<a href="/product/list/${vo.category}/"><h1>MAN PANTS PRODUCT</h1></a>
</c:if>
<c:if test="${vo.category == 2010}">
<a href="/product/list/${vo.category}/"><h1>WOMAN TOP PRODUCT</h1></a>
</c:if>
<c:if test="${vo.category == 2020}">
<a href="/product/list/${vo.category}/"><h1>WOMAN PANTS PRODUCT</h1></a>
</c:if>
<c:if test="${vo.category == 3010}">
<a href="/product/list/${vo.category}/"><h1>KID GIRL PRODUCT</h1></a>
</c:if>
<c:if test="${vo.category == 3020}">
<a href="/product/list/${vo.category}/"><h1>KID BOY PRODUCT</h1></a>
</c:if>
<div class="container">
<div style="float:right">
<<<<<<< HEAD
   NAME : <input name="pname" class="pname" readonly value="${vo.pname}"><br>
=======
   <h3>${vo.pname}</h3><br>
   <input type="hidden" name="pname" class="pname" readonly value="${vo.pname}">
>>>>>>> 5e8cb62 (product 90%)
   가격 : <input name="price" type="number" class="price" readonly value="${vo.price}"><br>
   옵션 :
    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="option" id="product-option">
         <option value="">--Please choose an option--</option>
         <c:forEach items="${ovo}" var="ovo">
         <option value="option" ${ovo.ostock == 0 ? "disabled" : ""}>색상 : ${ovo.ocolor} |사이즈 : ${ovo.osize} ${ovo.ostock == 0 ? "| 품절" : ""} </option>
        
         </c:forEach>
      </select>   
      <br>
<<<<<<< HEAD
      
   제품 설명 : <br><textarea rows="10" name="descript" readonly class="descript"> ${vo.descript}  </textarea>
   <br>
   <%--   <c:if test="${vo.mid == login.mid}"> --%>
   <button id="update" class="btn btn-warning btn-sm">제품 수정</button>
   <button id="delete" class="btn btn-danger btn-sm">제품 삭제</button><br>
<%-- </c:if> --%>
 </div>
 
 <div class="uploadedList row"></div>
 <br>
 
=======
      <div class="card" style="width:25rem;">
         <div class="card-body">
            <h5 class="card-title">제품 설명</h5>
            <textarea class="form-control" rows="15" maxlength="1000" name="descript" disabled>${vo.descript}</textarea> 
            <%-- <p style="width: 20rem;" class="descript card-text overflow-auto">${vo.descript}</p> --%>
         </div>
      </div>
   <hr>
   <div style="float:right" class="d-grid gap-2 d-md-block">
        <button class="btn btn-outline-success" type="button">장바구니</button>
        <button class="btn btn-success" type="button">상품구매</button><br>
   </div>
   
 </div>
>>>>>>> 5e8cb62 (product 90%)
 
   <%--   <c:if test="${vo.mid == login.mid}"> --%>
   <button id="update" class="btn btn-outline-warning btn-sm">제품 수정</button>
   <button id="delete" class="btn btn-outline-danger btn-sm">제품 삭제</button><br>
<%-- </c:if> --%>
 <div class="uploadedList">
 </div>
 <br>
 
<!--  로그인데이터 확인후 운영자만 나오게 -->

<<<<<<< HEAD

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
	
=======
   <div style="vertical-align:bottom; margin-top: 30px">
   <div style="float:left; margin-top: 30px">
   <button id="review_write" class="btn btn-info btn-sm">상품후기 작성</button>
   <button id="review_list" class="btn btn-outline-info btn-sm">상품후기 목록</button>
   <br>
   </div>

   <div class= "container">
   <table class ="table table-hover table-borderless">
      <thead>
         <tr>
                <th scope="col">NO</th>
            <th scope="col">SUBJECT</th>
            <th scope="col">NAME</th>
            <th scope="col">DATE</th>
            <th scope="col">평점</th>
            </tr>
            </thead>
      <tbody id="reviews">
      
      </tbody>
   </table>
   </div>
   </div>
>>>>>>> 5e8cb62 (product 90%)
<form>
   <input type="hidden" name="pid" value="${vo.pid}">
   <input type="hidden" name="category" value="${vo.category}">
</form>

</div>
   
   <script type="text/javascript">
   var pid = '${vo.pid}';
<<<<<<< HEAD
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
=======
         $(document).ready(function() {
             
         $("button#update").click(function() {
            $("form").attr("method","post")
            $("form").attr("action","/product/updateui")
            $("form").submit();
         });
            
            
         $("button#review_write").click(function(){
            if(${sessionScope.login == null}) {
                  alert("제품사용 후기를 작성하시려면 먼저 로그인 하셔야 합니다.");
                  document.location.href="/member/login";
                  return;
               } 
               location.assign("/review/insert/${vo.pid}");            
            });
            
            $("button#review_list").click(function(){
                  location.assign("/review/list/${vo.pid}/");            
               });
            
            
            
            
            
//             ---------------
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
         
         
//         ----------------------
         getReviewsPage(pid, 1, $("#reviews"));    

         $("#reviews").on("click", ".reply_page_left", function(event) {
            event.preventDefault();
            var curPage = $(this).attr("href");
            
            if(curPage > 1){
               
               getReviewsPage(pid, --curPage, $("#reviews"));
            }
            
            
         });
         
         $("#reviews").on("click", ".reply_page_right", function(event) {
            event.preventDefault();
            var curPage = $(this).attr("href");
            var totalPage = $(this).attr("data-totalPage");
            
            
            
            if(curPage < totalPage){
               
               getReviewsPage(pid, ++curPage, $("#reviews"));
            }
            
            
         });
         
         $("#reviews").on("click", ".reply_page_no", function() {
            var curPage = $(this).text();
            
            getReviewsPage(pid, curPage, $("#reviews"));
         });
   
      });
>>>>>>> 5e8cb62 (product 90%)
   
   </script>
    </section>
   <jsp:include page="../footer.jsp" />
   
</body>
</html>