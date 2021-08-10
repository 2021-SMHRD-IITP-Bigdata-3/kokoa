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
   			<span style="font-size: 65px;">��å ���� �����ϱ�</span>
   			<br><br><br><br><br><br>
   			<div>
   				<div>
   					<div class='div1'>����</div>
   					<br>
					<div>
						<input style="font-size: 50px; width: 100%; height: 65px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" type="text" name="chatting_room_title">
					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>��å ��¥ �� �ð�</div>
   					<br>
   					<div>
   						<input type="date" style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="matching_date">
   						<select name="hour" style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;">
   							<%for(int i=1; i<25; i++){ %>
   							<option value ="<%=i%>"><%=i%></option>
   							<%} %>
   						</select>
   						<span style="font-size: 50px;">��</span>
   						<select name="minute" style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;">
   							<%for(int i=0; i<61; i++){ %>
   							<option value ="<%=i%>"><%=i%></option>
   							<%} %>
   						</select>
   						<span style="font-size: 50px;">��</span>
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>��å�� ����</div>
   					<br>
   					<div>
   						<input type="text" name="location" style="font-size: 50px; width: 100%; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" placeholder="�� �Է�">
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>����</div>
   					<br>
   					<div>
   						<input style="font-size: 50px; width: 30%; height: 65px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" type="text" name="min_age" placeholder="�ּ� ����">
   						<span style="font-size: 50px; padding-left: 10px; padding-right: 10px">~</span>
   						<input style="font-size: 50px; width: 30%; height: 65px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" type="text" name="max_age" placeholder="�ִ� ����">
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>����</div>
   					<br>
   					<div>
   						<select style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="gender">
	  						<%if(info.getGender().equals("����")){ %>
	  							<option value="����">������</option>
	  						<%} else{ %>
	  							<option value="����">������</option>
	  						<%} %>
   							<option value="�������">�������</option>
   						</select>
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>������ ����</div>
   					<br>
   					<div>
   						<select style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="dog_gender">
   							<%if(info.getDog_gender().equals("����")){ %>
   							<option value="����">���Ƹ�</option>
   							<option value="���ƾ���">���ư� ���Ƹ�</option>
   							<option value="�����߼�">���ư� �߼���</option>
   							<%} else if(info.getDog_gender().equals("����")){ %>
   							<option value="����">���Ƹ�</option>
   							<option value="���ƾ���">���ư� ���Ƹ�</option>
   							<option value="�����߼�">���ư� �߼���</option>
   							<%} else{ %>
   							<option value="�߼�">�߼���</option>
   							<option value="�����߼�">�߼��� ���Ƹ�</option>
   							<option value="�����߼�">�߼��� ���Ƹ�</option>
   							<%} %>
   							<option value="�������">�������</option>
   						</select>
   					</div>
   				</div>
   				<br><br><br>
   				<div>
   					<div class='div1'>������ ũ��</div>
   					<br>
   					<div>
   						<select style="font-size: 50px; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px;" name="dog_size">
   							<%if(info.getDog_size().equals("����")){ %>
   							<option value="����">������</option>
   							<option value="��������">������ ������</option>
   							<option value="��������">������ ������</option>
   							<%}else if(info.getDog_size().equals("����")){ %>
   							<option value="����">������</option>
   							<option value="��������">������ ������</option>
   							<option value="��������">������ ������</option>
   							<%}else{ %>
   							<option value="����">������</option>
   							<option value="��������">������ ������</option>
   							<option value="��������">������ ������</option>
   							<%} %>
   							<option value="�������">�������</option>
   						</select>
   					</div>
   				</div>
   				<br><br><br>
   				<hr>
   				<br><br><br>
   				<div>
	   				<input type="submit" value="�� �� �� ��" style="font-size:50px; width: 100%; padding-left: 12px; padding-top: 6px; padding-bottom: 6px; padding-right: 12px; border-radius: 10px; background-color: #61da94; color: white">
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