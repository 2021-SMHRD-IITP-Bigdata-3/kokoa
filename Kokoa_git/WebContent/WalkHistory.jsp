<%@page import="com.model.CourseDTO"%>
<%@page import="com.model.CourseDAO"%>
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
	#btn2{
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
	#btn1{
		color: green;
		font-size:40px;
		font-weight: bold;
		background-color: white;
		border: 0;
		width: 400px;
		height: 100px;
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
	ul#gallery{
		height : 400px;
		text-align: center;
	}
	ul#gallery>a>li{
		position: relative;
		display: inline-block;
		background-color: #000;
		width: 400px;
		height: 400px;
		margin: 15px;
		overflow: hidden;
	}
	ul#gallery>a>li::after{
		box-sizing: border-box;
		position: absolute;
		display: block;
		top: 50%;
		left: 50%;
		width: 87%;
		height: 87%;
		border: 2px #fff;
		transform: translate(-50%, -50%);
		text-align: center;
		content: '댕댕이에게 바로가기';
		font-size: 35px;
		color: #fff;
		opacity: 0;
		transition: 0.8s;
	}
	
	ul#gallery>a>li>img{
		width: 100%;
		height: 100%;
		transition: 0.6s ease-in-out;
	}
	
	ul#gallery>a>li:hover img{
		transform: scale(1.18);
		opacity: 0.65;
	}
	
	ul#gallery>a>li:hover::after{
		opacity: 1;
	}
	
	.icon{
		text-align:left;
		left : 100px;
		padding-top : 120px;
	}
	.fas.fa-arrow-left.fa-3x{
		position:relative;
		left:100px;
	}
	.back{
		position:fixed;
		color:#61da94;
		z-index:1;
	}
	.write{
		position:fixed;
		z-index:1;
		right:120px;
		bottom:180px;
		color:#61da94;
	}
</style>
</head>
<body>
	<%MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		CourseDAO dao = new CourseDAO();
		CourseDTO dto = dao.show(id);
	%>
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
   <div style="width:100%; height:150px;"></div>
   <span><%=info.getTracking_time() %></span>>
	<div class="btn">
		<br>
		<button id="btn1" onclick="location.href='Walk.jsp'">산 책 하 기</button><button id="btn2" onclick="location.href='WalkHistory.jsp'">산 책 기 록</button>
		<br><br><br>
	</div>
    <div id="wrap">
        <ul id="gallery">
            <li><img src="img/20212021050738732210050911.png"></li>
            
        </ul>
    </div>
	<footer>
      <hr>
      <a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
      <a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
      <a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
      <a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
      <a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
   </footer>

</body>
</html>