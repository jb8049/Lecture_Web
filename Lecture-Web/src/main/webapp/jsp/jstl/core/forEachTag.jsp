<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String[] names ={"홍길동","강길동","윤길동","박길동"};

	pageContext.setAttribute("names", names);
	
	pageContext.setAttribute("namesLength", names.length);  /*length를 등록시켜놓고..  */
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<%-- <c:forEach begin="0" end="${ namesLength-1 }" var="i">  <!--length를 scriptlet으로  -->
		
		<c:if test="${ i ne 0 }">   <!-- i가 0이 아닐 때만 콤마찍기..  -->
			,
		</c:if>
		${ names[i] }
	
	</c:forEach> --%>
	
	
	<%-- <c:set var="cnt" value="0" />
	
	<c:forEach items="${ names }" var="name">
		<c:if test="${ cnt != 0 }">
			,
		</c:if>
		${ name }
		<c:set var="cnt" value="${ cnt + 1 }" />
	</c:forEach>
	
	<c:remove var="cnt" scope="page" /> <!--필요없는 cnt변수 지워주기  --> --%>
	
	
	<!--varStatus 루프를 돌 때마다 상태 정보를 확인할 수 있음 -->
	<c:forEach items="${ names }" var="name" varStatus="loop">
		 <!-- 몇 번째 인덱스에 접근하고 있는지! -->
		${ loop.first } : ${ loop.index } : ${ loop.count } : ${ loop.last }<br>
	</c:forEach>
	
	<c:forEach items="${names }" var="name" varStatus="loop">
		<%-- <c:if test="${ loop.index ne 0 }"> --%>
		<%-- <c:if test="${ loop.count ne 1 }"> --%>
		
		<c:if test="${ not loop.first }">
			,
		</c:if>
		${ name }	
	</c:forEach>
	
	
	
	
	
	 
	<h2>1~10사이의 정수 출력</h2>
	
	<%-- <%
		for(int i = 1 ; i <=10; i++)
			out.write(i + "<br>");
	%> --%>
	
	<c:forEach begin="1" end="10" var = "i">
		${ i }<br>   <!--공유 영역에 객체가 올라간 것이고, 다끝나면 객체를 삭제함=> 여기 변수i는 forEach문안에서만!  -->
	</c:forEach>
	
	년도 선택 :
	<select>
		<c:forEach begin="1940" end="2021" var="year">
			<option>${ year }</option>
		</c:forEach>
	</select>
	
</body>
</html>