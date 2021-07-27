<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.topbar{
			position: sticky;
			top: 0;
			background-color: #61da94;
			height: 150px;
			padding:20px;
			}
</style>
</head>
<body>
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcb060d5b952e15d2ecafb2786bbb951"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
	<div class="bottombar">
		<hr>
		<a href="" style="position: absolute; left:17%; top:50%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="100px"></a>
		<a href="" style="position: absolute; left:34%; top:50%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="100px"></a>
		<a href="" style="position: absolute; left:51%; top:50%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="100px"></a>
		<a href="" style="position: absolute; left:68%; top:50%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="100px"></a>
		<a href="" style="position: absolute; left:85%; top:50%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	</div>

</body>
</html>