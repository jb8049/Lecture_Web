<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); /*post방식은 우선 encoding부터 설정  */
	
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 세션 등록
	
	session.setAttribute("id", id);
	session.setAttribute("password", password);  
	
	// 아이디와 패스워드를 가지는 '클래스'를 만들 수 있지 않을까?!
	
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 설정 완료</h2>
	<a href="get.jsp">설정된 세션 정보 조회</a>
</body>
</html>