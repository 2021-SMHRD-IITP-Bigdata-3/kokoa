<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>중고거래 글쓰기</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	body{
      padding-bottom:150px;
      height:1000px;
   }
   
   header{
      position: fixed;
      top:0;
      left:0;
      background-color: #61da94;
      height: 150px;
      width: 100%;
      z-index:10;
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
   .back{
   		position: fixed;
   		top:170px;
   		left:30px;
   		color:#61da94;
   		z-index:10;
   }
   	.confirm{
   		position:fixed;
   		top:160px;
   		font-size:15px;
   		padding: 15px 35px;
   		background-color:#61da94;
   		border:1;
   		left:90%;
   		outline:0;
   		border: gray;
   		border-radius:5%;
   }
   .fas.fa-camera.fa-3x{
   		position:relative;
   		top:200px;
   		color:#61da94;
   		right:45%;
   }
   .photo{
   		width:500px;
   		
   }
   .saleTitle{
   		position:relative;
   		top:220px;
   		width:600px;
   		color:gray;
   		border:1px solid #ebebeb;
   		font-size:25px;
   		border-radius:5px;
   		x-index:999;
   }
   .UploadProducts{
   		width:500px;
   		height:400px;
   		margin-right: auto;
	  	margin-left: auto;
	  	text-align: center;
	  	border: none;
	  	
   }
   .category{
   		position:relative;
   		top:250px;
   		width:610px;
   		border:1px solid #ebebeb;
   		font-size:25px;
   		border-radius:5px;
   }
   .salePrice{
   		position:relative;
   		top:280px;
   		width:600px;
   		color:gray;
   		border:1px solid #ebebeb;
   		font-size:25px;
   		border-radius:5px;
   		
   }
   .intro{
   		position:relative;
   		top:310px;
   		width:600px;
   		height:300px;
   		color:gray;
   		border:1px solid #ebebeb;
   		font-size:25px;
   		border-radius:5px;
   }
</style>
</head>
<body>
	
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<div class="container">
		<div class="top">
			<a class="back" href="#" onclick="location.href='FleaMarket.jsp'" align="left"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 중고거래 글쓰기</span></i></a>
			<button class="confirm" value="confirm" onclick="location.href='FleaMarket.jsp'">완료</button>
		</div>
	</div>
	<div class="UploadProducts">
	<form method="post" action="MarketServiceCon" enctype="multipart/form-data">
		<table class="photo">
			<tr class="line">
				<td><i class="fas fa-camera fa-3x"></i></td>
			</tr>
			<tr align="center">
				<td><input type="text" placeholder="제목" class="saleTitle"></td>
			</tr>
			<tr>
				<td>
					<div>
						<select class="category">
							<option value="" selected>category</option>
						 	<option value="feed">사료</option>
						 	<option value="snack">간식</option>
						 	<option value="care">케어</option>
						 	<option value="living">리빙</option>
						 	<option value="stuff">잡화</option>
						 	<option value="toy">장난감</option>
						 	<option value="fashion">패션</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" placeholder="가격" class="salePrice">
				</td>
			</tr>
			<tr>
				<td>
					<textarea class="intro">소개글</textarea>
				</td>
			</tr>
		</table>
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