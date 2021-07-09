<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setAttribute("phone", "010-1111-2222");
%>


	<hr>
		request 공유영역 id : ${id}<br>
		<strong>날라온 파라미터 정보</strong>
		name : ${ param.name }<br> 
		age: ${ param.age }<br>
		<h3>인클루드된 내용</h3>
		<h3>인클루드된 내용</h3>
		<h3>인클루드된 내용</h3>
		<h3>인클루드된 내용</h3>
		<h3>인클루드된 내용</h3>
	<hr>