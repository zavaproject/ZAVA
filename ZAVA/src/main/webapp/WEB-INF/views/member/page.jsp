<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<nav>
<div class="container">
  <ul class="pagination">
  <li>	
      <a href="1">FIRST</a>
    </li>
    <li>
      <a href="${pt.curPage>1?pt.curPage-1:1}">&lt;</a>
    </li>
    <c:forEach begin="${pt.beginPageNum}" end="${pt.endPageNum}" var="i">
    	<li class="${pt.curPage==i?'active':'' }"><a href="${i}">${i}</a></li>
    </c:forEach>
    <li>
		<a href="${pt.curPage<pt.totalPage?pt.curPage+1:pt.totalPage}">&gt;</a>		
    </li>
    <li>
		<a href="${pt.totalPage}">LAST</a>
    </li>
  </ul>
  </div>
</nav>