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
		
		sendProcess('GET', 'sample.jsp', null, callback)
		
	}
	
	function callback(){
		
		
		let msg = ''
			
		if(httpRequest.readyState == 4){ // 서버에서 응답이 완료되었을 때
			
			if(httpRequest.status == 200){
				
				let data = httpRequest.responseText
				//let memberList = JSON.parse(data) //simple.jsp에 멤버변수에 ""로 표시해주어야함 "id"
				let memberList = eval(data) //문자열로 자바스크립트 문법이 들어있으면 실행해주는 eval
				
				msg += '회원수 : ' + memberList.length + '명\n' 
				for(let i = 0; i <memberList.length; i++){
					
					let mem =memberList[i]
					let id = mem.id
					let name = mem.name
					msg += id + '(' + name +')\n'
					
				}
				
				
	//			debugTrace(msg)
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