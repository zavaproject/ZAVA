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
  
  
  <script src="/resources/js/test.js" type="text/javascript"></script>
  
  <style type="text/css">
  	.fileDrop{
  		width: 100%;
  		height: 250px;
  		border: 1px solid red;
  	}
  
  
  </style>
  
  
</head>
<body>
<h1>TestAjax</h1>


<button id="btn1">btn1</button>

<div class="fileDrop">


</div>


<div class="uploadedList row">

</div>

<form action="/board/insert" method="post">



	제목: <input name="title"><br>
	작성자: <input name="writer"><br>
	내용<br>
	<textarea rows="10" name="content"></textarea><br>
	<input type="submit" value="글 작성 완료">
	

</form>




<script type="text/javascript">

	var objFormData = {};
	
	$(document).ready(function() {
		
		$(".uploadedList").on("click", ".deleteitem", function(event) {
			
			
			$(this).parent().parent().remove();
			var filename = $(this).attr("data-filename");
					
			delete objFormData[filename];
			
			
			
		});
		
		
		
		
		$("input[type='submit']").click(function(event) {
			event.preventDefault();
			
			
			var title = $("[name='title']").val();
			if(title == ''){
				$("[name='title']").focus();
				return;
			}
			
			var writer = $("[name='writer']").val();
			if(writer == ''){
				$("[name='writer']").focus();
				return;
			}
			
			var content = $("[name='content']").val();
			if(content == ''){
				 $("[name='content']").focus();
				return;
			}
			
			for(filename in objFormData){
				
				var msg = insertFile(filename);
				
				$("form").prepend(msg);
			}
			
			
			
			
			
			for(filename in objFormData){
				var formData =objFormData[filename];
				formData.append("filename", filename);
				
				$.ajax({
					type : "post",
					url : "/test/uploadajax2",
					dataType : "text", 
					data : formData,
					processData : false, 
					contentType : false,
					success : function(filename) {
						
					}
				});
				
			}
			
			$("form").submit();
			
		});
		
		
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file= files[0];
			
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				type : "post",
				url : "/test/uploadajax",
				dataType : "text", 
				data : formData,
				processData : false, 
				contentType : false,
				success : function(filename) {
					var msg = uploadedItem(filename);
					$(".uploadedList").append(msg);
					
					$.ajax({
						type : "post",
						url : "/test/deletefile",
						dataType : "text", 
						data : {
							"filename": filename
						},
						success : function(result) {
							objFormData[filename] = formData;		
							
							
						}
						
					});
				}
			});
			
			
			
			
		});
		
		
		
		
		$("#btn1").click(function() {
			$.ajax({
				type : "post", 
				url : "/test/test1",
				dataType : "text", 
				data : {
					"text" : "hello"
				}, 
				success : function(result) {
					
					$.ajax({
						type : "post",
						url : "/test/test2",
						dataType : "text", 
						data : {
							"result" : result
						}, 
						success : function(data) {
							alert(data);
						}
					});
					
					
					
				}
			});
		});
		
		
	
		
		
	});


</script>


</body>
</html>