<%@page import="com.model.PCommentDAO"%>
<%@page import="com.model.PCommentDTO"%>
<%@page import="com.model.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.MarketDTO"%>
<%@page import="com.model.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>물품 상세 설명</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	body{
      padding-bottom:150px;
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
	  font-size:27px;
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
	  height: 40px;
	}
	
	.content-profilePhoto {
	  width: 40px;
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
	  font-size: 32px;
	}
	.content-munuIcon{
		color:white;
	}
	
	.views {
		font-weight: bold;
	  	font-size: 22px;
	}

	.content-contents-contents > div {
	  font-size: 30px;
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
	  font-size:30px;
	}
	.comment-content {
	  width: 100%;
	  font-size:26px;
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
	  position:relative;
	  top:20px;
	  flex: 9;
	  width: 100%;
	  height: 30px;
	  font-size: 26px;
	  border: 0;
	  outline: none;
	}
	
	.regist {
	  position:relative;
	  top:-15px;
	  width: 30px;
	  font-size: 30px;
	  color: #61da94;
	  width: auto;
	  border: 1px solid #ebebeb;
	  float:right;
	  
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
		left:10%;
	}
</style>
</head>
<body class="pt-5">


<%
	int product_num = 0;
	if(session.getAttribute("product_num_1") == null){
	product_num = Integer.parseInt(request.getParameter("product_num"));
	} else{
	product_num = (Integer)session.getAttribute("product_num_1");
	}

	MarketDAO dao = new MarketDAO();
	MarketDTO dto = dao.showOne(product_num);
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	ArrayList<MarketDTO> board_list = dao.showBoard();
	PCommentDAO dao1 = new PCommentDAO();
	ArrayList<PCommentDTO> comment_list = dao1.showComment();
	
	int cnt = 0;
	for(int i = 0; i<comment_list.size(); i++){
		if(comment_list.get(i).getProduct_num_1()==product_num){
			cnt++;
		}
	}
	
	int count;

	if(session.getAttribute(product_num+"count") != null)
	{
		count = ((Integer)session.getAttribute(product_num+"count")).intValue();
		
	}

	else
	{
		count = 0;	
	}

	count++;

%>

	
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
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
                    <div><img style="width:50px; height:50px;"src="img/<%=dto.getproduct_pic() %>" alt="" class="content-profilePhoto"></div>
                    <div class="content-more">
                        <div class="content-id"><%= dto.getproduct_title() %></div>
                        <div class="content-moreIcon"><i class="fas fa-ellipsis-h"></i></div>
                    </div>
                </div>
                <div class="content-contents">
                    <img src="img/<%=dto.getproduct_pic() %>" class="content-contents" alt="">
                </div>
                <div class="content_bottom">
                    <div class="content-menuDiv">
                        <ul class="content-menuLeft">
                            <li class="content-menuIcon"><i class="far fa-comment" style="font-size:32px;"></i><span style="'Jua', sans-serif; font-size:30px;"><%=cnt %></span></li>
                        </ul>
                    </div>
                    <div class="views"> 조회수 <%=count %></div>
                    <div class="content-contents-contents">
                        <div class="contents-id"><%= dto.getproduct_title() %></div>
                        <div class="contents-contents"><p class="contents-contents" style="white-space: pre-line;"><%= dto.getproduct_con() %></p></div>
                    	<% for(int i=0; i<comment_list.size(); i++) { %>
                    	<% if(comment_list.get(i).getProduct_num_1()==dto.getproduct_num()){ %>
                        <div class="comment">
                            <div class="comment-id"><%=comment_list.get(i).getId() %></div>
                            <div class="comment-content"><%=comment_list.get(i).getComment_con() %></div>
                        </div>
                  		<%} %>
                  		<%} %>
                    </div>
                    <div class="comment-registration">
                    <form method="post" action="ProductCommentServiceCon" style="width:800px;">
                    	<input type="hidden" name="id" value="<%=info.getId() %>">
                    	<input type="hidden" name="product_num_1" value="<%=dto.getproduct_num() %>">
                        <input type="text" class="input-comment" placeholder="여러분의 소중한 댓글을 달아주세요" name="comment_con">
                        <input type="submit" value="게시하기" class="regist">
                    </form>
                    </div>
                </div>
            </div>
        </section>
        </div>    
	<footer>
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="175px"></a>
	</footer>
		<%
		session.setAttribute(product_num+"count", new Integer(count));
		%>
		<%session.removeAttribute("product_num_1"); %>
</body>
</html>