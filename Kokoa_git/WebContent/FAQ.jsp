<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>FAQ</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
</head>
<style>
	body{
      padding-bottom:150px;
      position:relative;
	  top:150px;
	  text-align:center;
	  padding-top:150px;
	  font-family: 'Jua', sans-serif;
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
   .answer {
    display: none;
    padding-bottom: 30px;
  }
  #faq-title {
    font-size: 32px;
  }
  .faq-content {
    border-bottom: 1px solid #e0e0e0;
  }
  .question {
    font-size: 30px;
    padding: 30px 0;
    cursor: pointer;
    border: none;
    outline: none;
    background: none;
    width: 100%;
    text-align: center;
  }
  .question:hover {
    color: #61da94;
  }
  [id$="-toggle"] {
    margin-right: 15px;
  }
  .back{
	position:fixed;
	top:20px;
	left:40px;
	padding-top:150px;
	color:#61da94;
  }
</style>
</head>
<body>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<div class="wrap">
		<a class="back" href="#" onclick="location.href='MyPage.jsp'"><i class="fas fa-arrow-left fa-2x"><span 'Jua', sans-serif; style="font-size:30px"> 자주 묻는 질문 BEST10</span></i></a>
	</div>
	
	<div class="faq-content">
	  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>오늘 점심 메뉴가 뭔가요</span></button>
	  <div class="answer" id="ans-1">볶음밥</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>환불 희망합니다</span></button>
	  <div class="answer" id="ans-2">안됩니다</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>프로필 사진</span></button>
	  <div class="answer" id="ans-3">마이페이지</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>와사비</span></button>
	  <div class="answer" id="ans-4">치킨</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>피자</span></button>
	  <div class="answer" id="ans-5">자장면</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-6"><span id="que-6-toggle">+</span><span>환불</span></button>
	  <div class="answer" id="ans-6">환불</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-7"><span id="que-7-toggle">+</span><span>믿을만 한가요</span></button>
	  <div class="answer" id="ans-7">네</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-8"><span id="que-8-toggle">+</span><span>네</span></button>
	  <div class="answer" id="ans-8">반갑습니다</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-9"><span id="que-9-toggle">+</span><span>쌍피</span></button>
	  <div class="answer" id="ans-9">쌍피</div>
	</div>
	<div class="faq-content">
	  <button class="question" id="que-10"><span id="que-10-toggle">+</span><span>푸</span></button>
	  <div class="answer" id="ans-10">하</div>
	</div>

	<script>
	  const items = document.querySelectorAll('.question');
	
	  function openCloseAnswer() {
	    const answerId = this.id.replace('que', 'ans');
	
	    if(document.getElementById(answerId).style.display === 'block') {
	      document.getElementById(answerId).style.display = 'none';
	      document.getElementById(this.id + '-toggle').textContent = '+';
	    } else {
	      document.getElementById(answerId).style.display = 'block';
	      document.getElementById(this.id + '-toggle').textContent = '-';
	    }
	  }
	
	  items.forEach(item => item.addEventListener('click', openCloseAnswer));
	</script>
	
	
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