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
	.banner{
		margin: 50px;
		width: 900px;
	}
	.bottombar{
		position: sticky;
		bottom: 0;
		height: 150px;
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
</style>
</head>
<body>
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	<div class="banner" style="margin-top:150px;">
		<a href=""><img src="icons/puppy.jpg" width="800px" height="500px"></a>
	</div>
	<div class="banner">
		<a href=""></a>
	</div>
	<div class="banner">
		<h1 style="font-size:60px">우리 아이 어때요?
		<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;"></h1>
	</div>
	<div class="banner">
		<h1 style="font-size:60px">오늘의 추천 산책 코스
		<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;"></h1>
	</div>
	<div class="bottombar">
		<hr>
		<a href="" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="160px"></a>
	</div>
</body>
</html>