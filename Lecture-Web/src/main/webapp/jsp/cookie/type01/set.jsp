<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*post 방식으로 날아오는 것 => 문자 인코딩 해야함!!!  */
	
	request.setCharacterEncoding("utf-8");
	
	String cName = request.getParameter("cName");
	String cValue = request.getParameter("cValue");
	
	// 쿠키 생성
	Cookie cookie = new Cookie(cName, cValue);	 /* 서블릿 코드에 이미 선언되어있음, 임포트할 필요없음 */
	
	
	// 생성된 쿠키를 전송, 서버에서 쿠키 생성 => 클라이언트에게 저장함
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