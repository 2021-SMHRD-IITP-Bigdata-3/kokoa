<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body{
      padding-top:150px;
      margin-left:30px;
      height:1300px;
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
	    padding-left:100px;
	}
	li > img{
	    width: 100px;
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
	    font-size: 0.875rem; /* 16 브라우저 기준 14px */
	}
	.chat-content{
	    /* 메시지(채팅) 내용 스타일 조정 */
	    color: gray;
	    font-size: 0.75rem; /* 16 브라우저 기준 12px */
	
	}
	.member_cnt{
	    /* 그룹 채팅방 경우, 인원 수 표시 */
	    color: rgb(194, 194, 194);
	    font-size: 0.75rem;
	    margin-left: 0.4375rem; /* 7px (!6폰트 브라우저 기준) */
	}
	.me{
	    display: inline-block;
	    background-repeat: no-repeat;
	    background-size: contain;
	    padding: 0.125rem; /* 16폰트 브라우저 기준 2px */
	    margin-right: 0.125rem;
	    vertical-align: middle;
	    font-size: 0.625rem; /* 16 브라우저 기준 10px */
	    color: white;
	}
	
	.chat-status{
	    flex-basis: 4.5rem; /* 72p */
	    flex-shrink: 0; /* 유연하게 사이즈 조절 불가토록 설정 */
	    text-align: right;
	}
	.time{
	    color: rgb(194, 194, 194);
	    font-size: 0.625rem; /* 16 브라우저 기준 10px */
	}
	.chat-balloon{
	    /* 안읽은 메시지 수(count) 표시 스타일 지정 */    
	    display:inline-block;
	    border: 1px solid tomato;
	    background-color: tomato;
	    border-radius: 0.625rem;
	    font-size: 0.3125rem;
	    color: white;
	    font-weight: bold;
	    padding-top: 0.0625rem; /* 16 브라우저 기준 1px */
	    padding-bottom: 0.0625rem;
	    padding-left: 0.25rem; /* 16 브라우저 기준 4px */
	    padding-right:0.25rem;
	}
</style>
</head>
<body>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	        <div id="content">
            <main>
                <ul class="wrap">
                    <li>
                        <img src="icons/puppy.jpg" alt="영훈프로필사진">
                        <div class="talk">
                            <p class="friend-name">김영훈</p>
                            <p class="chat-content">메시지가 도착했습니다.</p>
                        </div>
                        <div class="chat-status">
                            <p class="time">오후 3:40</p>
                            <span class="chat-balloon">1</span>
                        </div>
                    </li>
                    <li>
                        <img src="icons/puppy.jpg" alt="동희프로필사진">
                        <div class="talk">
                            <p class="friend-name">신동희</p>
                            <p class="chat-content">메시지가 도착했습니다.</p>
                        </div>
                        <div class="chat-status">
                                <p class="time">오후 3:39</p>
                                <span class="chat-balloon">1</span>
                        </div>
                    </li>
                    <li>
                        <img src="icons/puppy.jpg" alt="동일프로필사진">
                        <div class="talk">
                            <p class="friend-name">양동일</p>
                            <p class="chat-content">메시지가 도착했습니다.</p>
                        </div>
                        <div class="chat-status">
                            <p class="time">오전 10:15</p>
                        </div>
                    </li>
                    <li>
                        <img src="icons/puppy.jpg" alt="동일프로필사진">
                        <div class="talk">
                            <p class="friend-name">양동일</p>
                            <p class="chat-content">메시지가 도착했습니다.</p>
                        </div>
                        <div class="chat-status">
                            <p class="time">오전 10:15</p>
                        </div>
                    </li>
                </ul>
            </main>
            <!-- aside: 광고 -->
            <aside>
                <img src="icons/puppy.jpg" class="ad" style="width:auto; height:300px align:center;" alt="광고이미지">
            </aside>
        </div>
	<footer>
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="160px"></a>
	</footer>

</body>
</html>