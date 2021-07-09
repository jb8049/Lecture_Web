<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String  id = session.getId();
	
	int interval = session.getMaxInactiveInterval();
	
	// 세션 유효시간 변경(2초)
	session.setMaxInactiveInterval(2);
	int interval2 = session.getMaxInactiveInterval();
	
	long time = session.getLastAccessedTime(); /* 마지막으로 세션에 access한 시간, 마지막으로 접속한 시간!!  */
	String pattern = "yyyy년 MM월 dd일 hh시 mm분 ss초";
	
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>기존의 유효시간 : <%= interval %> 초</h2>
	<h2>변경된 유효시간 : <%= interval2 %> 초</h2>
	<h2>세션 id(JSESSIONID) : <%= id  %></h2> <!-- 새로고침한다고해서 바뀌는건 아님 -->
	<h2>마지막 접근 시간 : <%=sdf.format(time)  %> </h2>
</body>
</html>