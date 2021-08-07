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
		padding-bottom: 150px;
		text-align: center;
		align-content: center;
		}
	
	.topbar{
			position: sticky;
			top: 0;
			background-color: #61da94;
			height: 150px;
			padding:20px;
			}
	
	footer{
		position: fixed;
		bottom: 0;
		height: 150px;
		width: 100%;
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

	#title{
		position: relative;
        font-size: 50px;
	}
	
	tr{	
		font-size: 20px;
		
	}
	input{	
		font-size: 20px;
	}
	
	
</style>
</head>
<body>


	<%
		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		System.out.print(id);
	%>
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	
	<div class="pagetitle">	
		<button onclick="history.back()"> ← </button>
		<h1> 회원정보수정 </h1>
	</div>
	
	<form action="UpdateServiceCon2" method="post" enctype="multipart/form-data">
		<div class="join">
			<table>
				<tr>
					<td><input type="text" name="id" hidden="hidden" value="<%=id%>"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname"></td>
					<td><input type="button" value="중복확인" onclick='window.open("NickCheck/NickCheck.jsp","checkForm","width=500,height=300,resizable=no,scrollbars=no")'></td>
					
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type = "text" name ="email" ></td>
				</tr>
				<tr>
					<td>주소</td>
					 <td><input style="width: 400px;" id="member_addr" name="addr" type="text" placeholder="주소" readonly onclick="findAddr()"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel"></td>
				</tr>
				
				<tr>
					<td>소개글</td>
					<td>
					<textarea rows ="10" cols = "20" name="intrd"></textarea>
				</td>
				</tr>
				
				<tr>
					<td>반려견 이름</td>
					<td><input type="text" name="dog_name"></td>
				</tr>
				
				<tr>
					<td>반려견 성별</td>
					<td>
            			수컷
            		<input type="radio" name="dog_gender"> 
           				암컷
            		<input type="radio" name="dog_gender">
            			중성화
            		<input type="radio" name="dog_gender">
          			</td>
				</tr>
				
				<tr>
					<td>반려견 사진</td>
					 <td><input type = "file" name ="dog_pic"></td>
				</tr>
				
			
				
				<tr >
					<td>
					<input type="submit" value="회원정보수정">
					</td>
				</tr>
				
				</table>
				</div>
	</form>
	
	<footer>
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="175px"></a>
	</footer>
	<script>
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	</script>
		

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>