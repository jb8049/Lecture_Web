<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%
	Cookie[] cookies = request.getCookies();   /* 자신이 가지고 있는 쿠키  */
	
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
	
	${ cookieData }<br>
	
	<!-- set에서 설정한 "cookieName" 이름을 얻으려면 또 .name해야함 -->
	쿠키명 : ${ cookie.cookieName.name }<br>  <!--set.jsp에서 Cookie cookie  = new Cookie("cookieName", "cookieValue");c  -->
	쿠키값 : ${ cookie.cookieName.value }<br> <!--특정한 쿠키의 이름과 값을 가져온다  -->
	<a href="remove.jsp">쿠키 삭제</a>
	
	
	

</body>
</html>