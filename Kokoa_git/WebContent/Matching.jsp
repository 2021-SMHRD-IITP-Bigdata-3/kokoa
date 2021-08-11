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
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>매칭</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
		z-index: 9999;
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
		border: 5px solid #61da94;
		border-radius: 30px;
		font-size: 50px;
		font-family: 'Jua', sans-serif;
		padding-top: 10px;
		padding-bottom: 10px;
		background-color: #ebfcf2;
	}
 	.limitation{
		width: 100%;
		text-align: center;

	}
	.limitation>tr>td:first-child{
 		text-align: center;
 	}
 	.info_tr>td{
 		font-size: 30px;
		font-family: 'Jua', sans-serif;
		padding-left: 30px;
 	}
 	#joinChat{
 		width: 100%;
 		background-color:#61da94;
 		color:white;
 		font-size: 50px;
 	}
 	#filter{
 		font-size: 30px;
 	}
 	#room_num{
 		width: 15%;
 		text-align: center;
 		border-right: 5px solid #61da94;
 	}
 	#room_title{
 		padding-left: 30px;
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
	
	<h1>매칭 하는 곳 </h1>
	<br>
	<br>
	<hr>
	<div>
		<hr>
		<h1>
			필터링을 먼저 해야 방에 참여하실 수 있습니다.
			<button onclick="showFilter()" id="filter_btn1"><img src="icons/filter.png" width="50px" height="50px"></button>
			<button onclick="hideFilter()" id="filter_btn2" hidden="hidden" style="float:right; width:60px; height:60px;"><img src="icons/filter.png" width="50px" height="50px"></button>
		</h1>
		
		<hr>
		<div id="filter" hidden="hidden">
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
						<b>산책일 | </b>
						<input type="date" name="min_date"> ~ <input type="date" name="max_date">
					</div>
					<br>
					<div>
						<b>동네 | </b>
						<input type="text" name="location" placeholder="동 이름">
					</div>
					<br>
					<div>
						<b>나이 | </b>
						<input type="text" name="min_age" placeholder="최소 나이"> ~ <input type="text" name="max_age" placeholder="최대 나이">
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
			<br>
			<hr>
		</div>
		
		<br><br>
		
		
		<div align="right">	
			<input type ="button" value ="방만들기" name ="make" onclick="location.href='CreateMatching.jsp'">
		</div>
		<ul>
			
			<% if(matchingList != null){
				for(int i = 0; i<matchingList.size(); i++){ %>	
				<li>
					<div id=info align="left">
						<table class="info">
							<tr>
								<td rowspan="3" id="room_num"><%= matchingList.get(i).getChatting_room_num() %></td>
								<td id="room_title"><%= matchingList.get(i).getChatting_room_title() %></td>
						 	</tr>
						 	<tr class="info_tr">
								<td>
									<%= matchingList.get(i).getMatching_date() %> <%= matchingList.get(i).getHour() %>시 <%= matchingList.get(i).getMinute() %>분 <%= matchingList.get(i).getLocation() %>
								</td>
						 	</tr>
						 	<tr class="info_tr">
								<td>
									<%if(matchingList.get(i).getGender().equals("남자")){ %>
									남자만 /
									<%}else if(matchingList.get(i).getGender().equals("여자")){ %>
									여자만 /
									<%} %>
									<%if(matchingList.get(i).getDog_gender().equals("수컷")){ %>
									수컷만 /
									<%}else if(matchingList.get(i).getDog_gender().equals("암컷")){ %>
									암컷만 /
									<%}else if(matchingList.get(i).getDog_gender().equals("중성")){ %>
									중성만 /
									<%}else if(matchingList.get(i).getDog_gender().equals("수컷암컷")){ %>
									수컷과 암컷만 /
									<%}else if(matchingList.get(i).getDog_gender().equals("수컷중성")){ %>
									수컷과 중성만 /
									<%}else if(matchingList.get(i).getDog_gender().equals("수컷암컷")){ %>
									암컷과 중성만 /
									<%} %>
									<%if(matchingList.get(i).getDog_size().equals("소형")) {%>
									소형만 /
									<%}else if(matchingList.get(i).getDog_size().equals("중형")) {%>
									중형만 /
									<%}else if(matchingList.get(i).getDog_size().equals("대형")) {%>
									대형만 /
									<%}else if(matchingList.get(i).getDog_size().equals("소형중형")) {%>
									소형과 중형만 /
									<%}else if(matchingList.get(i).getDog_size().equals("소형대형")) {%>
									소형과 대형만 /
									<%}else if(matchingList.get(i).getDog_size().equals("중형대형")) {%>
									중형과 대형만 /
									<%} %>
									<%= matchingList.get(i).getMin_age() %>세 ~ <%= matchingList.get(i).getMax_age() %>세
								</td>
						 	</tr>
						</table>
					</div>
					<div id="limitation" align="left">
						<table class="limitation">

						</table>
					</div>
				</li>
			<%}}else{
				for(int i = 0; i<matchingFilterList.size(); i++){ %>
				<li>
					<div id=info align="left">
						<table class="info">
							<tr>
								<td>방제목</td>
								<td><%= matchingFilterList.get(i).getChatting_room_title() %></td>
						 	</tr>
						 	<tr>
								<td>방장</td>
								<td><%= matchingFilterList.get(i).getNickname() %></td>
						 	</tr>
						 	<tr>
								<td>산책일</td>
								<td> <%= matchingFilterList.get(i).getMatching_date() %> <%= matchingFilterList.get(i).getHour() %>시 <%= matchingFilterList.get(i).getMinute() %>분</td>
						 	</tr>
						 	<tr>
								<td>산책장소</td>
								<td><%= matchingFilterList.get(i).getLocation() %></td>
						 	</tr>
						</table>
					</div>
					<div id="limitation" align="left">
						<table class="limitation">
							<tr>
								<td>성별 제한 - <%= matchingFilterList.get(i).getGender() %> / 나이 제한 - <%= matchingFilterList.get(i).getMin_age() %> ~ <%= matchingFilterList.get(i).getMax_age() %></td>
						 	</tr>
						 	<tr>
								<td>강아지 성별 제한 - <%= matchingFilterList.get(i).getDog_gender() %> / 강아지 크기 제한 - <%= matchingFilterList.get(i).getDog_size() %></td>
						 	</tr>
						</table>
					</div>
					<br>
					<input type="button" id="joinChat" value="참 여 하 기" name="<%=matchingFilterList.get(i).getChatting_room_num() %>" onClick="location.href='ChatTest.jsp?chatnum=<%=matchingFilterList.get(i).getChatting_room_num() %>'">
					<br><br><br>
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