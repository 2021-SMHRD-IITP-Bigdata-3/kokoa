<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>?α???</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	body{
      text-align: center;
      align-content: center;
      font-family: 'Jua', sans-serif;
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
	  font-size: 25px;
	  padding: 10px;
	  border: gray;
	  width: 400px;
	  margin-bottom: 10px;
	 
	}
	.submit-btn {
	  font-size: 25px;
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
	  font-size: 25px;
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
	#form{
		left:50%;
	}
	.pic{
		position:relative;
		top:-150px;
	}
	
</style>
</head>
<body>
	<header>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
	</header>
	<table class="icon">
		<tr align="left">
			<td>
				<a class="back" href="#" onclick="location.href='Main.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="'Jua', sans-serif; font-size:30px"> Ȩ????</span></i></a>
			</td>
		</tr>
	</table>
	<div id="form">
		<div class="login-form">
			<h1 style="color:gray">ID ?α???</h1>
	    		<form action="LoginServiceCon" method="post">
	      			<input type="text" name="id" class="text-field" placeholder="???̵?">
	      			<input type="password" name="pw" class="text-field" placeholder="???й?ȣ">
	      			<input type="submit" value="?α???" class="submit-btn">
	    		</form>
	    	<div class="links">
	      		<a href="#">???̵? ã??</a> | <a href="#">???й?ȣ ã??</a> | <a href="#" onclick="location.href='Join.jsp'">ȸ??????</a>
	    	</div>
	  	</div>
		<div class="pic">
			<a href="Matching.jsp"><img src="icons/event.jpg" width="700px" height="500px"></a>
		</div>
	</div>
</body>
</html>