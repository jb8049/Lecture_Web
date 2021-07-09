<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>결과화면</h2>
	
	<c:if test="${ param.id eq 'admin' }">
		<%
			response.sendRedirect("admin.jsp");  /* 재요청 하도록 보낸다.  */ 
		%> 										<!--서버가 클라이언트에게 요청하라고 보내므로, response -->
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<%
			response.sendRedirect("user.jsp?id= " + request.getParameter("id")) ;
		%>
	
	</c:if>
	
	
</body>
</html>