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
	#replyContainer{
		margin-top: 20px;
		display: none;
	}
	
	.uploadedItemForReadP{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	
	}

</style>


</head>
<body>

bno : ${vo.bno}<br>
writer : ${vo.writer}<br>
date : ${vo.regdate} | ${vo.updatedate}<br>
viewcnt : ${vo.viewcnt}<br>
title : ${vo.title}<br>
content :<br>
<textarea rows="10" readonly>${vo.content}</textarea> <br>


<div class="uploadedList row">

</div>


<button class="updateui">수정 화면</button> 
<button class="delete">삭제</button> 
<button>목록</button> 
<button id="btn_replyui_show">댓글화면</button><br>

<form name="fordelete"></form>


<div id="replyContainer">
	작성자: <input id="replyer"><br>
	댓글: <input id="reply"><br>
	<button id="btn_reply_input">댓글 완료</button>	
</div>




<div id="replies" class="mt-5">

</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
            
        <h5 class="modal-title" id="staticBackdropLabel">

        <span id="sp_replyui_rno">11</span>
        

        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<p id="sp_replyui_replyer">홍길동</p>
      	
      	<div class="form-group">
      		<input class="form-control" id="div_replyui_reply" value="안녕하세요.">
      	</div>
      	
      	
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn_replyui_update">댓글 수정 완료</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
var bno = ${vo.bno};



$(document).ready(function(){
	
	
	$.getJSON("/test/getAttach/"+bno, function(result) {
		for(var i=0;i<result.length;i++){
			var filename = result[i];
			var msg = uploadedItemForRead(filename);
			$(".uploadedList").append(msg);
		}
	});
	
	

	getRepliesPage(bno, 1, $("#replies"));
	
	
	$("#replies").on("click", ".reply_page_left", function(event) {
		event.preventDefault();
		var curPage = $(this).attr("href");
		
		if(curPage > 1){
			
			getRepliesPage(bno, --curPage, $("#replies"));
		}
		
		
	});
	
	$("#replies").on("click", ".reply_page_right", function(event) {
		event.preventDefault();
		var curPage = $(this).attr("href");
		var totalPage = $(this).attr("data-totalPage");
		
		
		
		if(curPage < totalPage){
			
			getRepliesPage(bno, ++curPage, $("#replies"));
		}
		
		
	});
	
	$("#replies").on("click", ".reply_page_no", function() {
		var curPage = $(this).text();
		
		getRepliesPage(bno, curPage, $("#replies"));
	});
	
	
	$("#replies").on("click", ".btn_reply_delete", function() {
		var rno = $(this).attr("data-rno");
		
		$.ajax({
			type : "delete",
			url : "/replies/"+rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : "text",
			success : function(result) {
				if(result == "SUCCESS"){
					alert("삭제되었습니다.");
					getAllReplies(bno, $("#replies"));
				}
			}
		});
		
	});
	
	
	
	$("#btn_replyui_update").click(function() {
		var rno = $("#sp_replyui_rno").text();
		var reply = $("#div_replyui_reply").val();
		
		$.ajax({
			type : "put",
			url : "/replies/"+rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			dataType : "text",
			data : JSON.stringify({
				reply : reply
			}), 
			success : function(result) {
				if(result == "SUCCESS"){
					alert("수정되었습니다.");
					getAllReplies(bno, $("#replies"));
				}
			}
		});
	});
	
	
	
	$("#replies").on("click", ".btn_reply_updateui_form", function() {
		
		var rno = $(this).attr("data-rno");
		$("#sp_replyui_rno").text(rno);
		
		var replyer = $(this).attr("data-replyer");
		$("#sp_replyui_replyer").text(replyer);
			
		var reply = $(this).prev("p").text();
		$("#div_replyui_reply").val(reply);
		
		
		$("#staticBackdrop").modal("show");
	});
	
	
	
	
	$("#btn_reply_input").click(function() {
		var replyer = $("#replyer").val();
		var reply = $("#reply").val();
		
	
		
		$.ajax({
			type : "post",
			url : "/replies",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				reply : reply
			}), 
			success : function(result) {
				if(result=="SUCCESS"){
					$("#replyer").val("");
					$("#reply").val("");
					$("#replyContainer").hide();
					
					getAllReplies(bno, $("#replies"));
					
				}
				
			}
		});
		
		
	});
	

	$("#btn_replyui_show").click(function() {
		$("#replyContainer").toggle();
	});

	
	
	$("body").on("click", ".updateui", function() {
		location.assign("/board/updateui/${vo.bno}/${curPage}");
	});
	
	$("body").on("click", ".delete", function() {
		$("[name='fordelete']").attr("action", "/board/delete/${vo.bno}/${curPage}");
		$("[name='fordelete']").attr("method", "post");
		$("[name='fordelete']").submit();
	});
	
		
	
	$("button").eq(2).click(function() {
		location.assign("/board/list/${curPage}");
	});
});
</script>


</body>
</html>