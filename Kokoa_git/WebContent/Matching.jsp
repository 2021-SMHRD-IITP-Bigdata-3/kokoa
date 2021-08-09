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
	ul>li{
		position: relative;
		display: inline-block;
		width: 100%;
		margin: 20px;
		overflow: hidden;
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
	#filter_btn1,#filter_btn2{
		float:right;
		width:60px;
		height:60px;
		background-color: white;
		border: 0;
		outline: 0;
	}
	.info{
		width: 100%;
		border-top: 3px solid #61da94;
		border-bottom: 3px solid #61da94;
		font-size: 50px;
	}
	.info>tr>td:first-child{
 		text-align: right;
 		padding-right: 10px;
 	}
 	.info>tr>td:nth-child(2){
 		text-align: left;
 		padding-left: 10px;
 	}
 	.limitation{
		width: 100%;
		border-top: 3px solid #61da94;
		border-bottom: 3px solid #61da94;
		text-align: center;
		font-size: 30px;
	}
	.limitation>tr>td:first-child{
 		text-align: center;
 	}
</style>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
	function showFilter(){
		$('#filter').show();
		$('#filter_btn1').hide();
		$('#filter_btn2').show();
	}
	function hideFilter(){
		$('#filter').hide();
		$('#filter_btn1').show();
		$('#filter_btn2').hide();
	}
	function showLimit(){
		$('#limitation').show();
	}
	function hideLimit(){
		$('#limitation').hide();
	}
</script>
</head>
<body>
	<%
		ArrayList<MatchingDTO> matchingList = null;
		ArrayList<MatchingDTO> matchingFilterList = null;
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		MatchingDAO dao = new MatchingDAO();
		if((String)session.getAttribute("dog_gender") == null){
			matchingList = dao.show();
		} else{
			String gender = (String)session.getAttribute("gender");
			int min_age = (Integer)session.getAttribute("min_age");
			int max_age = (Integer)session.getAttribute("max_age");
			String min_date = (String)session.getAttribute("min_date");
			String max_date = (String)session.getAttribute("max_date");
			String dog_size = (String)session.getAttribute("dog_size");
			String dog_gender = (String)session.getAttribute("dog_gender");
			String location = (String)session.getAttribute("location");
			matchingFilterList = dao.showF(gender, min_age, max_age, min_date, max_date, dog_size, dog_gender, location);
		}
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
	<div>
		<hr>
		<h1>
			���͸��� ���� �ؾ� �濡 �����Ͻ� �� �ֽ��ϴ�.
			<button onclick="showFilter()" id="filter_btn1"><img src="icons/filter.png" width="50px" height="50px"></button>
			<button onclick="hideFilter()" id="filter_btn2" hidden="hidden" style="float:right; width:60px; height:60px;"><img src="icons/filter.png" width="50px" height="50px"></button>
		</h1>
		
		<hr>
		<div id="filter" hidden="hidden">
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
						�������<input type="radio" value="%" name="gender">
					</div>
					<br>
					<div>
						<b>��å�� | </b>
						<input type="date" name="min_date"> ~ <input type="date" name="max_date">
					</div>
					<br>
					<div>
						<b>���� | </b>
						<input type="text" name="location" placeholder="�� �̸�">
					</div>
					<br>
					<div>
						<b>���� | </b>
						<input type="text" name="min_age" placeholder="�ּ� ����"> ~ <input type="text" name="max_age" placeholder="�ִ� ����">
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
						�������<input type="radio" value="%" name="dog_size">
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
						���ư� ����<input type="radio" value="���ƾ���" name="dog_gender">
						���ư� �߼�<input type="radio" value="�����߼�" name="dog_gender">
						<%} else{ %>
						�߼�<input type="radio" value="�߼�" name="dog_gender">
						�߼��� ����<input type="radio" value="�����߼�" name="dog_gender">
						�߼��� ����<input type="radio" value="�����߼�" name="dog_gender">
						<%} %>
						�������<input type="radio" value="%" name="dog_gender">
					</div>
					<br>
					<div>
						<input type = "submit" value = "��������">
						<input type = "reset" value = "�ʱ�ȭ">
					</div>
				</div>
			</form>
			<br>
			<hr>
		</div>
		
		<br><br>
		
		
		<div align="right">	
			<input type ="button" value ="�游���" name ="make" onclick="location.href='CreateMatching.jsp'">
		</div>
		<ul>
			
			<% if(matchingList != null){
				for(int i = 0; i<matchingList.size(); i++){ %>	
				<li>
					<div id=info align="left" onclick="showLimit()">
						<table class="info">
							<tr>
								<td>������</td>
								<td><%= matchingList.get(i).getChatting_room_title() %></td>
						 	</tr>
						 	<tr>
								<td>����</td>
								<td><%= matchingList.get(i).getNickname() %></td>
						 	</tr>
						 	<tr>
								<td>��å��</td>
								<td> <%= matchingList.get(i).getMatching_date() %> <%= matchingList.get(i).getHour() %>�� <%= matchingList.get(i).getMinute() %>��</td>
						 	</tr>
						 	<tr>
								<td>��å���</td>
								<td><%= matchingList.get(i).getLocation() %></td>
						 	</tr>
						</table>
					</div>
					<div id="limitation" align="left" hidden=hidden onclick="hideLimit()">
						<table class="limitation">
							<tr>
								<td>���� ���� - <%= matchingList.get(i).getGender() %> / ���� ���� - <%= matchingList.get(i).getMin_age() %> ~ <%= matchingList.get(i).getMax_age() %></td>
						 	</tr>
						 	<tr>
								<td>������ ���� ���� - <%= matchingList.get(i).getDog_gender() %> / ������ ũ�� ���� - <%= matchingList.get(i).getDog_size() %></td>
						 	</tr>
						</table>
					</div>
				</li>
			<%}}else{
				for(int i = 0; i<matchingFilterList.size(); i++){ %>
				<li>
					<div id=info align="left" onclick="showLimit()">
						������: <%= matchingFilterList.get(i).getChatting_room_title() %><br>
						����: <%= matchingFilterList.get(i).getNickname() %><br>
						��å��: <%= matchingFilterList.get(i).getMatching_date() %> <%= matchingFilterList.get(i).getHour() %>�� <%= matchingFilterList.get(i).getMinute() %>��<br>
						��å���: <%= matchingFilterList.get(i).getLocation() %><br>
					</div>
					<div id="limitation" align="left" hidden=hidden onclick="hideLimit()">
						���� ����: <%= matchingFilterList.get(i).getGender() %><br>
						���� ����: <%= matchingFilterList.get(i).getMin_age() %> ~ <%= matchingFilterList.get(i).getMax_age() %><br>
						������ ���� ����: <%= matchingFilterList.get(i).getDog_gender() %><br>
						������ ũ�� ����: <%= matchingFilterList.get(i).getDog_size() %>
					</div>
					<input type="button" value="�����ϱ�" name="<%=matchingFilterList.get(i).getChatting_room_num() %>" onClick="location.href='ChatTest.jsp?chatnum=<%=matchingFilterList.get(i).getChatting_room_num() %>'">
				</li>
			<%}} %>
		</ul>
	</div>
	<%
		session.removeAttribute("gender");
		session.removeAttribute("min_age");
		session.removeAttribute("max_age");
		session.removeAttribute("min_date");
		session.removeAttribute("max_date");
		session.removeAttribute("dog_size");
		session.removeAttribute("dog_gender");
	%>
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