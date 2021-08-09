<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>마이페이지</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	body{
		position:relative;
		top:200px;
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
	button{
		background-color: #61da94;
		color: white;
		height: 120px;
		width: 220px;
		border-radius: 10px;
		font-size: 30px;
		margin-top:15px;
		margin-left:15px;
		font-weight:bold;
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
	.btn-group button {
		background-color:#61da94; 
		border: 1px solid #61da94; 
		color: white;
		cursor: pointer;
		border-radius:5px;
	}
	
	/* Clear floats (clearfix hack) */
	.btn-group:after {
		content: "";
		clear: both;
		display: flex;
	}
	
	.btn-group button:not(:last-child) {
		border-right: none;
	}
	
	.btn-group button:hover {
		background-color: tomato;
	}
   .back{
   		position:relative;
   		padding-bottom:150px;
		color:#61da94;
		top:30px;
		left:25%;
 	}
 	.container{
 		margin-top:35px;
 		text-align:center;
 	}
 	.logout_text{
		position:relative;
		bottom:4px;
 	}
 	.pic{
 		border-radius: 25%;
 		
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
	<%if(info != null){ %>
		<div>
			<div class="box">
				<img class="pic" src="img/<%=info.getDog_pic() %>" style="width:400px; height:400px;"><br>
				<p style="font-size:40px; font-weight:bold;"><%=info.getNickname() %></p>
			</div>
			<div class="btn-group a">
				<button class="menu_btn" type="button" onClick="location.href='Edit.jsp'">회원 정보 수정</button>				
				<button class="menu_btn" type="button" onClick="location.href='BlockList.jsp'">차단 목록</button>	
				<button class="menu_btn" type="button" onClick="location.href='LogoutServiceCon'">회원 탈퇴</button>
			</div>
			<div class="btn-group a">
				<button class="menu_btn" type="button" onClick="location.href='Notice.jsp'">공지사항</button>
				<button class="menu_btn" type="button" onClick="location.href='FAQ.jsp'">자주 묻는 질문</button>
				<%if(info.getId().equals("admin")){ %>
				<button class="menu_btn" type="button" onClick="location.href='CS_Board.jsp'">고객의 소리</button>
				 <%}else{ %>
				<button class="menu_btn" type="button" onClick="location.href='CS.jsp'">고객의 소리</button>
				 <%} %>
			</div>
		</div>
		<div class="container">
			<a class="back" href="#" onclick="location.href='LogoutServiceCon'"><i class="fas fa-chevron-left fa-4x"><span class="logout_text" style="font-size:40px"> 로그아웃</span></i></a>
		</div>
	<%} else{ %>
		<div>
			<div class="box">
				<img class="pic" src="icons/profile.png" style="width:250px; height:250px;"><br>
				<p style="font-size:30px">로그인이 필요합니다.</p>
			</div>
			<div>
				<button type="button" onClick="location.href='Login.jsp'">로그인</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" onClick="location.href='Join.jsp'">회원가입</button>
			</div>
		</div>
	<%} %>
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