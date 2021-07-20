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
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				
				/*
					개발자도구에서 체크해볼것!!
					httpRequest.responseXML.getElementsByTagName('member')[0].getElementsByTagName("id")
				*/
				
				let xmlDoc = httpRequest.responseXML
				let memberList = $(xmlDoc).find('member')
				msg += '회원수 : ' + memberList.length + '명\n'
	
				// memberList에는 3개의 <member> 태그가 들어있음
				// 각각의 <member> 태그의 id, name이 필요함
				
				memberList.each(function() {
					let id = $(this).find('id').text()  // jQuery에서 value 뽑아내는 것
					let name = $(this).find('name').text()
					msg += id + "(" + name + ")\n"
				})
					
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