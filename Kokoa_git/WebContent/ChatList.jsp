<%@page import="com.model.MatchingDTO"%>
<%@page import="com.model.MatchingDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.IndivisualChatDAO"%>
<%@page import="com.model.IndivisualChatDTO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>채팅 리스트</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	body{
		padding-top:150px;
		margin-left:30px;
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
		z-index:30px;
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
   ul{
		/* flex box 생성 */
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		/* unordered list 기본 스타일 제거(점, 들여쓰기) */
		list-style: none;
		padding-left: 0;
	}
	li{
	    /* 안에 또 다른 flex box 생성 */
		display: flex;
		flex-basis:5rem; /*16 브라우저 기준 80px */
		flex-shrink: 0;
		flex-direction: row;
		flex-wrap: nowrap;
		justify-content: flex-start;
		align-items: center;
		padding-left:130px;
		padding-top:30px;
	    
	    
	}
	li > img{
		width: 200px;
	}
	li > .talk{
	    /* 프로필 사진과 메시지(채팅) 내용 사이 간격 조절 */
		margin-left: 0.9375rem; /* 16 브라우저 기준 15px */
		flex-grow: 0.85; /* 메시지 내용과 시간 사이에 빈 공간 채우기 위한 flex-grow 설정 */
	}
	.talk > *, .time{
		margin-top: 0.3125rem ; /* 16 브라우저 기준 5px */
		margin-bottom: 0.3125rem;
	}
	.friend-name{
	    /* 프로필명(이름) 스타일 조정 */
		font-weight: bold;
		font-size: 20px; /* 16 브라우저 기준 14px */
	}
	.chat-content{
	    /* 메시지(채팅) 내용 스타일 조정 */
		color: gray;
		font-size: 16px; /* 16 브라우저 기준 12px */
	
	}
	.member_cnt{
	    /* 그룹 채팅방 경우, 인원 수 표시 */
		color: rgb(194, 194, 194);
		font-size: 16px;
		margin-left: 0.4375rem; /* 7px (!6폰트 브라우저 기준) */
	}
	.me{
		display: inline-block;
		background-repeat: no-repeat;
		background-size: contain;
		padding: 0.125rem; /* 16폰트 브라우저 기준 2px */
		margin-right: 0.125rem;
		vertical-align: middle;
		font-size: 14px; /* 16 브라우저 기준 10px */
		color: white;
	}
	
	.chat-status{
		flex-basis: 4.5rem; /* 72p */
		flex-shrink: 0; /* 유연하게 사이즈 조절 불가토록 설정 */
		text-align: right;
	}
	.time{
		color: rgb(194, 194, 194);
		font-size: 12px; /* 16 브라우저 기준 10px */
	}
	.chat-balloon{
	    /* 안읽은 메시지 수(count) 표시 스타일 지정 */    
		display:inline-block;
		border: 1px solid tomato;
		background-color: tomato;
		border-radius: 0.625rem;
		font-size: 8px;
		color: white;
		font-weight: bold;
		padding-top: 0.0625rem; /* 16 브라우저 기준 1px */
		padding-bottom: 0.0625rem;
		padding-left: 0.25rem; /* 16 브라우저 기준 4px */
		padding-right:0.25rem;
	}
	.back{
		position:fixed;
		color:#61da94;
		z-index:1;
		top:20px;
		left:40px;
		padding-top:150px;
	}
	.wrap li{
		border-bottom:1px solid #ebebeb;
	}
</style>
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		IndivisualChatDAO dao = new IndivisualChatDAO();
		ArrayList<IndivisualChatDTO> dto = dao.showChat(info.getMem_num());
		MatchingDAO dao2 = new MatchingDAO();
		String title = "";
	%>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
		<table class='icon'>
			<tr>
				<td>
					<a class="back" href="#" onclick="location.href='Main.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 채팅</span></i></a>
				</td>
			</tr>
		</table>
	        <div id="content">
            <main>
                <ul class="wrap">                	
                	<%
	                	if(dto != null){
	                		for(int i = 0; i<dto.size(); i++){
                	%>
	                    <li>
	                        <img src="icons/puppy.jpg" alt="영훈프로필사진">
	                        <div class="talk" onClick="location.href='ChatTest.jsp?chatnum=<%=dto.get(i).getChatting_room_num() %>'">
	                        	<%title = dao2.showI(info.getId(),dto.get(i).getChatting_room_num()); %>
	                            <p class="friend-name"><%=title %></p>
	                            <p class="chat-content"></p>
	                        </div>
	                        <div class="chat-status">
	                            <p class="time">오후 3:40</p>
	                            <span class="chat-balloon">1</span>
	                        </div>
	                    </li>
	                <%}}else{ %>
	                    <li>
	                    	<img src="icons/puppy.jpg" alt="영훈프로필사진">
	                        <div class="talk">
	                            <p class="friend-name">채팅목록이 없습니다.</p>
	                        </div>
	                     <li>
                     <%} %>
                </ul>
            </main>
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