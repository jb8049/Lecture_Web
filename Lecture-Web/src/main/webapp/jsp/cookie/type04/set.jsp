<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	

	/* 원하는 경로에 쿠키 생성 */
	/* 쿠키이름, 쿠키값 설정 */
	
	Cookie c = new Cookie("type01", URLEncoder.encode("/ 루트설정", "utf-8")); 
	c.setPath("/"); /* 이 경로 아래로 모두 쿠키를 설정 */
	
	Cookie c2 = new Cookie("type02", URLEncoder.encode("/Lecture-Web/jsp/cookie 루트설정","utf-8"));
	c2.setPath("/Lecture-Web/jsp/cookie");
	
	Cookie c3 = new Cookie("type03", URLEncoder.encode("/Lecture-Web/jsp/cookie/type03 루트설정","utf-8"));
	c3.setPath("/Lecture-Web/jsp/cookie/type03");
	
	Cookie c4 = new Cookie("type04", URLEncoder.encode("/Lecture-Web/jsp/cookie/type04 루트설정","utf-8"));
	c4.setPath("/Lecture-Web/jsp/cookie/type04");

	
	Cookie cookie = new Cookie("cookieName", "cookieValue");  /* 쿠키명으로 뽑기 */
	
	
	/* 쿠키 만들어준 뒤, 사용자 컴퓨터에 저장해야함  */
	response.addCookie(c);
	response.addCookie(c2);
	response.addCookie(c3);
	response.addCookie(c4);
	
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
	<a href="get.jsp">설정된 쿠키조회 </a>
</body>
</html>