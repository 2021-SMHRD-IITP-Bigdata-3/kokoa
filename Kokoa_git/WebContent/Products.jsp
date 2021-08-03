<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>물품 상세 설명</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	 	body{
	 	  position:relative;
	      padding-bottom:150px;
	      top:150px;
	      height:1500px;
	      text-align:center;
	   }
	   header{
	      position: fixed;
	      top:0;
	      left:0;
	      background-color: #61da94;
	      height: 150px;
	      width: 100%;
	      z-index:9999;
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
	   		position:fixed;
	   		top:20px;
	   		left:40px;
	   		padding-top:150px;
	   		color:#61da94;
		}
		.container{
			position:relative;
			top:70px;
		}
		.sellerInfo{
			position:relative;
			top:100px;
			right:180px;
			
		}
		.introDiv{
			position:relative;
			top:130px;
		}
		.intro{
	   		position:relative;
	   		width:600px;
	   		height:300px;
	   		color:gray;
	   		border:1px solid #ebebeb;
	   		font-size:25px;
	   		border-radius:5px;
   		}
   		.priceButton{
	   		position:relative;
	   		top:160px;
	   		font-size:15px;
	   		background-color:#61da94;
	   		padding:15px 35px;
	   		border:1;
	   		outline:0;
	   		border: gray;
	   		border-radius:5%;
	   		right:150px;
	   		color:white;
	   }
	   .chatButton{
	   		position:relative;
	   		top:160px;
	   		font-size:15px;
	   		background-color:#61da94;
	   		padding:15px 35px;
	   		border:1;
	   		outline:0;
	   		border: gray;
	   		border-radius:5%;
	   		left:150px;
	   		color:white;
	   }
	   .writerName{
	   		position:relative;
	   		left:20px;
	   		font-size:25px;
	   		bottom:20px;
	   }
		
</style>
</head>
<body class="pt-5">
	
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
	<div>
		<a class="back" href="#" onclick="location.href='FleaMarket.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 판매 상품</span></i></a>
	</div>
	<div class="container">
		<img class="product_pic" src="icons/puppy.jpg" style="display:block; margin:0 auto; width:700px; height:700px;">
	</div>
	<div class="sellerInfo">
		<img class="profile_pic" src="icons/puppy.jpg" style="width:80px; height:80px;">
		<span class="writerName">작성자</span>
	</div>
	<div class="introDiv">
		<textarea class="intro">소개글</textarea>
	</div>
	<div>
		<button class="priceButton" value="price">가격 :15000원</button>
		<button class="chatButton" value="chat" onclick="location.href='MatchingChat.jsp'">채팅 제안</button>
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