<%@page import="java.util.ArrayList"%>
<%@page import="com.model.CourseDTO"%>
<%@page import="com.model.CourseDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body{
      padding-bottom:150px;
		text-align: center;
		align-content: center;
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
	#btn2{
		color: green;
		font-size:40px;
		font-weight: bold;
		background-color: #e8ffe8;
		border-style: solid;
		border-width:0px;
		border-bottom-width: 10px;
		border-bottom-color: green;
		width: 400px;
		height: 100px;
	}
	#btn1{
		color: green;
		font-size:40px;
		font-weight: bold;
		background-color: white;
		border: 0;
		width: 400px;
		height: 100px;
	}

	ul{
	   list-style:none;
	   padding-left:0px;
	   width:100%;
	   }
	li{
		border-top: 3px solid #61da94;
		border-bottom: 3px solid #61da94;
		margin-left: 10%;
	  	margin-right:10%;
	  	margin-bottom:5%;
	}
	tr{
		font-size: 40px;
	}
	td{
		text-align: left;
		padding: 10px;
	}
	
	.icon{
		text-align:left;
		left : 100px;
		padding-top : 120px;
	}
	.fas.fa-arrow-left.fa-3x{
		position:relative;
		left:100px;
	}
	.back{
		position:fixed;
		color:#61da94;
		z-index:1;
	}
	.write{
		position:fixed;
		z-index:1;
		right:120px;
		bottom:180px;
		color:#61da94;
	}
</style>
</head>
<body>
	<%MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		CourseDAO dao = new CourseDAO();
		ArrayList<CourseDTO> list = dao.show(id);
	%>
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
   <div style="width:100%; height:150px;"></div>
	<div class="btn">
		<br>
		<button id="btn1" onclick="location.href='Walk.jsp'">산 책 하 기</button><button id="btn2" onclick="location.href='WalkHistory.jsp'">산 책 기 록</button>
		<br><br><br>
	</div>
	<br><br><br>
    <div id="wrap">
        <ul id="gallery">
        	<%
        		if(list!=null){
        			for(int i = 0; i<list.size(); i++){
        			%>
        			<li>
        				<table>
        					<tr>
        						<td>산책일</td>
        						<td><%=list.get(i).getDate() %></td>
        					</tr>
        					<tr>
        						<td>산책 소요 시간</td>
        						<td><%=list.get(i).getTracking_time() %>
        					</tr>
        				</table>
        			</li>
        			<%	
        			}
        		}
        	%>
            
        </ul>
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