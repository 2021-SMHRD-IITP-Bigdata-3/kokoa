<%@page import="com.model.MatchingDAO"%>
<%@page import="com.model.IndivisualChatDTO"%>
<%@page import="com.model.IndivisualChatDAO"%>
<%@page import="javax.xml.bind.ParseConversionEvent"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>ä�ù�</title>
<style type="text/css">
	#main{
		width: 100%;
		height: 100%;
		background-color: #34862E;
		color: black;
		overflow: scroll;
		font-size: 50px;
	}
	body{
		font-family: 'Jua', sans-serif;
	}
	#bottom{
		padding: 30px;
		font-size: 50px;
		position: fixed;
		width:100%;
		height:125px;
      	bottom: 0;
      	left: 0;
      	z-index:99;
      	background-color: #E8E8E8;
	}
	#content{
		width:65%;
		height:90px;
		border-radius: 20px;
		font-size: 50px;
		padding: 10px;
	}
	#send{
		width:114px;
		height:114px;
		border-radius: 20px;
		font-size: 30px;
	}
	#exit{
		width:114px;
		height:114px;
		border-radius: 20px;
		font-size: 30px;
	}
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script  src="js/bootstrap.js"></script>
<script  src="js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>
<body>

<%
	// �α��� �� �ʿ�
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	
	// �� ���ý� �ʿ�
	request.setCharacterEncoding("EUC-KR");
	int chatnum = Integer.parseInt(request.getParameter("chatnum"));
	System.out.println("chatnum(chatTest1������) : " + chatnum);
	
	IndivisualChatDAO dao = new IndivisualChatDAO();
	dao.joinChat(info.getMem_num(), chatnum);
	
	MatchingDAO dao_m = new MatchingDAO();
	String title = dao_m.showI(chatnum); 

%>	
	<div id="main">
		<div id="chat">
		</div>
	</div>
	<footer id="bottom">	

		<input id="content" type="text" placeholder="���� �Է�" name="content">
		
		<button id="send">�Է�</button>
		<input type="button" id="exit" value="������" name="main" onClick="location.href='ChatList.jsp'">
	</footer>
	<script type="text/javascript">
	
		// �����ͺ��̽��� ����� ä�� ������ ���� �ѷ��ִ� �ѷ��ִ� �κ�
		// setInterval�� �ֱ����� ���� �Լ��� 0.2�ʸ��� ����Ʈ�ؼ� �ѷ��ְڴٴ� �ǹ�
		setInterval(function(){
			// num�� ä�ù� ��ȣ
			var num = <%=chatnum %>;
			$.ajax({
			       url: "ChatSelectCon", //��Ʈ�ѷ� URL
			       dataType: 'json',
			       type: 'POST',
			       data:{"num": num},
			       // �ѱ۵� �����ϵ��� ���ڵ�. jquery�� utf-8 ���
			       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			       success: function (res) {
			    	   // �ѷ��ְ� ���� ����ֱ� (�� �׷��� ��ȭ�� ��� �ݺ��ؼ� �Ѹ��� ��)
			    	   	$("#chat").empty();
			    	   	var chatContainer = $("#chat");
			    	   	// �Է����� res�� ChatSelectCon���� ������ ����Ʈ ����� ��� �ְ� �� �߿� member_id�� content�� �����ͼ�
			    	   	// for�� ����ؼ� �ѷ��ֱ�
			    	   	chatContainer.append("<header style='position: fixed; top:0; left:0; height: 150px; width: 100%; z-index:100; font-size:70px; text-align:center;'>"+"<%=title%>"+"</header>"+"<br>");
			    		for(var i = 0; i < res.length; i++){
			    			var id = res[i].id;
			    			var content = res[i].content;
			    			if(id=="<%=info.getNickname()%>"){
			    				chatContainer.append("<div align='right' style='clear:both; float:right; margin-right:20px; padding-right:20px; padding-left:20px;border-top: 3px solid white; border-radius:20px; background-color:yellow;'>"+id+"<br>"+content+"</div>");
			    			} else{
			    		    	chatContainer.append("<div align='left' style='clear:both; float:left; margin-left:20px; padding-right:20px; padding-left:20px;border-top: 3px solid white; border-radius:20px; background-color:white;'>"+id+"<br>"+content+"</div>");
			    			}
			    			chatContainer.append("<br><br><br>")
			    		}
		    			chatContainer.append("<br><br><br><br><br><br>")
			         console.log(res);
			       },error: function (xhr) {
			         //alert(xhr);
			       } 
			    });
		}, 200);

		
			// ���̵�� ä�ó��� �Է¹޴� �κ�
			// �Է¹��� ���� ChatInsertCon���� ������ �����ͺ��̽��� ������ ��
			$("#send").on('click',function(){
				var num = <%=chatnum %>;
				
				<%if (info!=null){ %>
					var id = "<%=info.getNickname()%>";
				<%} else{ %>
					var id = $('#id').val();
				<%} %>
				
				var content = $('#content').val();
				
				  $.ajax({
				       url: "ChatInsertCon", //��Ʈ�ѷ� URL
				       dataType: 'text',
				       type: 'POST',
				       data:{"num": num, "id":id,"content":content},
				       contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				       success: function (res) {
				        	console.log(res);
				       },error: function (xhr) {
				         //alert(xhr);
				       } 
				    });
			});
	</script>

</body>
</html>