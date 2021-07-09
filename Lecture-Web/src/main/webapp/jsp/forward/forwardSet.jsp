<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>결과화면</h2>  <!--포워드를 시키니까 결과화면 이라는 글자는 사라짐-->
	<c:if test="${ param.id eq 'admin' }">  <!--id가 admin일 때, url은 admin.jsp가 아니고, forwardSet.jsp로됨  -->
		<jsp:forward page="admin.jsp" />
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<%-- <c:set var="id" value="${ param.id }" scope="request"/>  <!-- ~님 환영합니다.하기 위해 request영역에 등록 --> --%>
		<jsp:forward page="user.jsp" />
			<%-- <jsp:param name="id" value="${ param.id }" />  <!--이번엔 파라미터로 넘겨보자!, 그런데 굳이 안넘겨도 됨... --> --%>
			<!--변수를 공유 영역에 저장할 필요도, 인자를 따로 넘겨줄 필요도 없다 -->
			<!-- url이 변경이 안되서 그대로 param.id를 user.jsp에서 사용할 수 있기 때문임 -->
	</c:if>
	
	
</body>
</html>