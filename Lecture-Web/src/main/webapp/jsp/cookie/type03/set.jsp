<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("utf-8");  /*post 방식은 body에 파라미터 전달, 인코딩 필요  */
	
	String cName = request.getParameter("cName");
		   cName = URLEncoder.encode(cName,"utf-8");
			
	String cValue = request.getParameter("cValue");
		   cValue = URLEncoder.encode(cValue,"utf-8"); 
		   
	String cAge = request.getParameter("cAge");
		
	// 쿠키 생성
	Cookie cookie = new Cookie(cName, cValue);
	
	
	// cookie객체에 대한 유효 시간 설정
	if(cAge != null && cAge.length() !=0 ){ /* 사용자가 입력을 했을 경우  cAge.length() != 0 이거 안해주면 오류 cAge=& 이렇게 날아 올 수 있음 */ 
		cookie.setMaxAge(Integer.parseInt(cAge) * 60 ); /* 입력받을 때 분단위로 받음, 그렇지만 setMaxAge는 초임 그래서 *60해주어야함 */
	}
	
	// 생성된 쿠키를 전송
	response.addCookie(cookie);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>쿠키설정 완료</h2>
	<a href="get.jsp">설정된 쿠키 조회</a>
	
</body>
</html>