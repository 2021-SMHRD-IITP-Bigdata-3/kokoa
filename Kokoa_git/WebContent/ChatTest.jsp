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
<title>Insert title here</title>
<style type="text/css">
	#main{
		width: 100%;
		height: 1000px;
		background-color: #34862E;
		background-image: url("icons/chatbacksmall.png");
		color: white;
		overflow: scroll;
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

%>	
	<div id="main">
		<div id="chat">
		</div>
	</div>

	�� �г��� : <%= info.getNickname() %>  

	<input id="content" type="text" placeholder="���� �Է�" name="content">
	
	<button id="send">�Է�</button>
	<input type="button" value="ä�ù� ������" name="main" onClick="location.href='ChatList.jsp'">

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
			    		for(var i = 0; i < res.length; i++){
			    			var id = res[i].id;
			    			var content = res[i].content;
			    		    chatContainer.append("<div>"+id+" : " + content + "</div>");
			    		}
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