<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="httpRequest.js"></script>
<script src="/Lecture-Web/jquery/js/jquery-3.6.0.min.js"></script>

<script>

	function clickBtn(){
		
		sendProcess('GET', 'sample.jsp', null, callback)
		
	}
	
	function callback(){
		
			let msg =''
			
			if(httpRequest.readyState == 4){
				
				if(httpRequest.status == 200){
					
					//url에서 받아온 값을 저장 
					let data = httpRequest.responseText
					// let memberList = JSON.parse(data) //json 객체로 변환, 멤버변수에 "id"이렇게 적어주어야함
					let memberList = eval(data) // 문자열 중 자바스크립트 문법이 있으면 실행함
					
					msg += '회원 수 : ' + memberList.length + '명\n'
					for(let i = 0; i < memberList.length; i++){
						let mem = memberList[i]
						let id = mem.id
						let name = mem.name
						msg += id + '(' + name + ')\n'
						
					}
					
					debugTrace(msg)
				}
				
			}
			
			
			
		}
		
		function debugTrace(msg) {
			
			let debug = document.getElementById("debug")
			debug.value += msg
			
		}


</script>
</head>
<body>
	<h2>JSON DATA 예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea>
	<button type="button" onclick="clickBtn()">서버에 자료요청</button>
</body>
</html>