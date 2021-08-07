<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MatchingDTO"%>
<%@page import="com.model.MatchingDAO"%>
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
	ul>li{
		position: relative;
		display: inline-block;
		width: 100%;
		margin: 20px;
		overflow: hidden;
		font-size: 50px;
		color: white;
		background-color: #61da94;
	}
	ul>li::after{
		box-sizing: border-box;
		position: absolute;
		display: block;
		top: 50%;
		left: 50%;
		width: 87%;
		height: 87%;
		border: 2px #fff;
		transform: translate(-50%, -50%);
		text-align: left;
		color: #fff;
		opacity: 0;
		transition: 0.8s;
	}
 
</style>
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		MatchingDAO dao = new MatchingDAO();
		ArrayList<MatchingDTO> matchingList = dao.show();
	%>
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
	
	<h1>��Ī �ϴ� �� </h1>
	<br>
	<br>
	<hr>
	<h4 align ="left"> ���͸� </h4>
	<form action="FilteringServiceCon" method="post">
		<div align="left">
			<div>
				<b>���� | </b>
				<%if(info.getGender().equals("����")){ %>
				����<input type="radio" value="����" name="gender">
				<%}else{ %>
				����<input type="radio" value="����" name="gender">
				<%} %>
				�������<input type="radio" value="�������" name="gender">
			</div>
			<br>
			<div>
				<b>��å�� | </b>
				<input type="date" name="min_date"> ~ <input type="date" name="max_date">
			</div>
			<br>
			<div>
			<b>�ݷ��� ũ�� | </b>
				<%if(info.getDog_size().equals("����")){ %>
				����<input type="radio" value="����" name="dog_size">
				������ ����<input type="radio" value="��������" name="dog_size">
				������ ����<input type="radio" value="��������" name="dog_size">
				<%} else if(info.getDog_size().equals("����")){ %>
				����<input type="radio" value="����" name="dog_size">
				������ ����<input type="radio" value="��������" name="dog_size">
				������ ����<input type="radio" value="��������" name="dog_size">
				<%} else{ %>
				����<input type="radio" value="����" name="dog_size">
				������ ����<input type="radio" value="��������" name="dog_size">
				������ ����<input type="radio" value="��������" name="dog_size">
				<%} %>
			</div>
			<br>
			<div>
				<b>�ݷ��� ���� | </b>
				<%if(info.getDog_gender().equals("����")){ %>
				����<input type="radio" value="����" name="dog_gender">
				���ư� ����<input type="radio" value="���ƾ���" name="dog_gender">
				���ư� �߼�<input type="radio" value="�����߼�" name="dog_gender">
				<%} else if(info.getDog_gender().equals("����")){ %>
				����<input type="radio" value="����" name="dog_gender">
				���ư� ����<input type="radio" value="���Ƽ���" name="dog_gender">
				���ư� �߼�<input type="radio" value="�����߼�" name="dog_gender">
				<%} %>
				�߼�<input type="radio" value="�߼�" name="dog_gender">
				�߼��� ����<input type="radio" value="�߼�����" name="dog_gender">
				�߼��� ����<input type="radio" value="�߼�����" name="dog_gender">
			</div>
			<br>
			<div>
				<input type = "submit" value = "��������">
				<input type = "reset" value = "�ʱ�ȭ">
			</div>
		</div>
	</form>

	<hr>
		
	<input type ="button" value ="�游���" name ="make" onclick="location.href='CreateMatching.jsp'">
	<br><br>
	
	<div>
		<ul>
			<%for(int i = 0; i<matchingList.size(); i++){ %>
			<li>
				������: <%= matchingList.get(i).getChatting_room_title() %><br>
				����: <%= matchingList.get(i).getNickname() %><br>
				��å��: <%= matchingList.get(i).getMatching_date() %> <%= matchingList.get(i).getHour() %>�� <%= matchingList.get(i).getMinute() %>��<br>
				���� ����: <%= matchingList.get(i).getGender() %><br>
				���� ����: <%= matchingList.get(i).getMin_age() %> ~ <%= matchingList.get(i).getMax_age() %><br>
				������ ���� ����: <%= matchingList.get(i).getDog_gender() %><br>
				������ ũ�� ����: <%= matchingList.get(i).getDog_size() %>
				<input type="button" value="�����ϱ�" name="1" onClick="location.href='ChatTest.jsp?chatnum=1'">
			</li>
			<%} %>
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