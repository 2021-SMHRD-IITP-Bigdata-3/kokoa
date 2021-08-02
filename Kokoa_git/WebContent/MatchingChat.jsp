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
	    padding-left:100px;
	}
	li > img{
	    width: 100px;
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
	    font-size: 0.875rem; /* 16 ������ ���� 14px */
	}
	.chat-content{
	    /* �޽���(ä��) ���� ��Ÿ�� ���� */
	    color: gray;
	    font-size: 0.75rem; /* 16 ������ ���� 12px */
	
	}
	.member_cnt{
	    /* �׷� ä�ù� ���, �ο� �� ǥ�� */
	    color: rgb(194, 194, 194);
	    font-size: 0.75rem;
	    margin-left: 0.4375rem; /* 7px (!6��Ʈ ������ ����) */
	}
	.me{
	    display: inline-block;
	    background-repeat: no-repeat;
	    background-size: contain;
	    padding: 0.125rem; /* 16��Ʈ ������ ���� 2px */
	    margin-right: 0.125rem;
	    vertical-align: middle;
	    font-size: 0.625rem; /* 16 ������ ���� 10px */
	    color: white;
	}
	
	.chat-status{
	    flex-basis: 4.5rem; /* 72p */
	    flex-shrink: 0; /* �����ϰ� ������ ���� �Ұ���� ���� */
	    text-align: right;
	}
	.time{
	    color: rgb(194, 194, 194);
	    font-size: 0.625rem; /* 16 ������ ���� 10px */
	}
	.chat-balloon{
	    /* ������ �޽��� ��(count) ǥ�� ��Ÿ�� ���� */    
	    display:inline-block;
	    border: 1px solid tomato;
	    background-color: tomato;
	    border-radius: 0.625rem;
	    font-size: 0.3125rem;
	    color: white;
	    font-weight: bold;
	    padding-top: 0.0625rem; /* 16 ������ ���� 1px */
	    padding-bottom: 0.0625rem;
	    padding-left: 0.25rem; /* 16 ������ ���� 4px */
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
                        <img src="icons/puppy.jpg" alt="���������ʻ���">
                        <div class="talk">
                            <p class="friend-name">�迵��</p>
                            <p class="chat-content">�޽����� �����߽��ϴ�.</p>
                        </div>
                        <div class="chat-status">
                            <p class="time">���� 3:40</p>
                            <span class="chat-balloon">1</span>
                        </div>
                    </li>
                    <li>
                        <img src="icons/puppy.jpg" alt="���������ʻ���">
                        <div class="talk">
                            <p class="friend-name">�ŵ���</p>
                            <p class="chat-content">�޽����� �����߽��ϴ�.</p>
                        </div>
                        <div class="chat-status">
                                <p class="time">���� 3:39</p>
                                <span class="chat-balloon">1</span>
                        </div>
                    </li>
                    <li>
                        <img src="icons/puppy.jpg" alt="���������ʻ���">
                        <div class="talk">
                            <p class="friend-name">�絿��</p>
                            <p class="chat-content">�޽����� �����߽��ϴ�.</p>
                        </div>
                        <div class="chat-status">
                            <p class="time">���� 10:15</p>
                        </div>
                    </li>
                    <li>
                        <img src="icons/puppy.jpg" alt="���������ʻ���">
                        <div class="talk">
                            <p class="friend-name">�絿��</p>
                            <p class="chat-content">�޽����� �����߽��ϴ�.</p>
                        </div>
                        <div class="chat-status">
                            <p class="time">���� 10:15</p>
                        </div>
                    </li>
                </ul>
            </main>
            <!-- aside: ���� -->
            <aside>
                <img src="icons/puppy.jpg" class="ad" style="width:auto; height:300px align:center;" alt="�����̹���">
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