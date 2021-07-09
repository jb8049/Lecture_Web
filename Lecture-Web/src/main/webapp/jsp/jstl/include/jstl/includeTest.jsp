<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="id" value="hong" scope="request"/> <!-- scope지정안하면 page영역, 자신의 페이지에서만 볼 수 있음 -->
 	msg : <%= msg %>
	<h2>인클루드 전</h2>
	<h1>파라미터 미설정</h1>
	<c:import url="one.jsp"/>
	
	<h1>파라미터 설정</h1>
	
	<c:import url="one.jsp">   <!-- action include와 유사하게 사용할 수 있음! 가장 큰 차이는   -->
		<c:param name="name" value="hong, gil-dong" />
	</c:import>
	<h2>인클루드 후</h2>
</body>
</html>