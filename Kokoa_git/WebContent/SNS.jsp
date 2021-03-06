<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>SNS</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<style>
	body{
	    padding-bottom:150px;
	    align-content: center;
	    padding-top: 40px;
	    height:1500px;
	    font-family: 'Jua', sans-serif;
   }
   header{
	    position: fixed;
	    top:0;
	    left:0;
	    background-color: #61da94;
	    height: 150px;
	    width: 100%;
	    z-index :1;
      
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
	ul#gallery{
		height : 400px;
		text-align: center;
	}
	ul#gallery>a>li{
		position: relative;
		display: inline-block;
		width: 400px;
		height: 400px;
		margin: 20px;
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
		padding-top : 110px;
	}
	.fas.fa-arrow-left.fa-2x{
		position:relative;
		left:28px;
		top:10px;
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
<body>
<%
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> board_list = dao.showBoard();
	
	MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
	<%if (info == null) {%>
	<% response.sendRedirect("Login.jsp"); } %>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
		<table class='icon'>
			<tr>
				<td>
					<a class="back" href="#" onclick="location.href='Main.jsp'"><i class="fas fa-arrow-left fa-2x"></i></a>
				</td>
			</tr>
		</table>
    <div id="wrap">
        <ul id="gallery">
        	<% for(int i=0; i<board_list.size(); i++) {%>
        		<a href="Stories.jsp?story_num=<%= board_list.get(i).getStory_num() %>"><li><img src="img/<%=board_list.get(i).getStory_pic() %>"></li></a>
        	<%} %>
        </ul>
    </div>
    <% if(info!=null){%>
    <% if(info.getId().equals("admin")){ %>
    	<a class="write" href="#" onclick="location.href='UploadStory.jsp'"><i class="fas fa-plus-square fa-3x"></i></a>
    <%}%>
    <%}%>
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