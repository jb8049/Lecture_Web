<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <h2>${ requestScope.id}님 환영합니다.</h2>  <!-- 공유 영역 활용, 그냥 ${id}로 해도됨  --> --%>
	<h2> ${param.id }님 환영합니다.</h2> <!-- 파라미터를 활용하는 방식 -->
	
	<!-- 파라미터 안넘겼는데도 나오네?.. user.jsp에 대한 내용으로 넘겼다고 하더라도,  -->
	<!-- request 객체를 공유하고 있음, 내 url은 안바뀌면서 하기 때문에! 굳이 파라미터에 대한 정보를 -->
	<!-- request 공유영역에 또는 파라미터로 올릴 필요없음, 다른 외부 정보를 사용하고 싶을 때아니면은 사용하지 않아도됨 -->
</body>
</html>