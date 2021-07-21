<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("POST")) // 대소문자 구분하지 않고 비교
		request.setCharacterEncoding("utf-8");
%>
name=${ param.name }
