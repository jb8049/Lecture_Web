<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	let httpRequest = null
	
	//객체 생성하는거, 안전장치 이런것도 적어줘야되서 귀찮..
	//함수로 하자
	function getXMLHttpRequest(){
		
		let httpRequest = null
		
		if(window.XMLHttpRequest)
			httpRequest = new XMLHttpRequest()
		else if(window.ActiveXObject) //최소한의 안전장치, 없으면 여기서 들고와
			httpRequest = new ActiveXObject("Microsoft.XMLHttp")
		else
			httpRequest = null
			
		return httpRequest
		
	}
	
	
	function sendProcess(param){ // name에 들어가는 param
		
		httpRequest = getXMLHttpRequest()
		
		// 콜백 함수 호출
		httpRequest.onreadystatechange = callbackFunction
		
		let msg = "===========================\n"
		msg += "/Lecture-Web/exam02/param.js?name=" + param + "\n"
		
		debugTrace(msg)
		
		// 익스플로러에서 동작 시, param 한글로 보내면, 1비트로 쪼개서 이상하게 나옴
		// 모든 웹브라우저에서 동작하도록 만들기 위해
		param = encodeURIComponent(param)
		
		//요청하기 위해 필요한 url
		let url = "param.jsp?name=" + param
				
		httpRequest.open('GET', url, true) // 비동기 방식이니까 true
		httpRequest.send(null) //get방식은 파라미터가 url에 붙어서 날아가니까 null
	}
	
	// ready state가 바뀔 때마다
	function callbackFunction() {
		
		let msg = ''
		
		// 0은 open 메소드 실행 전
		// 1은 open 메소드 실행, send는 실행하지 않음
		// 2는 send 메소드가 실행됨
		// 3은 서버가 요청을 파악함, 클라이언트야 너에게 응답을 할꺼야 헤더를 넘김
		// 4
		switch(httpRequest.readyState){
		
			case 1 :
				msg += 'Loading...\n'
				break;
			case 2 : 
				msg += 'Loaded...\n'
				break;
			case 3 :
				msg += 'Interactive...\n'
				break;
			case 4 :
				msg += 'Completed...\n'
				
				if(httpRequest.status == 200) {
					msg += '웹서버에서 정상적으로 수행..\n'
					msg += '실행결과 : ' + httpRequest.responseText + '\n'
					
				}else {
					
					msg += '웹서버에서 오류 발생...\n'
					msg += '오류코드 : ' + httpRequest.status + '\n'
				}
				
				msg += "===========================\n"
				
				
				break;
				
		}
		
		debugTrace(msg)
		
		
	}
	
	function debugTrace(msg) {
		
		let debug = document.getElementById("debug")
		debug.value += msg
		
	}


</script>

</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<button onclick="sendProcess('hong gil-dong')">영문인자호출</button>
	<button onclick="sendProcess('홍길동')">한글인자호출</button>
</body>
</html>