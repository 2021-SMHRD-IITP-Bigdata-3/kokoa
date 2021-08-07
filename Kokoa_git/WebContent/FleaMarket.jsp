<%@page import="com.model.MarketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>FleaMarket</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	body{
      padding-bottom:150px;
      position:relative;
   }
   
   header{
      position: fixed;
      top:0;
      left:0;
      background-color: #61da94;
      height: 150px;
      width: 100%;
      z-index:99;
      
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
	   .back{
	   		position:fixed;
	   		top:170px;
	   		color:#61da94;
	   		left:40px;
	   		z-index:99;
	   		
	   }
	   .sell{
	  		position:fixed;
	   		font-size:15px;
	   		background-color:#61da94;
	   		padding:15px 35px;
	   		border:1;
	   		outline:0;
	   		border: gray;
	   		border-radius:5%;
	   		color:white;
	   		top:163px;
	   		right:33px;
	   		z-index:99;
	   }
	   .category{
	   		position:relative;
	   		font-size:20px;
	   		bottom:20px;
	   }
	   .sale_pic{
	   		position:relative;
			top:55px;
			border-bottom:1px solid #e0e0e0;
	   }
	   .wrap{
			text-align:center;
	   }
	   .container{
	   		position:relative;
	   		text-align:right;
	   }
	   .sale_info{
	   		position:relative;
	   		top:-50px;
	   		text-align:center;
	   		margin-bottom:30px;
	   }
	   .sale_info > span{
	   		position:relative;
	   		top:-70px;
	   }
	   .img{
	   		position:relative;
	   		right:300px;
	   		top:-30px;
	   }
	   .sale_title{
	   		font-weight:bold;
	   		font-size:25px;
	   }
	   .sale_price{
	   		font-size:20px;
	   }
	   .cate_wrap{
	   		text-align:center;
	   		position:relative;
	   		padding-top:300px;
	   		border-bottom:1px solid #e0e0e0;
	   		
	   }
</style>
</head>
<body>

<%
	MarketDAO dao = new MarketDAO();
	ArrayList<MarketDTO> board_list = dao.showBoard();
%>


	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<div class="container">
			<a class="back" href="#" onclick="location.href='Main.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-size:30px"> 마켓</span></i></a>
			<button class="sell" value="sell" onclick="location.href='UploadProduct.jsp'" >판매등록</button>
	</div>
	
	<div id="product">
				<table id = "list">
				
					<tr>
						<td>카테고리</td>
						<td>번호</td>
						<td>사진</td>
						<td>제목</td>
						<td>내용</td>
						<td>가격</td>
					</tr>
					
					<% for(int i=0; i<board_list.size(); i++){ %>
						<tr>
							
							<td><%= board_list.get(i).getProduct() %> </td>	
							<td><%=i+1 %>"></td>
							<td><a href="FleaMarket.jsp?product_pic=<%= board_list.get(i).getProduct_pic() %>"></a></td>
							<td><%= board_list.get(i).getProduct_title()%>"> </td>
							<td><%= board_list.get(i).getProduct_con()%>"> </td>
							<td><%= board_list.get(i).getProduct_price()%>"></td>
					
						</tr>
					<%} %>
				</table>
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