<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#msgView {
		border : 1px solid red;
		height: 200px;
		width : 500px;
	}
	
</style>


<script>

	let httpRequest = null
	
	function requestMsg(){
		
		// 1단계 : XMLHttpRequest 객체 생성
		if(window.XMLHttpRequest)
			httpRequest = new XMLHttpRequest()
		else if(window.ActiveXObject) //최소한의 안전장치, 없으면 여기서 들고와
			httpRequest = new ActiveXObject("Microsoft.XMLHttp")
		else
			httpRequest = null
			
		// 2단계 : callback 함수 설정, responseMsg 뒤에 괄호 붙으면 안됨
		httpRequest.onreadystatechange = responseMsg
		
	
		// 3단계 : 서버에 비동기 요청
		httpRequest.open('GET', 'hello.jsp', true)
		httpRequest.send(null)
		
	}
	
	function responseMsg(){
		
		if(httpRequest.readyState == 4){ // 서버에서 응답이 완료되었다면
			
			// 1,2,3,4 로 변경됨, 여기 State는 대문자 주의
			// alert(httpRequest.readyState)
			// 계속 호출되고있다..!, 그러나 우리는 전송이 완료된 경우(4)에만 궁금함!
			
			// 서버의 응답이 완료되었고, 상태가 '성공'인 경우(응답 결과가 올바른 경우)
			if(httpRequest.status == 200 ){
				let msgView = document.getElementById("msgView")
				
				// innerHTML을 써줘야 태그를 인식할 수 있음
				// msgView.innerHTML은 div태그인데, div태그안으로 hello.jsp의 내용이 들어갔음
				msgView.innerHTML = httpRequest.responseText
				// msgView.innerHTML += httpRequest.responseText => hello.jsp의 내용 들고옴
				// 누를 때마다 붙일 수 있음 
			}
			
		}
		
	}
	

</script>

</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<input type="button" value="서버에서 자료요청" onclick="requestMsg()"> 
	
</body>
</html>