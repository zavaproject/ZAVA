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

<button>click1</button>
<button>click2</button>
<button>click3</button>
<p></p>

<script type="text/javascript">

	$(document).ready(function() {
		
		
		$("button").eq(2).click(function() {
			var data1 = "hello";
			var data2 = "world";
			var data3 = [
				{name : "john", age : 10, address : "seoul"},
				{name : "smith", age : 20, address : "NY"}
			];
			
			$.ajax({
				type : "post",
				url : "/trc/test3",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text", 
				data : JSON.stringify({
					data1 : data1,
					data2 : data2,
					data3 : data3
				}),
				success : function(result) {
					result = JSON.parse(result);
					console.log(result);
					
					var arr = result["data3"];
					for(var i=0;i<arr.length;i++){
						
						console.log(arr[i]["name"], arr[i]["age"], arr[i]["address"]);
					}
				}
			});
			
			
			
			
			
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$("button").eq(1).click(function() {
			var data1 = "hello";
			var data2 = "world";
			var data3 = "good";
			
			$.ajax({
				type : "post",
				url : "/trc/test2",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text", 
				data : JSON.stringify({
					data1 : data1,
					data2 : data2,
					data3 : data3
				}),
				success : function(result) {
					
					result = JSON.parse(result);
					
					console.log(result["data1"], result["data2"], result["data3"]);
										 
				}
			});
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$("button").eq(0).click(function() {
			var data1 = "hello";
			
			$.ajax({
				type : "post",
				url : "/trc/test1",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					data1 : data1
				}), 
				success : function(result) {
					console.log(result);
					$("p").text(result);
				}
			});
			
			
			
			
			
			
			
			
			
		});
		
		
		
		
		
	});


</script>

</body>
</html>