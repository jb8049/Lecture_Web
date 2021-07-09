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
	
	<h2>1~10 사이의 임의의 정수 출력</h2>
	<%
		/* java.util.Random r = new java.util.Random(); */
		Random r = new Random();  /* 지시자를 통해 import해서 가능  */
		
		
		int random = r.nextInt(10) + 1 ;
	%>
	
	추출된 정수 : <%= random %> <br>   <!-- out.print에 비해 편하다는 느낌을 받아야함..-->
	
</body>
</html>








