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
	
	
	function sendProcess(method,param){ // name에 들어가는 param
		
		httpRequest = getXMLHttpRequest()
		
		// 콜백 함수 호출
		httpRequest.onreadystatechange = callbackFunction
		
		let msg = "===========================\n"
		msg += method + "/Lecture-Web/exam02/param2.jsp?name=" + param + "\n"
		
		debugTrace(msg)
		
		let url = 'param2.jsp'
		param = encodeURIComponent(param)
		let args = 'name=' + param
		
		if(method == 'GET'){
			httpRequest.open(method, url + '?' + args, true)
			httpRequest.send(null)
		}else if(method =='POST'){ //form태그를 쓰는 경우에만 POST방식으로 날아가는 것
			httpRequest.open(method,url,true)
			httpRequest.setRequestHeader('Content-type','application/x-www-form-urlencoded')
			httpRequest.send(args)
			
		}
		
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
	<form method="post" action="" enctype="application/x-www-form-urlencoded">
	</form>
	
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<button onclick="sendProcess('GET','hong gil-dong')">GET방식영문인자호출</button>
	<button onclick="sendProcess('GET','홍길동')">GET방식한글인자호출</button>
	<button onclick="sendProcess('POST','hong gil-dong')">POST방식영문인자호출</button>
	<button onclick="sendProcess('POST','홍길동')">POST방식한글인자호출</button>
</body>
</html>