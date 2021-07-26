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
	.topbar{
		position: sticky;
		top: 0;
		background-color: #61da94;
		height: 150px;
		padding:20px;
	}
	.bottombar{
		position: sticky;
		bottom: 0;
		height: 150px;
		background-color: white;
	}
	button{
		background-color: #61da94;
		color: white;
		height: 100px;
		width: 400px;
		border-radius: 10px;
		font-size: 50px;
	}
</style>
</head>
<body>
	<%String info = ""; %>
	<div class="topbar">
		<a href="" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	<%if(info != ""){ %>
		<div>
			
		</div>
	<%} else{ %>
		<div>
			<div>
				<img src="" style=""><br>
				<p style="font-size:50px">로그인이 필요합니다.</p>
			</div>
			<div>
				<button type="button" onClick="location.href=''">로그인</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" onClick="location.href=''">회원가입</button>
			</div>
		</div>
	<%} %>
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