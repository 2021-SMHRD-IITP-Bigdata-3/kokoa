<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.topbar{
		position: absolute;
		top: 0;
		background-color: #61da94;
		height: 150px;
		padding:20px;
	}
	.banner{
		margin: 50px;
	}
	.bottombar{
		position: absolute;
		bottom: 0;
		background-color: #61da94;
		height: 150px;
		margin: 50px;
	}
	#logo{
		margin-left: 275px;
		margin-right: 275px;
	}
</style>
</head>
<body>
	<div class="topbar">
		<a href="" id="menu"><img src="menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="together.PNG" width="153px" height="100px"></a>
		<a href="" id="chat"><img src="chat.png" width="100px" height="100px"></a>
	</div>
	<div class="banner" style="margin-top:150px;">
		<a href=""><img src="puppy.jpg" width="850px" height="500px"></a>
	</div>
	<div class="banner">
		<a href=""></a>
	</div>
	<div class="banner">
		<h1 style="font-size:60px">우리 아이 어때요?
		<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray; position:absolute; right:50px;"></h1>
	</div>
	<div class="banner">
		<h1 style="font-size:60px">오늘의 추천 산책 코스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray; position:absolute; right:50px;"></h1>
	</div>
	<div class="bottombar">
		<h1>하단 바</h1>
	</div>
</body>
</html>