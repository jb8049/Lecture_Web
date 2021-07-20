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
<script src="/Lecture-Web/jquery/js/jquery-3.6.0.min.js"></script>

<script>

/*
	type : 요청방식(text)
	url : 요청주소(text)
	data : 요청파라미터(문자열, 객체)
	success : 수신성공(함수) status가 200이고 state가 4일 때 가 중요함!
	error : 수신실패(함수)
*/

	$(document).ready(function(){
		$(':button').click(function(){
			
			$.ajax({
				
				'type' : 'get',
				'url' : 'hello.jsp',
				'success' : function(data){
					//console.log(data) 
					$('#msgView').html(data) // JS의 innerHTML과 동일	
					//$('#msgView').append(data)
					
				}, 'error' : function(){
					alert('실패')
				} 
				
			})
		})
		
	})
	

</script>

</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<input type="button" value="서버에서 자료요청"> 
	
</body>
</html>