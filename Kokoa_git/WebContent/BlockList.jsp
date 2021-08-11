<%@page import="com.model.BanDTO"%>
<%@page import="com.model.BanDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>차단목록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
	function addBan(){
		$('#addBan').show();
	}
	function unBan(){
		$('.ckbox').show();
		$('.confirm').show();
	}
</script>
</head>
<style>
		body{
	      padding-bottom:150px;
	      position:relative;
		  padding-bottom:150px;
		  top:150px;
		  text-align:center;
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
	   .back{
			position:fixed;
			top:20px;
			left:40px;
			padding-top:150px;
			color:#61da94;
 		}
 		.blocklist{
 			margin-left:auto;
 			margin-right:auto;
 			padding-top:70px;
 		}
 		.blockTitle{
 			font-weight:medium;
 			font-size:30px;
 		}
 		.block_content{
 			font-size:25px;
 		}
 		input[type="checkbox"]{

			width: 30px; /*Desired width*/
			height: 30px; /*Desired height*/
			cursor: pointer;
 		}
 		.delete{
 			position:relative;
 			font-size:25px;
 			left:150px;
 			
 		}
 		.delete > a{
 			color:#61da94;
 		}
 		.confirm{
	   		font-size:15px;
	   		background-color:#61da94;
	   		padding:15px 35px;
	   		border:1;
	   		outline:0;
	   		border: 1px solid #61da94;
	   		border-radius:5%;
	   		color:white;
	   		z-index:99;
 		}
</style>
</head>
<body>

<% 
	MemberDTO info = (MemberDTO)session.getAttribute("info");
%>

	<%if (info == null) {%>
	<%  response.sendRedirect("Login.jsp"); } %>
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
		<table class="icon">
			<tr align="left">
				<td>
					<a class="back" href="#" onclick="location.href='MyPage.jsp'"><i class="fas fa-arrow-left fa-2x"><span style="font-family: 'Jua', sans-serif; font-size:30px"> 차단 목록</span></i></a>
				</td>
			</tr>
		</table>
	<form class="blocklist_form" action="DeleteBanMemberServiceCon" method="post" >
		<table class="blocklist" style="border:1px; width:600px; height:400px;">
			<tr>
				<td></td>
				<td><span class="blockTitle"><b>차단ID</b></span></td>
				<td><span class="blockTitle"><b>차단한 날짜</b></span></td>
			</tr>
			<%
				BanDAO dao = new BanDAO(); 
				ArrayList<BanDTO> block_list = dao.showBanMem(info.getMem_num());
				if(block_list.size()!=0){
			%>
			<%if(info.getMem_num() == block_list.get(0).getBan_mem_num()) {%>
			<%for(int i=0; i<block_list.size(); i++){ %>
			<tr>
				<td><input type="checkbox" name="chk" value="<%=block_list.get(i).getBan_num()%>" hidden="hidden" class="ckbox">
				<td><span class="block_content"><%=block_list.get(i).getBan_id() %></span></td>
				<td><span class="block_content"><%=block_list.get(i).getBlock_date() %></span></td>
			</tr>
			<%} %>
			<%} %>
			<%} %>
		</table>
		<div>
			<input type="submit" class="confirm" value="제거하기" hidden="hidden">
		</div>
	</form>
	<div class="delete">
		<a href="#" onclick='unBan()'><i class="far fa-minus-square fa-2x"></i></a>
		<a href="#" onclick='addBan()'><i class="far fa-plus-square fa-2x"></i></a>
	</div>
		<div id="addBan" hidden="hidden">
		<form action="BanServiceCon">
			<input type="hidden" name="ban_mem_num" value="<%=info.getMem_num() %>">
			<input type="text" name="ban_id" placeholder="차단할 id를 입력해주세요">
			<input type="submit" value="차단하기">
		</form>
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