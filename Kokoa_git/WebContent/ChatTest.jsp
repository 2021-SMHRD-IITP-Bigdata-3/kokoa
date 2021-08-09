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
	// 로그인 시 필요
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	
	// 방 선택시 필요
	request.setCharacterEncoding("EUC-KR");
	int chatnum = Integer.parseInt(request.getParameter("chatnum"));
	System.out.println("chatnum(chatTest1페이지) : " + chatnum);
	
	IndivisualChatDAO dao = new IndivisualChatDAO();
	dao.joinChat(info.getMem_num(), chatnum);

%>	
	<div id="main">
		<div id="chat">
		</div>
	</div>

	내 닉네임 : <%= info.getNickname() %>  

	<input id="content" type="text" placeholder="내용 입력" name="content">
	
	<button id="send">입력</button>
	<input type="button" value="채팅방 나가기" name="main" onClick="location.href='ChatList.jsp'">

	<script type="text/javascript">
	
		// 데이터베이스에 저장된 채팅 정보를 웹에 뿌려주는 뿌려주는 부분
		// setInterval은 주기적인 실행 함수로 0.2초마다 셀렉트해서 뿌려주겠다는 의미
		setInterval(function(){
			// num은 채팅방 번호
			var num = <%=chatnum %>;
			$.ajax({
			       url: "ChatSelectCon", //컨트롤러 URL
			       dataType: 'json',
			       type: 'POST',
			       data:{"num": num},
			       // 한글도 가능하도록 인코딩. jquery는 utf-8 사용
			       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			       success: function (res) {
			    	   // 뿌려주고 나서 비워주기 (안 그러면 대화를 계속 반복해서 뿌리게 돼)
			    	   	$("#chat").empty();
			    	   	var chatContainer = $("#chat");
			    	   	// 입력인자 res에 ChatSelectCon에서 실행한 셀렉트 결과가 들어 있고 그 중에 member_id와 content를 가져와서
			    	   	// for문 사용해서 뿌려주기
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

		
			// 아이디와 채팅내용 입력받는 부분
			// 입력받은 값을 ChatInsertCon으로 보내서 데이터베이스에 넣으려 해
			$("#send").on('click',function(){
				var num = <%=chatnum %>;
				
				<%if (info!=null){ %>
					var id = "<%=info.getNickname()%>";
				<%} else{ %>
					var id = $('#id').val();
				<%} %>
				
				var content = $('#content').val();
				
				  $.ajax({
				       url: "ChatInsertCon", //컨트롤러 URL
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