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
	<%MemberDTO info = (MemberDTO)session.getAttribute("info");%>
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	<%if(info != null){ %>
		<div>
			<div>
				<img src="icons/profile.png" style=""><br>
				<p style="font-size:50px"><%=info.getNickname() %></p>
			</div>
			<div>
				<button type="button" onClick="location.href='LogoutServiceCon'">로그아웃</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" onClick="location.href='Edit.jsp'">회원정보수정</button>
			</div>
		</div>
	<%} else{ %>
		<div>
			<div>
				<img src="icons/profile.png" style=""><br>
				<p style="font-size:50px">로그인이 필요합니다.</p>
			</div>
			<div>
				<button type="button" onClick="location.href='Login.jsp'">로그인</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" onClick="location.href='Join.jsp'">회원가입</button>
			</div>
		</div>
	<%} %>
	<div class="bottombar">
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	</div>
</body>
</html>