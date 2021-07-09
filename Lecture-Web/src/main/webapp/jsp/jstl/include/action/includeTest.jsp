<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="common.jsp" %>

<%
	request.setAttribute("id", "hong"); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	msg : <%= msg %><br>
	id : ${ id }<br>
	phone : ${ phone }<br> <!--인클루드 하기 전에 phone을 찍으면 안나오지!  -->
	
	<h2>인클루드 전</h2>
	<h3>파라미터 미설정</h3>
	
	<jsp:include page="one.jsp" />
	<strong>파라미터 설정</strong>
	
	<jsp:include page="one.jsp">
		<jsp:param name="name" value="hong gil-dong"/>
		<jsp:param name="age" value="30"/>
	</jsp:include>

	<h2>인클루드 후</h2>
	phone : ${ phone }<br>
</body>
</html>