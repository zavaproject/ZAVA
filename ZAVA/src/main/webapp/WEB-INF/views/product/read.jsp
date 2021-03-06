<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.pname}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/product.js"> </script>
<script src="/resources/js/review.js?var=2" type="text/javascript"></script>
<link href="../../../resources/css/product.css" rel="stylesheet" type="text/css">
   <style type="text/css">
  .star2{
  color:#f90;
  } 
   
  .star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
  </style>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="../quickmenu.jsp"/>
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
   <h3>${vo.pname}</h3><br>
   <input type="hidden" name="pname" class="pname" readonly value="${vo.pname}">
   ?????? : <input name="price" type="number" class="price" readonly value="${vo.price}"><br>
   ?????? :
    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="option" id="product-option">
         <option value="">--Please choose an option--</option>
         <c:forEach items="${ovo}" var="ovo">
         <option value="${ovo.ocode}" ${ovo.ostock == 0 ? "disabled" : ""}>?????? : ${ovo.ocolor} |????????? : ${ovo.osize} |?????? : ${ovo.ostock == 0 ? "??????" : ovo.ostock} </option>
         </c:forEach>
      </select>   
      <br>
   <!-- ?????? ??????(??????) -->
   ?????? :
    	<input name="pcnt" id="pcnt" type="number" min="1">
    <br>
      
      <br>
      <div class="card" style="width:25rem;">
         <div class="card-body">
            <h5 class="card-title">?????? ??????</h5>
            <textarea class="form-control" rows="15" maxlength="1000" name="descript" disabled>${vo.descript}</textarea> 
            <%-- <p style="width: 20rem;" class="descript card-text overflow-auto">${vo.descript}</p> --%>
         </div>
      </div>
   <hr>
   <div style="float:right; margin-right: 30px;" class="d-grid gap-2 d-md-block">
        <button class="btn btn-outline-success addCart" type="button">??? ??? ??? ???</button>
        <!-- <button class="btn btn-success" type="button">????????????</button><br> -->
   </div>
   
 </div>
 
   <c:if test="${login.mcode == 1}">
   <button id="update" class="btn btn-outline-warning btn-sm">?????? ??????</button>
   <button id="delete" class="btn btn-outline-danger btn-sm">?????? ??????</button><br>
	</c:if> 
 <div class="uploadedList">
 </div>
 <br>
 
<!--  ?????????????????? ????????? ???????????? ????????? -->

   <div style="vertical-align:bottom; margin-top: 30px">
   <div style="float:left; margin-top: 30px">
   <button id="review_write" class="btn btn-info btn-sm">???????????? ??????</button>
   <button id="review_list" class="btn btn-outline-info btn-sm">???????????? ??????</button>
   <br>
   </div>

   <div class= "container">
   <table class ="table table-hover table-borderless">
      <thead>
         <tr style="text-align: center;">
            <th scope="col">NO</th>
            <th scope="col" style="text-align: left;">RATING</th>
            <th scope="col">SUBJECT</th>
            <th scope="col">NAME</th>
            <th scope="col">DATE</th>
            </tr>
            </thead>
      <tbody id="reviews">
      
      </tbody>
   </table>
   </div>
   </div>
<form>
   <input type="hidden" name="pid" value="${vo.pid}">
   <input type="hidden" name="category" value="${vo.category}">
</form>

</div>
   
   <script type="text/javascript">
   var pid = '${vo.pid}';
         $(document).ready(function() {
             
         $("button#update").click(function() {
            $("form").attr("method","post")
            $("form").attr("action","/product/updateui")
            $("form").submit();
         });
            
            
         $("button#review_write").click(function(){
            if(${sessionScope.login == null}) {
                  alert("???????????? ????????? ?????????????????? ?????? ????????? ????????? ?????????.");
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
        	 var delConfirm = confirm("????????? ?????????????????????????")
        	 if(delConfirm){
            $("form").attr("method","post")
            $("form").attr("action","/product/delete")
            $("form").submit();
         }
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
   
         /* ???????????? */
			$(".addCart").click(function() {
			var ocode = $("select[name=option] > option:selected").val();
			var pcnt = $("input[name=pcnt]").val();
			
			if(ocode == ''){
				alert("?????? ????????? ??????????????????.");
				return false;
			}

			var data = {
					pid : pid,
					ocode : ocode,
					pcnt : pcnt
					/* ????????? ?????? ?????? */
			};
			
			$.ajax({
				url : "/cart/insert",
				type : "post",
				data : data,
				success : function(result) {
					
					console.log(result);
					cartAlert(result)
					}
			})
		});
      
			function cartAlert(result){
				if(result == 1){
					alert("??????????????? ?????????????????????.");
					$("#product-option").val("");
					$("#pcnt").val("1");
					var confirm_val = confirm("?????? ?????? ??????, ??????????????? ?????????????????????????");
					if(confirm_val){
					location.assign("/cart/list");
					}
				} else if(result == 2){
					alert("??????????????? ?????? ??????????????? ????????????.");
					$("#product-option").val("");
					$("#pcnt").val("1");
				} else if(result == 0){
					alert("???????????? ???????????????.");
					var confirm_val = confirm("????????? ???????????? ?????? ???????????????????");
					if(confirm_val){
						location.replace("/member/login")
					}
				}
			}
      });
   
   </script>
    </section>
   <jsp:include page="../footer.jsp" />
   
</body>
</html>