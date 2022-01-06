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
  		height: 200px;
  		border: 1px solid red;
  	}
  
  
  </style>
  
  
  
</head>
<body>
	<form name="insertform">
	</form>


	<div class="fileDrop"></div>
	<div class="uploadedList row">
	</div>

	<script type="text/javascript">
	
		
		$(document).ready(function() {
			
			
			$(".uploadedList").on("click", ".deleteitem", function() {
				var clickedDeleteItemBtn = $(this);
				
				
				
				var filename = $(this).attr("data-filename");

				$.ajax({
					type : "post",
					url : "/test/deletefile",
					dataType: "text", 
					data:{
						filename : filename
					},
					success : function(result) {
						if(result == "SUCCESS"){
							clickedDeleteItemBtn.parent().parent().remove();
							var deletefiles = deleteFile(filename);
							
							$("form[name='insertform']").append(deletefiles);
						}else{
							alert("삭제 실패");
						}
					}
				});
				
			});
			
			
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			
			
			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				
				var files = event.originalEvent.dataTransfer.files;
				
				var file = files[0];
				
				var formData = new FormData();
				formData.append("file", file);
				
				
				$.ajax({
					type : "post",
					url : "/test/uploadajax",
					dataType : "text",
					data: formData,
					processData : false,
					contentType : false,
					success : function(data) {
						
						var item = uploadedItem(data);
						
						$(".uploadedList").append(item);
						
						
						var inputfiles = insertFile(data);
						$("form[name='insertform']").append(inputfiles);
						
					}
					
				});
				
				
				
			});
			
			
		});
	
	
	
	</script>


</body>
</html>