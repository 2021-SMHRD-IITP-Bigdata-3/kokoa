<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="styles.css" />
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>함께하게</title>
<style> 
	body{
      padding-bottom:150px;
      height:2000px;
   }
   
   header{
      position: fixed;
      top:0;
      left:0;
      background-color: #61da94;
      height: 150px;
      width: 100%;
      z-index:100;
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
   .view {
   	  position: relative;
	  padding-top: 60px;
	  width: 935px;
	  top: 180px;
	}
	
	.section {
	  float: left;
	  width: 614px;
	  margin-right: 28px;
	  margin-bottom: 40px;
	  display: inline;
	  background-color: #ffffff;
	}
	
	.content {
	  border: 1px solid #ebebeb;
	}
	
	.content-profile {
	  display: flex;
	  align-items: center;
	  padding: 16px;
	  height: 27px;
	}
	
	.content-profilePhoto {
	  width: 32px;
	  border-radius: 50%;
	}
	
	.content-more {
	  display: flex;
	  width: 100%;
	  height: 24px;
	  margin-left: 14px;
	  align-items: center;
	  justify-content: space-between;
	  font-weight: bold;
	}
	
	.fas.fa-ellipsis-h {
	  font-size: 16px;
	  float: right;
	}
	
	.content-contents {
	  width: 100%;
	}
	
	.content-menuDiv {
	  display: flex;
	  justify-content: space-between;
	}
	.content-menuLeft {
	  display: flex;
	  padding-left: 8px;
	  list-style:none;
	  
	}
	
	.content-menuIcon > i {
	  padding: 8px;
	  font-size: 24px;
	}
	.content-munuIcon{
		color:white;
	}
	
	.views {
		font-weight: bold;
	  	font-size: 14px;
	}

	.content-contents-contents > div {
	  font-size: 14px;
	  margin-top: 10px;
	  padding: 0 16px;
	}
	
	.contents-id {
	  font-weight: bold;
	}
	
	.comment {
	  display: flex;
	}
	
	.comment-id {
	  font-weight: bold;
	  margin-right: 8px;
	}
	.comment-content {
	  width: 100%;
	}
	
	.comment-heart > i {
	  font-size: 12px;
	}
	
	.comment-registration {
	  width: auto;
	  height: 55px;
	  align-items: center;
	  display: flex;
	  border-top: 1px solid #ebebeb;
	  margin-top: 4px;
	  justify-content: space-between;
	  padding: 0 8px;
	}
	
	.input-comment {
	  flex: 9;
	  width: 100%;
	  height: 18px;
	  font-size: 14px;
	  border: 0;
	  outline: none;
	}
	
	.regist {
	  width: 30px;
	  font-size: 14px;
	  color: #0095f6;
	  width: auto;
	}
	html {
	  min-width: 390px;
	}
	.back{
		position:fixed;
		top:170px;
		left:40px;
		color:#61da94;
		z-index:10;
		
	}
	.section{
		position:relative;
		width:800px;
		left:8%;
	}
</style>
</head>
<body>
<%
int story_num = Integer.parseInt(request.getParameter("story_num"));

BoardDAO dao = new BoardDAO();
BoardDTO dto = dao.showOne(story_num);

%>
<%

int count;

if(session.getAttribute("count") != null)
{
	count = ((Integer)session.getAttribute("count")).intValue();
	
}

else
{
	count = 0;	
}

count++;

%>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<table class="icon" align="left">
		<tr>
			<td>
				<a class="back" href="#" onclick="location.href='SNS.jsp'"><i class="fas fa-arrow-left fa-2x"></i></a>
			</td>
		</tr>
	</table>
	<div class="view">
        <section class="section">
            <div class="content">
                <div class="content-profile">
                    <div><img src="img/<%=dto.getStory_pic() %>" alt="" class="content-profilePhoto"></div>
                    <div class="content-more">
                        <div class="content-id"><%= dto.getStory_title() %></div>
                        <div class="content-moreIcon"><i class="fas fa-ellipsis-h"></i></div>
                    </div>
                </div>
                <div class="content-contents">
                    <img src="img/<%=dto.getStory_pic() %>" class="content-contents" alt="">
                </div>
                <div class="content_bottom">
                    <div class="content-menuDiv">
                        <ul class="content-menuLeft">
                            <li class="content-menuIcon"><i class="far fa-heart"></i><span> 43 </span></li>
                            <li class="content-menuIcon"><i class="far fa-comment"></i><span> 23 </span></li>
                        </ul>
                    </div>
                    <div class="views"> 조회수 <%= count%></div>
                    <div class="content-contents-contents">
                        <div class="contents-id"><%= dto.getStory_title() %></div>
                        <div class="contents-contents"><p class="contents-contents" style="white-space: pre-line;"><%= dto.getStory_con() %></p></div>
                        <div class="comment">
                            <div class="comment-id">tahiti8505</div>
                            <div class="comment-content">귀엽네요</div>
                            <div class="comment-heart"><i class="far fa-heart"></i></div>
                        </div>
                    </div>
                    <div class="comment-registration">
                        <input type="text" class="input-comment" placeholder="댓글 달기...">
                        <div class="regist">게시하기</div>
                    </div>
                </div>
            </div>
        </section>
        </div>
        <%
		session.setAttribute("count", new Integer(count));
		%>
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