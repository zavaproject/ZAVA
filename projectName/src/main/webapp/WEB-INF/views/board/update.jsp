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
  		height: 150px;
  		border: 1px solid red;
  		margin-bottom: 20px;
  	}
  	
  	.uploadedItemP{
  		overflow: hidden;
  		white-space: nowrap;
  		text-overflow: ellipsis
  	}
  
  
  </style>
  
</head>
<body>

<h1>글 수정 화면</h1>

<form action="/board/update/${vo.bno}/${curPage}" method="post">

	제목: <input name="title" value="${vo.title}"><br>
	작성자: <input name="writer" value="${vo.writer}"><br>
	내용<br>
	<textarea rows="10" name="content">${vo.content}</textarea><br>
	<input type="submit" value="글 수정 완료">
</form>

	<div class="fileDrop"></div>


	<div class="uploadedList row">

	</div>
<script type="text/javascript">

	var bno = ${vo.bno};
	
	$(document).ready(function() {
		
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
				url : "/test/uploadajaxNdb/"+bno,
				dataType: "text",
				data : formData,
				processData : false,
				contentType : false,
				success : function(filename) {
					var msg = uploadedItem(filename);
					
					$(".uploadedList").append(msg);
				}
			});
		});
		
		
		
		$(".uploadedList").on("click", ".deleteitem", function() {
			var msg = "[글 수정 완료] 버튼과 상관 없이 파일과 데이터가 즉각적으로 삭제됩니다.\n삭제하시겠습니까?";
			
			var isDelete = confirm(msg);
			if(!isDelete){
				return;
			}
			
			var clickedDeleteItem = $(this);
			var filename = clickedDeleteItem.attr("data-filename");
			
			$.ajax({
				type : "post",
				url : "/test/deletefileNdb",
				dataType : "text",
				data : {
					filename : filename
				}, 
				success : function(result) {
					if(result == "SUCCESS"){
						clickedDeleteItem.parent().parent().remove();
					}else{
						alert("삭제 실패");
					}
				}
			});
			
		});
		
		
		
		$.getJSON("/test/getAttach/"+bno, function(arr) {
			for(var i=0;i<arr.length;i++){
				var filename = arr[i];
				var msg = uploadedItem(filename);
				$(".uploadedList").append(msg);
			}
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
			
			$("form").submit();
			
		});
	});
	
	


</script>





</body>
</html>