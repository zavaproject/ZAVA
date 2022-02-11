<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="/resources/js/product.js"> </script>
 <link href="../../../resources/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="../quickmenu.jsp"/>
   <section>
<c:if test="${category == 1010}">
<h1>MAN TOP PRODUCT</h1>
</c:if>
<c:if test="${category == 1020}">
<h1>MAN PANTS PRODUCT</h1>
</c:if>
<c:if test="${category == 2010}">
<h1>WOMAN TOP PRODUCT</h1>
</c:if>
<c:if test="${category == 2020}">
<h1>WOMAN PANTS PRODUCT</h1>
</c:if>
<c:if test="${category == 3010}">
<h1>KID GIRL PRODUCT</h1>
</c:if>
<c:if test="${category == 3020}">
<h1>KID BOY PRODUCT</h1>
</c:if>

<div class="container">


			<div class="uploadedList row"></div>
 <jsp:include page="../member/page.jsp"/>
</div>
<%
   List<String> list = (List<String>)request.getAttribute("pidlist");
   
   ObjectMapper mapper = new ObjectMapper();
   String strList = mapper.writeValueAsString(list);
   
   pageContext.setAttribute("strList", strList);
   
   
%>


<script type="text/javascript">
	
	var arr = '${strList}';
	var category = ${category};
	arr = eval(arr);

	for (var i = 0; i < arr.length; i++) {
		var pid = arr[i];
		
		console.log(pid)

		$.getJSON("/productimg/getAttach2/" + pid, function(farr) {
			
			
			

			console.log(farr)
			for(var key in farr){
				console.log(key);
				var pname = key
				
				for(var key2 in farr[key]){
					
					console.log(farr[key][key2]);
				if (farr[key][key2][0] == null) {
					farr[key][key2][0] = 'aaa.txt';
				}
				console.log(farr[key][key2][0]);
				var keyarr = [key2,key];
				console.log(keyarr)
				var msg = uploadedItemForRead2(farr[key][key2][0],keyarr);
				$(".uploadedList").append(msg);
			}
			}
// 			var filename = farr.get();
			

// 			var msg = uploadedItemForRead2(filename, pid);
// 			$(".uploadedList").append(msg);

		});
	}
</script>

</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>