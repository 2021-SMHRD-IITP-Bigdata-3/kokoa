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
<title>ä�� ����Ʈ</title>
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
		/* flex box ���� */
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		/* unordered list �⺻ ��Ÿ�� ����(��, �鿩����) */
		list-style: none;
		padding-left: 0;
	}
	li{
	    /* �ȿ� �� �ٸ� flex box ���� */
		display: flex;
		flex-basis:5rem; /*16 ������ ���� 80px */
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
	    /* ������ ������ �޽���(ä��) ���� ���� ���� ���� */
		margin-left: 0.9375rem; /* 16 ������ ���� 15px */
		flex-grow: 0.85; /* �޽��� ����� �ð� ���̿� �� ���� ä��� ���� flex-grow ���� */
	}
	.talk > *, .time{
		margin-top: 0.3125rem ; /* 16 ������ ���� 5px */
		margin-bottom: 0.3125rem;
	}
	.friend-name{
	    /* �����ʸ�(�̸�) ��Ÿ�� ���� */
		font-weight: bold;
		font-size: 20px; /* 16 ������ ���� 14px */
	}
	.chat-content{
	    /* �޽���(ä��) ���� ��Ÿ�� ���� */
		color: gray;
		font-size: 16px; /* 16 ������ ���� 12px */
	
	}
	.member_cnt{
	    /* �׷� ä�ù� ���, �ο� �� ǥ�� */
		color: rgb(194, 194, 194);
		font-size: 16px;
		margin-left: 0.4375rem; /* 7px (!6��Ʈ ������ ����) */
	}
	.me{
		display: inline-block;
		background-repeat: no-repeat;
		background-size: contain;
		padding: 0.125rem; /* 16��Ʈ ������ ���� 2px */
		margin-right: 0.125rem;
		vertical-align: middle;
		font-size: 14px; /* 16 ������ ���� 10px */
		color: white;
	}
	
	.chat-status{
		flex-basis: 4.5rem; /* 72p */
		flex-shrink: 0; /* �����ϰ� ������ ���� �Ұ���� ���� */
		text-align: right;
	}
	.time{
		color: rgb(194, 194, 194);
		font-size: 12px; /* 16 ������ ���� 10px */
	}
	.chat-balloon{
	    /* ������ �޽��� ��(count) ǥ�� ��Ÿ�� ���� */    
		display:inline-block;
		border: 1px solid tomato;
		background-color: tomato;
		border-radius: 0.625rem;
		font-size: 8px;
		color: white;
		font-weight: bold;
		padding-top: 0.0625rem; /* 16 ������ ���� 1px */
		padding-bottom: 0.0625rem;
		padding-left: 0.25rem; /* 16 ������ ���� 4px */
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
					<a class="back" href="#" onclick="location.href='Main.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> ä��</span></i></a>
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
	                        <img src="icons/puppy.jpg" alt="���������ʻ���">
	                        <div class="talk" onClick="location.href='ChatTest.jsp?chatnum=<%=dto.get(i).getChatting_room_num() %>'">
	                        	<%title = dao2.showI(info.getId(),dto.get(i).getChatting_room_num()); %>
	                            <p class="friend-name"><%=title %></p>
	                            <p class="chat-content"></p>
	                        </div>
	                        <div class="chat-status">
	                            <p class="time">���� 3:40</p>
	                            <span class="chat-balloon">1</span>
	                        </div>
	                    </li>
	                <%}}else{ %>
	                    <li>
	                    	<img src="icons/puppy.jpg" alt="���������ʻ���">
	                        <div class="talk">
	                            <p class="friend-name">ä�ø���� �����ϴ�.</p>
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