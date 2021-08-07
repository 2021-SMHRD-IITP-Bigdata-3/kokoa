<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body{
		text-align: center;
		align-content: center;
	}	
	
	header{
    	position: fixed;
    	top:0;
      	left:0;
     	background-color: #61da94;
      	height: 150px;
      	width: 100%;
   	}
   	footer{
      	position: fixed;
      	bottom: 0;
      	left: 0;
      	height: 150px;
      	width:100%;
      	background-color: white;
   	}
	#menu{
		position: absolute;
		left:25px;
		top: 50%;
		transform: translate(0,-50%);
	}
	#logo{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
	}
	#chat{
		position: absolute;
		right:25px;
		top: 50%;
		transform: translate(0,-50%);
	}
	#btn1{
		color: green;
		font-size:40px;
		font-weight: bold;
		background-color: #e8ffe8;
		border-style: solid;
		border-width:0px;
		border-bottom-width: 10px;
		border-bottom-color: green;
		width: 400px;
		height: 100px;
	}
	#btn2{
		color: green;
		font-size:40px;
		font-weight: bold;
		background-color: white;
		border: 0;
		width: 400px;
		height: 100px;
	}
	.box{
		width: 200px;
		height: 200px;
	}
	.timerBox{
		width: 200px;
		outline: 2px solid black;
	}
	.timerBox .time{
		font-size: 30pt;
		color: #4C4C4C;
		text-align: center;
		font-family: sans-serif;
	}
	.btnBox{
		margin: 20px auto;
		text-align: center;
	}
	.btnBox .fa{
		margin: 0px 5px;
		font-size: 30pt;
		color: #FAED7D;
		cursor: pointer;
	}
	div>span{
		font-size: 100px;
	}
	div>button{
		width:200px;
		height:100px;
		font-size:40px;
	}
	
</style>
</head>
<body>
	<%MemberDTO info = (MemberDTO)session.getAttribute("info");%>
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<div style="width:100%; height:150px;"></div>
	<div class="btn">
		<br>
		<button id="btn1" onclick="location.href='Walk.jsp'">산 책 하 기</button><button id="btn2" onclick="location.href='WalkHistory.jsp'">산 책 기 록</button>
		<br><br><br>
	</div>
	<form action="CourseSaveServiceCon" method="post">
		<input type="text" name="id" value="<%=info.getId() %>" hidden="hidden">
		<input type="text" name="nickname" value="<%=info.getNickname() %>" hidden="hidden">
		<input type="text" id="location" name="location">	
		<div id="map" style="width:100%;height:1000px;"></div>
		<div>
			<div>
				<span id="postTestMin">00</span><!-- 분 -->
				<span>:</span>
				<span id="postTestSec">00</span><!--초-->
				<span>.</span>
				<span id="postTestMilisec">00</span><!--밀리초-->
				<input type="text" id="courseTime" name="tracking_time" hidden="hidden">
			</div>
			<div>
				<ul id="testRecordList"></ul><!--중간 기록할 리스트-->
			</div>
			<div>
				<button type="button" id="testStartBtn">START</button><!--시작/재시작/기록 버튼-->
				<button type="button" id="testStopBtn">STOP</button><!--스톱 버튼-->
			</div>
		</div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcb060d5b952e15d2ecafb2786bbb951"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨 
		    }; 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var linePath = [];
		getLoc(true);
		function getLoc(bool){// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude+count, // 위도
			            lon = position.coords.longitude+count; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			            message = '<div style="font-size: 20px;">시작</div>'; // 인포윈도우에 표시될 내용입니다
			        
			        // 마커와 인포윈도우를 표시합니다
			        if(bool){
				        displayMarker(locPosition, message);
				        tracker(lat,lon);
			        } else{
			        	tracker(lat,lon);
			        	map.setCenter(locPosition);
			        }
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			        message = 'geolocation을 사용할수 없어요..'
			        
			    displayMarker(locPosition, message);
			}
		}
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;
		
		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);
		    
	
		}
		
		function tracker(lat, lon){
		    linePath.push(new kakao.maps.LatLng(lat,lon));
	
		    var polyline = new kakao.maps.Polyline({
		        path: linePath, // 선을 구성하는 좌표배열 입니다
		        strokeWeight: 5, // 선의 두께 입니다
		        strokeColor: '#FFAE00', // 선의 색깔입니다
		        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		        strokeStyle: 'solid' // 선의 스타일입니다
		    });
		    
		 	// 지도에 선을 표시합니다 
		    polyline.setMap(map);
		}
		
		// 타이머	
		var stTime = 0
		var endTime = 0
		var timerStart
		var min
		var sec
		var milisec
		var startBtn = document.getElementById('testStartBtn')
		var stopBtn = document.getElementById('testStopBtn')
		var recordList = document.getElementById('testRecordList')
		
		var count = 0;
		var cntSec = 0;
		startBtn.addEventListener('click', function() {
			// RECORD
			updateMap = setInterval(function(){
				getLoc(false);
				count += 0.0001;
				cntSec += 1;
			},1000);
			if(this.innerText == 'RECORD' && milisec) {
				console.log(min, sec, milisec)
				var li = document.createElement('li')
				li.style.color = "black"
				li.innerText = min + ' : ' + sec + ' : ' + milisec
				if(! recordList.firstChild) {
					recordList.append(li)
				} else {
					recordList.insertBefore(li, recordList.firstChild)
				}
				return false
			}
			this.innerText = 'RECORD'
			if(!stTime) {
				stTime = Date.now() // 최초 START
			} else {
				stopBtn.innerText = 'STOP'
				stTime += (Date.now() - endTime) // RESTART
			}
			timerStart = setInterval(function() {
				var nowTime = new Date(Date.now() - stTime)
				min = addZero(nowTime.getMinutes())
				sec = addZero(nowTime.getSeconds())
				milisec = addZero(Math.floor(nowTime.getMilliseconds() / 10))
				document.getElementById('postTestMin').innerText = min
				document.getElementById('postTestSec').innerText = sec
				document.getElementById('postTestMilisec').innerText = milisec
			}, 1)
		})
		
		stopBtn.addEventListener('click', function() {
			// 지도에 마지막 마커를 찍음
			clearInterval(updateMap);
			getLoc(true);
			
			// 기록 저장용 코드
			var recordMin = document.getElementById('postTestMin');
			var recordSec = document.getElementById('postTestSec');
			var recordMiliSec = document.getElementById('postTestMilisec');
			var courseTime = document.getElementById('courseTime')
			courseTime.value += recordMin.textContent;
			courseTime.value += "분 ";
			courseTime.value += recordSec.textContent;
			courseTime.value += "초 "
			courseTime.value += recordMiliSec.textContent;
			
			// 스톱워치 stop버튼기능
			if(timerStart) {
				clearInterval(timerStart) // STOP
				if(this.innerText == 'STOP') {
					endTime = Date.now()
					this.innerText = 'RESET'
					startBtn.innerText = 'RESTART'
				} else { // RESET
					stTime = 0
					min = 0
					sec = 0
					milisec = 0
					document.getElementById('postTestMin').innerText = '00'
					document.getElementById('postTestSec').innerText = '00'
					document.getElementById('postTestMilisec').innerText = '00'
					startBtn.innerText = 'START'
					this.innerText = 'STOP'
					timerStart = null
					recordList.innerHTML = ''
				}
			}
		})
		function addZero(num) {
			return (num < 10 ? '0'+num : ''+num)
		}


		</script>
	
		<input type="submit" value="저장하기">
	</form>
	<br><br><br><br>
	<footer>
      <hr>
      <a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
      <a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
      <a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
      <a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
      <a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="175px"></a>
   </footer>

</body>
</html>