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
			matchingFilterList = dao.showF(gender, min_age, max_age, min_date, max_date, dog_size, dog_gender);
		}
	%>
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
	
	<h1>매칭 하는 곳 </h1>
	<br>
	<br>
	<hr>
	<h4 align ="left"> 필터링 </h4>
	<form action="FilteringServiceCon" method="post">
		<div align="left">
			<div>
				<b>성별 | </b>
				<%if(info.getGender().equals("남자")){ %>
				남자<input type="radio" value="남자" name="gender">
				<%}else{ %>
				여자<input type="radio" value="여자" name="gender">
				<%} %>
				상관없음<input type="radio" value="%" name="gender">
			</div>
			<br>
			<div>
				<b>나이 | </b>
				<input type="text" name="min_age" placeholder="최소 나이"> ~ <input type="text" name="max_age" placeholder="최대 나이">
			</div>
			<br>
			<div>
				<b>산책일 | </b>
				<input type="date" name="min_date"> ~ <input type="date" name="max_date">
			</div>
			<br>
			<div>
			<b>반려견 크기 | </b>
				<%if(info.getDog_size().equals("소형")){ %>
				소형<input type="radio" value="소형" name="dog_size">
				소형과 중형<input type="radio" value="소형중형" name="dog_size">
				소형과 대형<input type="radio" value="소형대형" name="dog_size">
				<%} else if(info.getDog_size().equals("중형")){ %>
				중형<input type="radio" value="중형" name="dog_size">
				중형과 소형<input type="radio" value="소형대형" name="dog_size">
				중형과 대형<input type="radio" value="중형대형" name="dog_size">
				<%} else{ %>
				대형<input type="radio" value="대형" name="dog_size">
				대형과 소형<input type="radio" value="소형중형" name="dog_size">
				대형과 중형<input type="radio" value="중형대형" name="dog_size">
				<%} %>
				상관없음<input type="radio" value="%" name="dog_size">
			</div>
			<br>
			<div>
				<b>반려견 성별 | </b>
				<%if(info.getDog_gender().equals("수컷")){ %>
				수컷<input type="radio" value="수컷" name="dog_gender">
				수컷과 암컷<input type="radio" value="수컷암컷" name="dog_gender">
				수컷과 중성<input type="radio" value="수컷중성" name="dog_gender">
				<%} else if(info.getDog_gender().equals("암컷")){ %>
				암컷<input type="radio" value="암컷" name="dog_gender">
				암컷과 수컷<input type="radio" value="수컷암컷" name="dog_gender">
				암컷과 중성<input type="radio" value="암컷중성" name="dog_gender">
				<%} else{ %>
				중성<input type="radio" value="중성" name="dog_gender">
				중성과 수컷<input type="radio" value="수컷중성" name="dog_gender">
				중성과 암컷<input type="radio" value="암컷중성" name="dog_gender">
				<%} %>
				상관없음<input type="radio" value="%" name="dog_gender">
			</div>
			<br>
			<div>
				<input type = "submit" value = "필터적용">
				<input type = "reset" value = "초기화">
			</div>
		</div>
	</form>

	<br><br>
	
	<div>
		<hr>
		<h1>필터링을 먼저 해야 방에 참여하실 수 있습니다.</h1>
		<hr>
		<div align="right">	
			<input type ="button" value ="방만들기" name ="make" onclick="location.href='CreateMatching.jsp'">
		</div>
		<ul>
			
			<% if(matchingList != null){
				for(int i = 0; i<matchingList.size(); i++){ %>	
				<li>
					방제목: <%= matchingList.get(i).getChatting_room_title() %><br>
					방장: <%= matchingList.get(i).getNickname() %><br>
					산책일: <%= matchingList.get(i).getMatching_date() %> <%= matchingList.get(i).getHour() %>시 <%= matchingList.get(i).getMinute() %>분<br>
					성별 제한: <%= matchingList.get(i).getGender() %><br>
					나이 제한: <%= matchingList.get(i).getMin_age() %> ~ <%= matchingList.get(i).getMax_age() %><br>
					강아지 성별 제한: <%= matchingList.get(i).getDog_gender() %><br>
					강아지 크기 제한: <%= matchingList.get(i).getDog_size() %>
				</li>
			<%}}else{
				for(int i = 0; i<matchingFilterList.size(); i++){ %>
				<li>
					필터링 후<br>
					방제목: <%= matchingFilterList.get(i).getChatting_room_title() %><br>
					방장: <%= matchingFilterList.get(i).getNickname() %><br>
					산책일: <%= matchingFilterList.get(i).getMatching_date() %> <%= matchingFilterList.get(i).getHour() %>시 <%= matchingFilterList.get(i).getMinute() %>분<br>
					성별 제한: <%= matchingFilterList.get(i).getGender() %><br>
					나이 제한: <%= matchingFilterList.get(i).getMin_age() %> ~ <%= matchingFilterList.get(i).getMax_age() %><br>
					강아지 성별 제한: <%= matchingFilterList.get(i).getDog_gender() %><br>
					강아지 크기 제한: <%= matchingFilterList.get(i).getDog_size() %>
					<input type="button" value="참여하기" name="<%=matchingFilterList.get(i).getChatting_room_num() %>" onClick="location.href='ChatTest.jsp?chatnum=<%=matchingFilterList.get(i).getChatting_room_num() %>'">
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