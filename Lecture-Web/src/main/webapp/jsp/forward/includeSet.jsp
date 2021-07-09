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

	<h2>결과화면</h2>  <!--out을 공유하기 때문에 같은 내용이 출력됨  -->
	<c:if test="${ param.id eq 'admin' }">  
	
		<jsp:include page="admin.jsp" />
	
	</c:if>
</body>
</html>