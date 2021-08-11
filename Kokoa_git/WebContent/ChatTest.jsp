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
<title>채팅방</title>
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
	// 로그인 시 필요
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	
	// 방 선택시 필요
	request.setCharacterEncoding("EUC-KR");
	int chatnum = Integer.parseInt(request.getParameter("chatnum"));
	System.out.println("chatnum(chatTest1페이지) : " + chatnum);
	
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

		<input id="content" type="text" placeholder="내용 입력" name="content">
		
		<button id="send">입력</button>
		<input type="button" id="exit" value="나가기" name="main" onClick="location.href='ChatList.jsp'">
	</footer>
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