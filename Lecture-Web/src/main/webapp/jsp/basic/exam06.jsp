<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Random" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>	
	<%
		Enumeration<String> headerNames = request.getHeaderNames();    // 커서 놔두고 컨트롤+스페이스 하면 임포트 가능
		/* 순환자? 이름을 모아놓은 주소값 */
		while(headerNames.hasMoreElements()){ /*예전에 배운 hasNext와 동일한 의미, 있으면 함 */
			String headerName = headerNames.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
		
		<%= headerName %> : <%= headerValue %><br>
	<%
		}
	%>
		
		
		

</body>
</html>








