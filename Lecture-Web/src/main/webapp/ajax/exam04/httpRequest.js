/**
 * Ajax통신과 관련된 함수의 집합
 */

let httpRequest = null

function getXMLHttpRequest() {
	let httpRequest = null;
	if(window.XMLHttpRequest)
		httpRequest = new XMLHttpRequest()
	else if(window.ActiveXObject)
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
	
	return httpRequest
}

// 사용자마다 달라지는 요소들
// 메소드, 요청하는 url, 파라미터도 받아와야함, 콜백함수 필요함(서버상태 바뀔때마다!)
function sendProcess(method, url, params, callback) {
	
	httpRequest = getXMLHttpRequest()
	//객체 얻어온 뒤 콜백 함수 정의해줘야함
	httpRequest.onreadystatechange = callback
	
	let httpMethod = method
	
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET'
		
	let httpParams = ''
	
	if(params != null && params != '') {
		
		// module.jsp에서 전달한 params의 타입에 상관없이
		// String은 Object형을 상속받음, String을 먼저 안써주고 Object형을 써주면,
		// 넘어오는 값이 모두 Object형으로 감, Object형이 가장 큰 형식이니까
		
		if(typeof(params) == 'string') { 
			// name=홍길동&age=24
			paramArr = params.split('&')
			for(let param of paramArr) {
				pdata = param.split('=')
				if(httpParams != '')
					httpParams += '&' // 비어있지 않다면, 데이터와 데이터사이에 & 붙이기
					//pdata[1]은 value이고, 한글 정상적으로 출력하도록 encode
					//받아온  param을 쪼개서, 한글 encode해주고, 다시 붙여주는 과정
				httpParams += pdata[0] + '=' + encodeURIComponent(pdata[1])
			}
		} else {
			// module.jsp 3단계
			// {name : '홍길동', age : 24} ==> name=홍길동&age=24 이런 형식으로 바꾸자
			
			for(let key in params) {
				//console.log(key, params[key])
				if(httpParams != '')
					httpParams += '&'
				httpParams += key + '=' + encodeURIComponent(params[key])
			}
		}
		
	}
	
	let httpUrl = url
	if(httpMethod == 'GET' && httpParams != '')
		httpUrl = url + '?' + httpParams
				
//	console.log(httpMethod, httpUrl, httpParams)				
				
	httpRequest.open(httpMethod, httpUrl, true)	
	if(httpMethod == 'GET')
		httpRequest.send(null)
	else if(httpMethod == 'POST') {
		httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
		httpRequest.send(httpParams)
	}
}


























