<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 이렇게 하면 나한테 보여지는 쿠키만 지울 수 있음.. 현재 여기서는 t03은 못지운다
	/* Cookie [] cookies = request.getCookies(); */
	
	
	/* 쿠키 유지 기간을 0으로 해버리면, 됨  */
	Cookie c = new Cookie("type01", URLEncoder.encode("/ 루트설정", "utf-8"));
	c.setPath("/");
	c.setMaxAge(0);
	
	Cookie c2 = new Cookie("type02", URLEncoder.encode("/Lecture-Web/jsp/cookie 루트설정","utf-8"));
	c2.setPath("/Lecture-Web/jsp/cookie");
	c2.setMaxAge(0);
	
	Cookie c3 = new Cookie("type03", URLEncoder.encode("/Lecture-Web/jsp/cookie/type03 루트설정","utf-8"));
	c3.setPath("/Lecture-Web/jsp/cookie/type03");
	c3.setMaxAge(0);
	
	Cookie c4 = new Cookie("type04", URLEncoder.encode("/Lecture-Web/jsp/cookie/type04 루트설정","utf-8"));
	c4.setPath("/Lecture-Web/jsp/cookie/type04");
	c4.setMaxAge(0);
	
	response.addCookie(c);
	response.addCookie(c2);
	response.addCookie(c3);
	response.addCookie(c4);
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 삭제 완료</h2>
	<a href="get.jsp">설정된 쿠키 조회</a>
</body>
</html>