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
</head>
<body>
<div></div>
<button>1</button>
<button>2</button>
<button>3</button>


<script type="text/javascript">
	$(document).ready(function() {
		$("button").eq(0).click(function() {
			$.getJSON("/trc/test100", function(result) {
				
				
				$("div").append(result["name"]);
			});
		});	
		
		
		$("button").eq(1).click(function() {
			$.getJSON("/trc/test200", function(result) {
				for(var i =0; i<result.length;i++){
					var msg = result[i];
					$("div").append("<br>"+msg);
				}
			});
		});	
		
		
		$("button").eq(2).click(function() {
			$.getJSON("/trc/test300", function(result) {
				for(var i=0;i<result.length;i++){
					var obj = result[i];
					
					var rno = obj["rno"];
					var bno = obj["bno"];
					var replyer = obj["replyer"];
					var reply = obj["reply"];
					var updatedate = obj["updatedate"];
					var msg = rno +":"+bno+":"+replyer+":"+reply+":"+updatedate+"<br>";
					$("div").append(msg);
					
					
				}
			});
		});	
		
				
	});
</script>








</body>
</html>