<%@page import="java.io.BufferedReader"%>
<%@page import="java.awt.image.BufferedImageFilter"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전송된 정보 출력</h2>
	
<%
	InputStreamReader isr = new InputStreamReader (request.getInputStream(),"utf-8");
	BufferedReader br = new BufferedReader(isr); /*한 라인씩 읽어오는 메소드가 있었지만, 한 번에 편하게  */
	
	while(true){
		String data = br.readLine();
		if(data == null) break;
		out.println(data + "<br>");
	}
	
	
	
%>
	
</body>
</html>