<%@page import="com.model.MatchingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MatchingDAO"%>
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
   		padding-top: 150px;
      padding-bottom:150px;
      align-content: center;
      background-color: #f2f2f2;
   }
   header{
      position: fixed;
      top:0;
      left:0;
      background-color: #61da94;
      height: 150px;
      width: 100%;
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
	form{
		width: 90%;
		margin: auto;
	}
	.div1{
		font-size: 50px;
	}
</style>
</head>
<body>
<%MemberDTO info = (MemberDTO)session.getAttribute("info");%>
	<header>
    	<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
    	<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
      	<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   	</header>
   	<form action="CreateMatchingServiceCon" method="post">
   		<input type="text" value="<%=info.getId() %>" name="id" hidden="hidden">
   		<input type="text" value="<%=info.getNickname() %>" name="nickname" hidden="hidden"
   		>  		
   		<div>
   			<br><br><br>
   			<span style="font-size: 65px;">산책 일정 생성하기</span>
   			<br><br><br><br><br><br>
   			<div>
   				<div>
   					<div class='div1'>제목</div>
   					<br>
					<div>
						<input style="font-size: 50px; width: 100%; height: 65px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" type="text" name="chatting_room_title">
					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>산책 날짜 및 시간</div>
   					<br>
   					<div>
   						<input type="date" style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="matching_date">
   						<select name="hour" style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;">
   							<%for(int i=1; i<25; i++){ %>
   							<option value ="<%=i%>"><%=i%></option>
   							<%} %>
   						</select>
   						<span style="font-size: 50px;">시</span>
   						<select name="minute" style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;">
   							<%for(int i=0; i<61; i++){ %>
   							<option value ="<%=i%>"><%=i%></option>
   							<%} %>
   						</select>
   						<span style="font-size: 50px;">분</span>
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>산책할 동네</div>
   					<br>
   					<div>
   						<input type="text" name="location" style="font-size: 50px; width: 100%; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" placeholder="동 입력">
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>나이</div>
   					<br>
   					<div>
   						<input style="font-size: 50px; width: 30%; height: 65px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" type="text" name="min_age" placeholder="최소 나이">
   						<span style="font-size: 50px; padding-left: 10px; padding-right: 10px">~</span>
   						<input style="font-size: 50px; width: 30%; height: 65px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" type="text" name="max_age" placeholder="최대 나이">
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>성별</div>
   					<br>
   					<div>
   						<select style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="gender">
	  						<%if(info.getGender().equals("남자")){ %>
	  							<option value="남자">남성만</option>
	  						<%} else{ %>
	  							<option value="여자">여성만</option>
	  						<%} %>
   							<option value="상관없음">상관없음</option>
   						</select>
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>강아지 성별</div>
   					<br>
   					<div>
   						<select style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="dog_gender">
   							<%if(info.getDog_gender().equals("수컷")){ %>
   							<option value="수컷">수컷만</option>
   							<option value="수컷암컷">수컷과 암컷만</option>
   							<option value="수컷중성">수컷과 중성만</option>
   							<%} else if(info.getDog_gender().equals("암컷")){ %>
   							<option value="암컷">암컷만</option>
   							<option value="수컷암컷">암컷과 수컷만</option>
   							<option value="암컷중성">암컷과 중성만</option>
   							<%} else{ %>
   							<option value="중성">중성만</option>
   							<option value="수컷중성">중성과 수컷만</option>
   							<option value="암컷중성">중성과 암컷만</option>
   							<%} %>
   							<option value="상관없음">상관없음</option>
   						</select>
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>강아지 크기</div>
   					<br>
   					<div>
   						<select style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="dog_size">
   							<%if(info.getDog_size().equals("소형")){ %>
   							<option value="소형">소형만</option>
   							<option value="소형중형">소형과 중형만</option>
   							<option value="소형대형">소형과 대형만</option>
   							<%}else if(info.getDog_size().equals("중형")){ %>
   							<option value="중형">중형만</option>
   							<option value="소형중형">중형과 소형만</option>
   							<option value="중형대형">중형과 대형만</option>
   							<%}else{ %>
   							<option value="대형">대형만</option>
   							<option value="소형대형">대형과 소형만</option>
   							<option value="중형대형">대형과 중형만</option>
   							<%} %>
   							<option value="상관없음">상관없음</option>
   						</select>
   					</div>
   				</div>
   				<br><br><br>
   				<hr>
   				<br><br><br>
   				<div>
	   				<input type="submit" value="생 성 하 기" style="font-size:50px; width: 100%; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px; background-color: #61da94; color: white">
   				</div>
   			</div>
   		</div>
   		<%	
   			MatchingDAO dao = new MatchingDAO();
   			ArrayList<MatchingDTO> dto = dao.show(); 
   		%>
   		<input type="text" name="mem_num" value="<%=info.getMem_num() %>" hidden="hidden">
   		<input type="text" name="chatnum" value="<%if(dto.size()!=0){ %><%=dto.get(0).getChatting_room_num()%><%}else{ %>1<%} %>" hidden="hidden">
   </form>
</body>
</html>