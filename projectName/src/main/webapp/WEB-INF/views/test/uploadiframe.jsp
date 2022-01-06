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
  
  <style type="text/css">
  iframe{
  width: 0px;
  height: 0px;
  border: 0px;
  }
  
  
  </style>
  
  
  
</head>
<body>


<form action="/test/uploadiframe2" 
method="post" 
enctype="multipart/form-data"
target="iframe0"
>
	<input type="file" name="file">
	<input type="submit">
</form>

<iframe name="iframe0"></iframe>

<script type="text/javascript">
	function clearForm() {
		$("form")[0].reset();
	}





</script>

</body>
</html>