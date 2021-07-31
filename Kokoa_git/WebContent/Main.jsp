<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
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
	.banner{
		margin: 50px;
		width: 900px;
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
	<header>
    	<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
    	<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
    	<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<div class="banner" style="margin-top:150px;">
		<a href="Matching.jsp"><img src="icons/puppy.jpg" width="800px" height="500px"></a>
	</div>
	<div class="banner">
		<a href=""></a>
	</div>
	<div class="banner">
		<h1 style="font-size:60px">�츮 ���� ���?
			<%if(info != null){ %>
				<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='SNS.jsp'">
			<%} else{ %>
				<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='Login.jsp'">
			<%} %>
		</h1>
	</div>
	<div class="banner">
		<h1 style="font-size:60px">�ű� ��� ��ǰ
			<%if(info != null){ %>
				<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='FleaMarket.jsp'">
			<%} else{ %>
				<input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='Login.jsp'">
			<%} %>
		</h1>
	</div>
	<footer>
    	<hr>
    	<%if(info != null) {%>
	    	<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
	    	<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
	    	<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
	    	<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
	    	<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	    <%} else {%>
	    	<a href="Login.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
	    	<a href="Login.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
	    	<a href="Login.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
	    	<a href="Login.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
	    	<a href="Login.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	    <%} %>
   </footer>
</body>
</html>