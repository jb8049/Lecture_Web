<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Lecture-Web/jquery/js/jquery-3.6.0.min.js"></script>
<script src="httpRequest.js"></script>
<script>
	function clickBtn() {
		
		sendProcess('GET', 'sample.xml', null, callback)
	}
	
	function callback() {
		
		let msg = ''
			// 서버의 상태가 4(서버에서 응답이 완료되었을 때) 일 때, 200(정상적으로 실행)일때만 관심이 있음
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				
				/*
					개발자도구에서 체크해볼것!!
					httpRequest.responseXML.getElementsByTagName('member')[0].getElementsByTagName("id")
				*/
				
				// sample.xml의 tag를 넣는다
				let xmlDoc = httpRequest.responseXML
				
				// <member>태그 memberList에 저장
				let memberList = xmlDoc.getElementsByTagName("member")
				msg += '회원수 : ' + memberList.length + '명\n'
				
				for(let i = 0; i < memberList.length; i++) {
					
					let mem = memberList[i]  // 각각의 <member> 태그가 가진 <id>, <name>에 접근하기 위함
					
					//console.log(id.innerHTML) //innerText는 안먹힘.. 
					//console.log(id.firstChild.nodeValue) //이것도 가능함
					
					let id = mem.getElementsByTagName('id')[0].innerHTML
					let name = mem.getElementsByTagName("name")[0].firstChild.nodeValue
					
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
	<h2>XML DATA 예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<button type="button" onclick="clickBtn()">서버에 자료요청</button>

</body>
</html>