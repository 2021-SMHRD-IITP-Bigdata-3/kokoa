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
		<button id="btn1" onclick="location.href='Walk.jsp'">�� å �� ��</button><button id="btn2" onclick="location.href='WalkHistory.jsp'">�� å �� ��</button>
		<br><br><br>
	</div>
	<form action="CourseSaveServiceCon" method="post">
		<input type="text" name="id" value="<%=info.getId() %>" hidden="hidden">
		<input type="text" name="nickname" value="<%=info.getNickname() %>" hidden="hidden">
		<input type="text" id="location" name="location">	
		<div id="map" style="width:100%;height:1000px;"></div>
		<div>
			<div>
				<span id="postTestMin">00</span><!-- �� -->
				<span>:</span>
				<span id="postTestSec">00</span><!--��-->
				<span>.</span>
				<span id="postTestMilisec">00</span><!--�и���-->
				<input type="text" id="courseTime" name="tracking_time" hidden="hidden">
			</div>
			<div>
				<ul id="testRecordList"></ul><!--�߰� ����� ����Ʈ-->
			</div>
			<div>
				<button type="button" id="testStartBtn">START</button><!--����/�����/��� ��ư-->
				<button type="button" id="testStopBtn">STOP</button><!--���� ��ư-->
			</div>
		</div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcb060d5b952e15d2ecafb2786bbb951"></script>
		<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ���� 
		    }; 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
		
		var linePath = [];
		getLoc(true);
		function getLoc(bool){// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
			if (navigator.geolocation) {
			    
			    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude+count, // ����
			            lon = position.coords.longitude+count; // �浵
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
			            message = '<div style="font-size: 20px;">����</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
			        
			        // ��Ŀ�� ���������츦 ǥ���մϴ�
			        if(bool){
				        displayMarker(locPosition, message);
				        tracker(lat,lon);
			        } else{
			        	tracker(lat,lon);
			        	map.setCenter(locPosition);
			        }
			      });
			    
			} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
			    
			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			        message = 'geolocation�� ����Ҽ� �����..'
			        
			    displayMarker(locPosition, message);
			}
		}
		// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(locPosition, message) {
			
		    // ��Ŀ�� �����մϴ�
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // ���������쿡 ǥ���� ����
		        iwRemoveable = true;
		
		    // ���������츦 �����մϴ�
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // ���������츦 ��Ŀ���� ǥ���մϴ� 
		    infowindow.open(map, marker);
		    
		    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
		    map.setCenter(locPosition);
		    
	
		}
		
		function tracker(lat, lon){
		    linePath.push(new kakao.maps.LatLng(lat,lon));
	
		    var polyline = new kakao.maps.Polyline({
		        path: linePath, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
		        strokeWeight: 5, // ���� �β� �Դϴ�
		        strokeColor: '#FFAE00', // ���� �����Դϴ�
		        strokeOpacity: 0.7, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
		        strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
		    });
		    
		 	// ������ ���� ǥ���մϴ� 
		    polyline.setMap(map);
		}
		
		// Ÿ�̸�	
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
				stTime = Date.now() // ���� START
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
			// ������ ������ ��Ŀ�� ����
			clearInterval(updateMap);
			getLoc(true);
			
			// ��� ����� �ڵ�
			var recordMin = document.getElementById('postTestMin');
			var recordSec = document.getElementById('postTestSec');
			var recordMiliSec = document.getElementById('postTestMilisec');
			var courseTime = document.getElementById('courseTime')
			courseTime.value += recordMin.textContent;
			courseTime.value += "�� ";
			courseTime.value += recordSec.textContent;
			courseTime.value += "�� "
			courseTime.value += recordMiliSec.textContent;
			
			// �����ġ stop��ư���
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
	
		<input type="submit" value="�����ϱ�">
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