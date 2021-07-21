<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult {
		border : 1px solid red;
		width : 500px;
		height: 600px;
	}


</style>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(document).ready(function(){
		
		$('#searchBtn').click(function(){
			
			
			let date = $('#searchDate').val()
			date = date.split('-').join('')  //2021-07-13 => 20210713
			//console.log(date)
			
			$.ajax({
				
				type : 'get',
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				data : {
					
					key : 'db446540d9ad299da9972d3c73b6c81c',
				//	targetDt : '20210720' 이런식으로 들어가야함
					targetDt : date,  // 입력한 날짜 전달
					itemPerPage : 3
				},
				// 자신의 서버가아닌 다른 서버의 데이터를 가져오려면
				datatype : 'jsonp',
				
				success : callback, 
				error : function(){
					alert('실패')
				}
			})
			
		})
		
	})
	
	function callback(data){
		
		// 검색할 때마다 지우고 쓰기
		$('#searchResult').empty() // empty는 자기도 지움
		
		// console.log(typeof(data))
		// data에는 받아온 정보가 전체가 저장되어있음
		// 거기서 필요한 정보 뽑아오기 전에 log찍어서 확인함
		console.log(data)
		
		let list = data.boxOfficeResult.dailyBoxOfficeList
		//console.log(list)
		
		for(let i = 0; i < list.length; i++){
		//data.boxOfficeResult.dailyBoxOfficeList [0] [1] [2]
			let movie = list[i]
			let rank = movie.rank
			let movieNm = movie.movieNm
			let audiAcc = movie.audiAcc
			
			console.log(rank, movieNm, audiAcc)
			
			$('#searchResult').append('<hr>')
			$('#searchResult').append('<h4>'+ rank + '위</h4>')
			$('#searchResult').append('<strong>' + movieNm + '</strong>(누적관객수 :' + audiAcc +'명)')
			$('#searchResult').append('<hr>')
		
		}
		
	}

</script>
</head>
<body>

	<h2>일별 박스오피스 순위 조회</h2>
	검색일 : <input type="date" id="searchDate"><br>
	<button id="searchBtn">검색</button>
	<br>
	<h4>검색 결과</h4>
	<div id="searchResult"></div>
	
	
	
</body>
</html>