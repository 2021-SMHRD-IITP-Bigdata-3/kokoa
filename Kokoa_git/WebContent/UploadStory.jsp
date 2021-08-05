<%@page import="com.model.BoardDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>스토리 올리기</title>
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
        margin-top: 100px;
	    padding: 20px;
        text-align: center;
	    border: none;
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
	  position:relative;
	  font-size: 14px;
	  border: none;
	  padding: 13px;
	  width: 200px;
	  background-color: #61da94;
	  margin-bottom: 30px;
	  color: white;
	  border-radius:5px;
	  right:30px;
	  
	}
	.icon{
		position:relative;
	   	padding-top :100px;
	   	top:70px;
	   	left:30px;
	}
	.back{
		position:fixed;
		color:#61da94;
		z-index:1;
	}
	.submit-btn-2{
	  position:relative;
	  font-size: 14px;
	  border: none;
	  padding: 10px;
	  width: 200px;
	  background-color: #61da94;
	  margin-bottom: 30px;
	  color: white;
	  border-radius:5px;
	  right:150px;
	}
</style>
</head>
<body>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
		<table class="icon">
			<tr>
				<td>
					<a class="back" href="#" onclick="location.href='SNS.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 스토리 작성</span></i></a>
				</td>
			</tr>
		</table>
	<div>
		<form method="post" class="UploadStory" action="WriteBoardServiceCon" enctype="multipart/form-data">
      		<input type="text" name="story_title" class="text-field" placeholder="제목을 입력해주세요"><br>
      		<textarea name="story_con" class="text-field2" placeholder="내용을 입력해주세요" cols="20" wrap="hard"></textarea><br>
      		<input  type="file" class="submit-btn-2" style="float: right;" name="story_pic">
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