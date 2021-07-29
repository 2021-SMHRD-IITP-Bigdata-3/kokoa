<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
</head>
<style>
		body{
	      padding-bottom:150px;
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
	      left:1%;
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
	      right:1%;
	      top: 50%;
	      transform: translate(0,-50%);
	   }
	   .blocklist{
	   		padding-top:350px;
	   		padding-right:200px;
	   		font-size:30px;
	   		border: gray;
	   }
	   .blocktitle{
	   	
	   }
	   .fas.fa-arrow-left.fa-3x{
	   		position:relative;
	   		top:50px;
	   		left:50px;
	   		padding-top:150px;
	   		color:black;
	   }
	   .fas.fa-user-minus.fa-3x{
	   		position:relative;
	   		left:210px;
	   		color:#61da94;
	   		top:10px;
	   	}
	   input[type="checkbox"]{
	   		transform: scale(2.0);
	   	}
	   	.confirm{
	   		posision:relative;
	   		transform:scale(2.0);
	   		color:#61da94;
	   		top:100px;
	   		margin-top:30px;
	   		margin-left:100px;
	   	}
</style>
</head>
<body>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
		<table class="icon" align="left">
			<tr>
				<td>
					<a class="back" href="#" onclick="location.href='MyPage.jsp'"><i class="fas fa-arrow-left fa-3x"><span style="font-size:30px"> 차단 목록</span></i></a>
				</td>
			</tr>
		</table>
	<form>
		<table class="blocklist" align="center">
			<tr>
				<td></td>
				<td><span class="blockTitle"><b>차단ID</b></span></td>
				<td><span class="blockTitle"><b>차단한 날짜</b></span></td>
			</tr>
			<tr>
				<td>
					<input type="checkbox">
				</td>
				<td><span class="blockId">차단한 아이디</span></td>
				<td><span class="blockDate">차단한 날짜</span></td>
			</tr>
			<tr>
				<td>
					<input type="checkbox">
				</td>
				<td><span class="blockId">차단한 아이디</span></td>
				<td><span class="blockDate">차단한 날짜</span></td>
			</tr>
		</table>
		<a href="#" onclick=""><i class="fas fa-user-minus fa-3x"></i></a>
	</form>
	<div>
		<button class="confirm">확인</button>
	</div>

	<footer>
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="160px"></a>
	</footer>
</body>
</html>