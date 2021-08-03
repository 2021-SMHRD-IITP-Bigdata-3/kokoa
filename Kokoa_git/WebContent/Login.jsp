<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>로그인</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
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
	  background-color: #61da94;
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
	.back{
	position:fixed;
	top:170px;
	color:#61da94;
	left:40px;
	z-index:99;
	}
</style>
</head>
<body>
	<header>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
	</header>
	<table class="icon">
		<tr align="left">
			<td>
				<a class="back" href="#" onclick="location.href='MyPage.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 홈으로</span></i></a>
			</td>
		</tr>
	</table>
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

</body>
</html>