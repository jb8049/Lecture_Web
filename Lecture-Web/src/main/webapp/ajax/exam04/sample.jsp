<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getMethod().equals("POST"))
	request.setCharacterEncoding("utf-8");
%>
[
	{
		id: 'hong',
		name: '홍길동'
	},
	{
		id: 'kang',
		name: '강길동'
	},
	{
		id: 'park',
		name: '박길동'
	}
]