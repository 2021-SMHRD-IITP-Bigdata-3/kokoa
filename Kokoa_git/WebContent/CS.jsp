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
	.CS {
		width: 800px;
		height: 700px;
		margin-right: auto;
		margin-left: auto;
		margin-top: 50px;
		padding: 20px;
		text-align: center;
		border: none;
		padding-top:200px;
	    
	}
	.text-field {
		font-size: 20px;
		padding: 10px;
		border: a3a3a3;
		width: 500px;
		margin-bottom: 10px;
	 
	}
	.text-field2 {
		font-size: 20px;
		padding: 10px;
		border: a3a3a3;
		width: 500px;
		height: 400px;
		margin-bottom: 10px;
	 
	}
	.submit-btn {
		font-size: 14px;
		border: none;
		padding: 10px;
		width: 260px;
		background-color: #61da94;
		margin-bottom: 30px;
		color: white;
		border-radius:5px;
	}
	.icon{
		position:relative;
	   	padding-top :100px;
	   	top:30px;
	   	left:30px;
	}
	.back{
		position:fixed;
		color : #61da94;
	}
</style>
</head>
<body>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
		<table class="icon" align="left">
			<tr>
				<td>
					<a class="back" href="#" onclick="location.href='MyPage.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 고객의 소리</span></i></a>
				</td>
			</tr>
		</table>
	<div>
		<form method="post" class="CS" action="CSWriteBoardServiceCon" enctype="multipart/form-data">
      		<input type="text" name="cs_title" class="text-field" placeholder="제목을 입력해주세요"><br>
      		<textarea name="cs_con" class="text-field2" placeholder="내용을 입력해주세요" cols="20" wrap="hard"></textarea><br>
      		<input  type="file" class="submit-btn-2" style="float: right;" name="cs_pic">
      		<input type="submit" value="등록" class="submit-btn">
    	</form>
    </div>
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