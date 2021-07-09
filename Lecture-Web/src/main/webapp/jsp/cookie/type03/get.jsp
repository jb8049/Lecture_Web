<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%
	

	Cookie[] cookies = request.getCookies(); 

	StringBuilder sb = new StringBuilder();
	
	for(Cookie c : cookies){
		
		String cName = c.getName();
		String cValue = c.getValue();
		
	// 인코딩해준 것을 디코딩 해주어야 값이 제대로 나옴!!
		
		cName = URLDecoder.decode(cName,"utf-8");
		cValue = URLDecoder.decode(cValue,"utf-8");
		
		sb.append("쿠키이름 : " + cName + ", ");
		sb.append("쿠키값 : " + cValue + "<br>");
		
	
	}
	
	pageContext.setAttribute("cookieData", sb.toString()); /*jsp 표현식 사용하지 않고, 공유 영역에 등록  */
	
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