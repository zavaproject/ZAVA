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
<title>상품후기목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <jsp:include page="../member/header.jsp"/>
  <jsp:include page="../quickmenu.jsp"/>
   <section>
<h3>상품후기</h3>

<div class="table-responsive" style="width:70%; margin-left: 350px">
<a href="/product/read/${pid}">상품으로 돌아가기</a>
   <table class ="table table-hover table-borderless mt-5">
   <thead>
         <tr>
                <th scope="col">NO</th>
            <th scope="col">SUBJECT</th>
            <th scope="col">NAME</th>
            <th scope="col">DATE</th>
            <th scope="col">평점</th>
            </tr>
            </thead>
         <tbody>
         <c:forEach items="${rlist}" var="list">
         <tr>
               <td>${list.rno}</td>
               <td><a href="/review/read/${list.rno}/${pt.curPage}">${list.title}</a></td>
               <td>${list.mid}</td>
               <td>${list.updatedate}</td>
               <td>${list.rating}</td>
                </tr>
         </c:forEach>
           
            </tbody>
        </table>    
        
        <jsp:include page="../member/page.jsp"/>
     </div>       
</section>
   <jsp:include page="../footer.jsp" />
</body>
</html>