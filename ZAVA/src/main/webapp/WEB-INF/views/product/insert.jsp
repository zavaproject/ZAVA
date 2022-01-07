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

</head>
<body>
<div>
	<h1>제품등록</h1>
	<form action="" method="post"> <br>
		등록 ID : <input name="mid" maxlength="33" class="mid"><br>
		제품 ID : <input name="pid" maxlength="33" class="pid"><br>
		제품 NAME : <input name="pname" maxlength="30" class="pname"><br>
		카테고리 :
<!-- 		 <input name="category" type="number" class="category"><br> -->
		
		<select name="category" class="category">

         <option value="1010" selected>MAN TOP</option>
         <option value="1020" >MAN PANTS</option>
         <option value="2010" >WOMAN TOP</option>
         <option value="2020" >WOMAN PANTS</option>
         <option value="3010" >KIDS GIRL</option>
         <option value="3020" >KIDS BOY</option>
		</select>   
		<br>
		

		제품 가격 : <input name="price" type="number" class="price"><br>
		
		제품 설명 : <br><textarea rows="10" name="descript" maxlength="1000" class="descript"></textarea>
		
	</form>
	
	<form>
	<h3>옵션</h3>
			옵션 코드 : <input class="ocode" name="ocode" maxlength="33"> ex) aa제품 빨강 90사이즈 = aa-r-90<br>
			재고 : <input class="ostock" name="ostock" type="number" maxlength="33"><br>
			사이즈 : <input class="ocolor" name="ocolor" maxlength="33"><br>
			색상 : <input class="osize" name="osize" maxlength="33"><br>
			
	</form>
	
	
 </div>
<button>추가</button>
	<input type="submit" value="제품등록완료" id="product_add">
	
<script type="text/javascript">


	$(document).ready(function() {
		var arr = $("form");
		
		
		
		
		$("button").click(function() {
			arr = $("form");
			var msg = form();
			$("div").append(msg);
			
		});

		$("#product_add").click(function() {
	
			arr = $("form");
			var mid = $(arr[0]).children("input.mid").val();
			var pid = $(arr[0]).children("input.pid").val();
			var pname = $(arr[0]).children("input.pname").val();
			var category = $(arr[0]).children("select.category").val(); 
			var price = $(arr[0]).children("input.price").val(); 
			var descript = $(arr[0]).children("textarea.descript").val();
			
			$.ajax({
				type : "post",
				url : "/options/pinsert",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					mid : mid,
					pid : pid,
					pname : pname,
					category : category,
					price : price,
					descript : descript
				}),
				success : function(result) {
			
			for(var i = 1; i < arr.length; i++){
	
				 	var ocode = $(arr[i]).children("input.ocode").val();
					var ostock = $(arr[i]).children("input.ostock").val();
					var ocolor = $(arr[i]).children("input.ocolor").val();
					var osize = $(arr[i]).children("input.osize").val(); 


					$.ajax({
						type : "post",
						url : "/options",
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : "text",
						data : JSON.stringify({
							pid : pid,
							ocode : ocode,
							ostock : ostock,
							ocolor : ocolor,
							osize : osize
						}),
						success : function(result) {
							location.assign("/product/list/"+category);
						}

					});
			}
			
			console.log(result);
				}

		 });

	});
	});
</script>

</body>
</html>