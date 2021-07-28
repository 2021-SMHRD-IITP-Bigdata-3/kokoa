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
	.UploadStory {
	  width: 800px;
	  height: 700px;
	  margin-right: auto;
	  margin-left: auto;
	  margin-top: 50px;
	  padding: 20px;
	  text-align: center;
	  border: none;
	    
	}
	.text-field {
	  font-size: 14px;
	  padding: 10px;
	  border: a3a3a3;
	  width: 500px;
	  margin-bottom: 10px;
	 
	}
	.text-field2 {
	  font-size: 14px;
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
	  background-color: #1BBC9B;
	  margin-bottom: 30px;
	  color: white;
	}
	.icon{
	  text-align : left;
	  padding:10px;
	}
</style>
</head>
<body>
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
		<table class='icon' width="530px" align="center">
			<tr>
				<td>
					<i class="fas fa-arrow-left fa-2x"><span> 스토리 작성</span></i>
				</td>
			</tr>
		</table>
	<div>
		<form class="UploadStory">
      		<input type="text" name="title" class="text-field" placeholder="제목을 입력해주세요"><br>
      		<input type="text" name="content" class="text-field2" placeholder="내용을 입력해주세요"><br>
      		<input type="submit" value="파일 첨부" class="submit-btn">
      		<input type="submit" value="등록" class="submit-btn">
    	</form>
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