<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%
	


	Cookie[] cookies = request.getCookies();
	
	StringBuilder sb = new StringBuilder();
	
	
	for(Cookie c : cookies){
		
		String cName = c.getName();
		String cValue = c.getValue();
		
		
		/* 인코딩 되어있는 쿠키들을 디코딩 해야함 */
		cName = URLDecoder.decode(cName,"utf-8");
		cValue = URLDecoder.decode(cValue,"utf-8");
		
		sb.append("쿠키이름 : " + cName +", ");
		sb.append("쿠키값 : " + cValue + "<br>");
		
		
	}
	
	pageContext.setAttribute("cookieData",sb.toString());





	
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설정된 쿠키 정보</h2>  <!--위에서 설정한 sb어떻게 출력?  -->
	<%-- <%= sb.toString() %> --%>
	
	${ cookieData }
	
	<a href="makeForm.jsp">쿠키 설정 이동</a>
	
	
</body>
</html>