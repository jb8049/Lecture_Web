<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
	String[] names ={"홍길동","강길동","윤길동","박길동"};

	pageContext.setAttribute("names", names);
	
	pageContext.setAttribute("namesLength", names.length);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- <c:forEach begin="0" end="${namesLength-1 }" var="i" >
		
		${names[i]}	
		<c:if test="${ i != namesLength-1 }">
			,
		</c:if>
	
	</c:forEach>
	 --%>
	
	<c:set var="cnt" value="0" />
	

	<c:forEach items="${names}" var="name">
		
		<c:if test="${ cnt !=0 }">
		,
		</c:if>
		${ name }
		
		<c:set var="cnt" value= "${ cnt + 1 }" />
	
	
	</c:forEach>
	
	
	

</body>
</html>