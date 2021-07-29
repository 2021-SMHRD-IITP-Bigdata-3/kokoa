<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<title>Insert title here</title>
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
	.login-form {
	  width: 500px;
	  height: 400px;
	  margin-right: auto;
	  margin-left: auto;
	  margin-top: 50px;
	  padding: 150px;
	  text-align: center;
	  border: none;
	    
	}
	.text-field {
	  font-size: 20px;
	  padding: 10px;
	  border: gray;
	  width: 400px;
	  margin-bottom: 10px;
	 
	}
	.submit-btn {
	  font-size: 20px;
	  border: none;
	  padding: 10px;
	  width: 400px;
	  background-color: #1BBC9B;
	  margin-bottom: 30px;
	  color: white;
	}
	 
	.links {
	  text-align: center;
	}
	 
	.links a {
	  font-size: 18px;
	  width: 350px;
	  color: #9B9B9B;
	}
</style>
</head>
<body>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<div class="login-form">
	<h1 style="color:gray">ID 로그인</h1>
    <form action="LoginServiceCon" method="post">
      <input type="text" name="id" class="text-field" placeholder="아이디">
      <input type="password" name="pw" class="text-field" placeholder="비밀번호">
      <input type="submit" value="로그인" class="submit-btn">
    </form>
 
    <div class="links">
      <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="#" onclick="location.href='Join.jsp'">회원가입</a>
    </div>
  	</div>
	<div style="margin-top:150px;">
		<a href="Matching.jsp"><img src="icons/event.jpg" width="700px" height="500px"></a>
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