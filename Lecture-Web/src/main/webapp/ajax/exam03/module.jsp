<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="httpRequest.js"></script>

<script>
	function clickBtn(){
		
		// httpRequest = getXMLHttpRequest()
		// alert(httpRequest)
		
		let name = document.inputForm.name.value
		let age = document.inputForm.age.value
		let addr = document.inputForm.addr.value
		
		// 비동기 통신
		// 1단계
		// sendProcess('POST','sample.jsp',"name=hong&age=24&addr=서울시 서초구",callback)
		
		// 2단계
		//let params = 'name=' + name + '&age=' + age + '&addr=' + addr
		//sendProcess('GET',sample.jsp,params, callback )
		
		// 3단계, JSON 형식으로 넘겨보자
		//let params = { name : '홍순이', age : 30, addr : '경기도 광명시' }
		let params = { name : name, age : age, addr : addr }
		sendProcess('GET','sample.jsp',params, callback)
		
	}
	
	function callback(){
		
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
	<h2>XMLHTTPRequest 모듈을 이용한 예제</h2>
	<form name="inputForm">
	<textarea rows="10" cols="80" id="debug"></textarea>
	이름 : <input type ="text" name = "name">
	나이 : <input type ="text" name = "age">
	주소 : <input type = "text" name ="addr">
	<button type="button" onclick="clickBtn()">서버에 자료요청</button>
	</form>
</body>
</html>