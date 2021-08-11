<%@page import="com.model.MarketDTO"%>
<%@page import="com.model.MarketDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<title>Insert title here</title>
<style>
	body{
		position:relative;
		padding-bottom:200px;
		top:30px;
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
      z-index:99;
   }
   .banner{
      margin: 50px;
      width: 900px;
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
         .swiper-container {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 70%;
        height: 70%;
      }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

.swiper-container-vertical>.swiper-pagination-bullets{
    top: unset !important;
    bottom: 10px;
    left: 0;
    width: 100%;
}

.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{
  display : inline-block !important;
  margin: 6px 2px !important;
}
</style>
</head>
<body>
   <%MemberDTO info = (MemberDTO)session.getAttribute("info");%>
   <header>
       <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
       <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
       <%if(info != null){ %>
         <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
      <%} else{ %>
         <a href="Login.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
      <%} %>     
   </header>
   <div class="banner" style="margin-top:150px; text-align:center;">
      <a href="Matching.jsp"><img src="icons/dogmain.png" width="900px" height="600px"></a>
   </div>
   <div class="banner">
      <a href=""></a>
   </div>
   <div class="banner">
      <h1 style="font-size:60px">���� �ö�� ����
         <%if(info != null){ %>
            <input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='SNS.jsp'">
         <%} else{ %>
            <input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='Login.jsp'">
         <%} %>
      </h1>
     </div>
     <% 
     
     	BoardDAO dao = new BoardDAO();
     	ArrayList<BoardDTO> board_list = dao.showBoard();
     	MarketDAO dao2 = new MarketDAO();
     	ArrayList<MarketDTO> dto = dao2.showBoard();
     	
     
     %>
<!-- swiper�����̴� ���������̳� -->
	<div class="swiper-container">
	  <!-- �������� ���� -->
	  <div class="swiper-wrapper">
	    <!-- div class="swiper-slide" �� �߰��ϸ�ȴ� -->
	    <% for(int i=0; i<board_list.size(); i++) {%>
	    <div class="swiper-slide"><img onClick="location.href='Stories.jsp?story_num=<%=board_list.get(i).getStory_num() %>'" src="img/<%=board_list.get(i).getStory_pic() %>"></div>
	    <% } %>
	  </div>
	  <!-- ����¡ ��ư ó�� -->
	  <div class="swiper-pagination"></div>
	
	  <!-- ���� ��ư ��Ȳ�� ���� �߰� �������� -->
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	</div>
   <br><br><br>
   <div class="banner">
      <h1 style="font-size:60px">�ű� ��� ��ǰ
         <%if(info != null){ %>
            <input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='FleaMarket.jsp'">
         <%} else{ %>
            <input type="button" value=">" style="border:0; height:60px; width:60px; font-size:60px; color:gray;" onclick="location.href='Login.jsp'">
         <%} %>
      </h1>
   </div>
   	<div class="swiper-container">
	  <!-- �������� ���� -->
	  <div class="swiper-wrapper">
	    <!-- div class="swiper-slide" �� �߰��ϸ�ȴ� -->
	    <% for(int i=0; i<dto.size(); i++) {%>
	    <div class="swiper-slide"><img onClick="location.href='Products.jsp?product_num=<%=dto.get(i).getproduct_num() %>'" src="img/<%=dto.get(i).getproduct_pic() %>"></div>
	    <% } %>
	  </div>
	  <!-- ����¡ ��ư ó�� -->
	  <div class="swiper-pagination"></div>
	
	  <!-- ���� ��ư ��Ȳ�� ���� �߰� �������� -->
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	</div>
	    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    const swiper = new Swiper('.swiper-container', {
    	  //�⺻ ����
    	  //���� ���� vertical ����, horizontal ���� ������ ������ ����
    	  direction: 'horizontal',
    	  //�ѹ��� �������� ������ ����
    	  slidesPerView: 3,
    	  //�������� ������ ������ ����
    	  spaceBetween: 10,
    	  //�巹�� ��� true ��밡�� false ���Ұ�
    	  debugger: true,
    	  //���콺 �ٱ�� true ��밡�� false ���Ұ�
    	  mousewheel: true,
    	  //�ݺ� ��� true ��밡�� false ���Ұ�
    	  loop: true,
    	  //���õ� �����̵带 �߽����� true ��밡�� false ���Ұ� djqt
    	  centeredSlides: true,
    	  // ������ ��ȯȿ�� slidesPerViewȿ���� ���� ��� �Ұ�
    	  // effect: 'fade',
    	  
    	  
    	  //�ڵ� ��ũ����
    	  autoplay: {
    	    //�ð� 1000 �� 1��
    	    delay: 15000,
    	    disableOnInteraction: false,
    	   },
    	  
    	  //����¡
    	  pagination: {
    	    //������ ���
    	    el: '.swiper-pagination',
    	    //Ŭ�� ���ɿ���
    	    clickable: true,
    	  },

    	  //����ǥ
    	  navigation: {
    	    //���������� ����
    	    nextEl: '.swiper-button-next',
    	    //���������� ����
    	    prevEl: '.swiper-button-prev',
    	  },
    	});
    	Resources
    </script>
   <footer>
       <hr>
       <a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
       <%if(info != null) {%>          
          <a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
          <a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
          <a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
          <a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="175px"></a>
       <%} else {%>
          <a href="Login.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
          <a href="Login.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
          <a href="Login.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
          <a href="Login.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="175px"></a>
       <%} %>
   </footer>
</body>
</html>