<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	*{
	    margin: 0 auto;
	}
	
	ul#gallery{
	  margin-top: 30px;
	    list-style: none;
	    padding: 0;
	    width: 1000px;
	}
	
	ul#gallery>a>li{
	    position: relative;
	    display: inline-block;
	    background-color: #000;
	    width: 250px;
	    height: 250px;
	    margin: 5px;
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
	    padding-top: 80px;
	    border: 2px #fff;
	    transform: translate(-50%, -50%);
	    text-align: center;
	    content: '댕댕이에게 바로가기';
	    font-size: 35px;
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
</style>
<body>

	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
    <div id="wrap">
        <ul id="gallery">
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbbI251%2FbtqKNniGrDp%2Fd0Z9B1ozCZH3MgkE5PKVzK%2Fimg.jpg" alt="1"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSoosf%2FbtqKylmt39P%2FXOeIq8efKda6RoULEZs5s1%2Fimg.jpg" alt="2"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcwWksO%2FbtqKIpoe0tj%2FP9MNYIjy9DEYhOjC1X5kmK%2Fimg.jpg" alt="3"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FqENoA%2FbtqKJ1gmhTS%2Fyw7thwnctobZmhwhmvKBF0%2Fimg.jpg" alt="4"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbbI251%2FbtqKNniGrDp%2Fd0Z9B1ozCZH3MgkE5PKVzK%2Fimg.jpg" alt="5"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSoosf%2FbtqKylmt39P%2FXOeIq8efKda6RoULEZs5s1%2Fimg.jpg" alt="6"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcwWksO%2FbtqKIpoe0tj%2FP9MNYIjy9DEYhOjC1X5kmK%2Fimg.jpg" alt="7"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FqENoA%2FbtqKJ1gmhTS%2Fyw7thwnctobZmhwhmvKBF0%2Fimg.jpg" alt="8"></li></a>
            <a href=""><li><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FqENoA%2FbtqKJ1gmhTS%2Fyw7thwnctobZmhwhmvKBF0%2Fimg.jpg" alt="9"></li></a>
        </ul>
    </div>
	<div class="bottombar">
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	</div>
	
</body>
</html>