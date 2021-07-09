<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("utf-8");  /* post 방식은 body에 파라미터 전달, 인코딩 필요  */
	
	String cName = request.getParameter("cName");
	String cValue = request.getParameter("cValue");
	
	/* 한글을 입력했을 때 한글을 인코딩하고싶음 */
	cName = URLEncoder.encode(cName,"utf-8");
	cValue = URLEncoder.encode(cValue,"utf-8"); 
	
	// 쿠키 생성
	Cookie cookie = new Cookie(cName, cValue);	 
	
	// 생성된 쿠키를 전송, 클라이언트가 저장함
	response.addCookie(cookie);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>쿠키설정 완료</h2>
	<a href="get.jsp">설정된 쿠키 조회</a>
	
</body>
</html>