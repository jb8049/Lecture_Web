<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 	session.removeAttribute("member");


	session.invalidate();   /* 삭제를 하니까 member라는 객체가 null을 가져서 <%= member.getId 이게 null 나옴 */
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 삭제 완료</h2>
	<a href="get.jsp">삭제된 세션 조회</a>
</body>
</html>