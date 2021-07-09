<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>




<body>
	<h2>1~10사이의 정수 출력</h2>
	<%
		for(int i=0; i<=10; i++){ // jsp가 서블릿으로 바뀌면, jsp가 서블릿 안으로 들어가기 때문에 out을 사용할 수 있는 것이다
			out.write(i + "<br>");   /* jsp가 서블릿으로 변환되서 서블릿으로 실행되기 때문에! jsp에 서블릿의 문법을 쓸 수 있는 것이다 */
		}
	%>	
	
</body>
</html>