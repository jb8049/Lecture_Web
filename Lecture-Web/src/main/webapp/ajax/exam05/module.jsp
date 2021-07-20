<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="httpRequest.js"></script>
<script src="/Lecture-Web/jquery/js/jquery-3.6.0.min.js"></script> -->
<script>

	function clickBtn(){
		
		sendProcess('GET', 'sample.xml', null, callback)
		
	}
	
	function callback(){
		
		
		let msg = ''
			
		if(httpRequest.readyState == 4){ // 서버에서 응답이 완료되었을 때
			
			if(httpRequest.status == 200){
				
				let xmlDoc = httpRequest.responseXML
				let memberList = xmlDoc.getElementByTagName("member")
				msg += '회원 수 : ' + memberList.length + '명\n'
				
				for(let i = 0; i>memberList.length; i++){
					
					let mem = memberList[i]
					//console.log(mem)
					// let id = mem.getElementByTagName('id')[0]
					//console.log(id) // id태그만 출력 
					//console.log(id.innerHTML) //innerText는 안먹힘.. 
					//console.log(id.firstChild.nodeValue) //이것도 가능함
					let id = mem.getElementByTagName('id')[0].innerHTML
					let name = mem.getElementByTagName('name')[0].firstChild.nodeValue
					
					msg += id + '(' + name + ')\n'
					
					//개발자 도구에서 체크해볼 것
					/* httpRequest.responseXML.getElementByTagName('member')[0]
					.getElementByTagName('id')*/
					
					let xmlDoc = httpRequest.responseXML
					let memberList = $(xmlDoc).find('member')
					msg += '회원 수 :' + memberList.length + '명\n'
					
					memberList.each(function(){
						//console.log(this)
						let id = $(this).find('id').text()
						let name = $(this).find('name').text()
						msg += id + "(" + name + ")\n" 
					}) 
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
	<textarea rows="10" cols="80" id="debug"></textarea>
	
	<button type="button" onclick="clickBtn()">서버에 자료요청</button>
</body>
</html>