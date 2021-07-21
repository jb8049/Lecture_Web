<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#msgView {
	border: 1px solid red;
	height: 200px;
	width: 500px;
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
	
	이거는 인코딩도 자동으로 해주고 객체 생성, open, send 등 다 해준다. 너무 편리하다.
*/

$(document).ready(function() {
    $(':button').click(function() {
       
       let name = $('#name').val()
       let age = $('#age').val()
       
       $.ajax({
          //type을 쓰지 않으면 기본적으로 GET으로 인식
          url: 'param3.jsp',
          
          //data: 'name=hong&age=23',
          //data: {name: 'hong', age: 23},
          
          // 입력한 name, age 파라미터 전달
          data: {name : name, age : age}, 
          
          // url, data를 전달한 결과값을 받아온 result
          success: function(result) {
             $('#debug').val(result)
          }, error: function() {
             alert('실패')
          }
       })
    })
 })
 

 
</script>
</head>
<body>
 <textarea rows="10" cols="80" id="debug"></textarea>
 <br> 이름 :
 <input type="text" id="name">
 <br> 나이 :
 <input type="text" id="age">
 <br>
 <input type="button" value="호출">
</body>
</html>