<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록하기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/product.js"> </script>
<link href="../../../resources/css/product.css" rel="stylesheet" type="text/css">

<style type="text/css">
  	.fileDrop{
  		width: 100%;
  		height: 200px;
  		border: 1px solid red;  	
  		margin-top: 20px;
  	}

  </style>
 <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <jsp:include page="../member/header.jsp"/>
   <section>
<div class="container">
	<h1>제품등록</h1>
	<form action="" method="post" name="insertform"> <br>
		등록 ID : <input name="mid" maxlength="33" class="mid" value="${login.mid}" readonly><br>
		제품 ID : <input name="pid" maxlength="33" class="pid"><br> <button id="pidcheck">중복검사</button><br>
<p id="pidCheckResult"></p>
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
	
	<div class="fileDrop">
		</div>

	<div class="uploadedList row">
	</div>
	
	<form>
	<h3>옵션</h3>
			옵션 코드 : <input class="ocode" name="ocode" maxlength="33"> ex)제품ID-색상-사이즈<br>
			재고 : <input class="ostock" name="ostock" type="number" maxlength="33"><br>
			색상 : <input class="ocolor" name="ocolor" maxlength="33"><br>
			사이즈 : <input class="osize" name="osize" maxlength="33"><br>			
	</form>
	
	<div class="option_button">
	</div>

<button id="optionadd">추가</button>
	<input type="submit" style="float:right" value="제품등록완료" id="product_add">
	
</div>
	
<script type="text/javascript">


	$(document).ready(function() {
		var arr = $("form");


		$("#pidcheck").click(function(event) {
			event.preventDefault();
			
			var pid = $("[name='pid']").val();
			
			if(pid == ''){
				$("[name ='pid']").focus();
			}else{
				$.ajax({
					type : 'post',
					url : '/product/pidcheck',
					data : {
						'pid' : pid
					},
					dataType : 'text',
					success : function(result) {
						
						$("p#pidCheckResult").text(result);
						
					}
				});
			}
			
		});	
		
		$("#optionadd").click(function() {
			arr = $("form");
			var msg = form();
			$(".option_button").append(msg);
			
		});

		$("#product_add").click(function() {
			
			arr = $("form");
			var mid = $(arr[0]).children("input.mid").val();
			var pid = $(arr[0]).children("input.pid").val();
			var pname = $(arr[0]).children("input.pname").val();
			var category = $(arr[0]).children("select.category").val(); 
			var price = $(arr[0]).children("input.price").val(); 
			var descript = $(arr[0]).children("textarea.descript").val();
			
			var arrDeleteItem = $(".deleteitem");
			for(var i=0;i<arrDeleteItem.length;i++){
				var filename = $(arrDeleteItem[i]).attr("data-filename");
				var msg = insertFile(filename)
				$("form[name='insertform']").append(msg);

			}
			var inputArr = $("form > input[name='insertfiles']");
			var insertfiles = [];
			for(var i=0; i<inputArr.length; i++){
				insertfiles.push(inputArr[i].value);
			}
			
			if(pid == ''){
				$("[name='pid']").focus();
				return;
			}else if(pname == ''){
				$("[name='pname']").focus();
				return;
			}else if(price == ''){
				$("[name='price']").focus();
				return;
			}else if(descript == ''){
				$("[name='descript']").focus();
				return;
			}else{
			
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
					descript : descript,
					insertfiles : insertfiles
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
			
							location.assign("/product/list/"+category+"/");
						}

					});
			}
			
			console.log(result);
				}

		 });

			}
			
	});
		
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
			var file = files[0]
			
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				type : "post",
				url : "/productimg/uploadajax",
				dataType : "text",
				data : formData,
				processData : false,
				contentType: false,
				success : function(result) {
					var msg = uploadedItem(result);
					$(".uploadedList").append(msg);
				}
			});
		});
		
		
		$(".uploadedList").on("click", ".deleteitem", function() {
			var clikckedDeleteItemBtn = $(this);
			var filename = $(this).attr("data-filename");
			
			$.ajax({
				type : "post",
				url : "/productimg/deletefile",
				dataType : "text", 
				data : {
					filename : filename
				}, 
				success : function(result){
					if(result == "SUCCESS"){
						clikckedDeleteItemBtn.parent().parent().remove();
					}else{
						alert("삭제 실패");
					}
				}
			});
		});
		
	});
</script>
</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>