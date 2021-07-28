<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	
	.topbar{
			position: sticky;
			top: 0;
			background-color: #61da94;
			height: 150px;
			padding:20px;
			}
	
	.bottombar{
		position: sticky;
		bottom: 0;
		height: 150px;
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
	#backbtn{
		background-color:white;
		height:70px;
		width:80px;
		font-size: 50px;
		border-color:white;

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
		align:center;
	}
	
</style>
</head>
<body>
	
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	
	<div class="pagetitle">	
		<h1 id="title"><button type="button" id="backbtn"> ← </button> 회원정보수정 </h1>
	</div>
	
	<form  action="" name="">
		<div class="join">
			<table>
				
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="id" name="nickname"></td>
					<td> <button id=""> 중복확인 </button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="repassword" name="repassword"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="firstmail" name="firstmail">@<select id="mail" name="mail" size="1">
							<option value="">선택하세요</option>
							<option value="gmail">gmail.com</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="nate">nate.com</option>
					</select></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="firstaddr" name="firstaddr"> 상세주소 <input type="text" id="lastaddr" name="lastaddr"></td>
					<td> <button id="find" name="find"> 주소찾기 </button></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="tel" name="tel"></td>
				</tr>
				
				<tr>
					<td>소개글</td>
					<td><input type="text" id="intrd" name="intrd" ></td>
				</tr>
				
				<tr>
					<td>반려견 이름</td>
					<td><input type="text" id="dog_name" name="dog_name"></td>
				</tr>
				
				<tr>
					<td>반려견 성별</td>
					<td>
            			수컷
            		<input type="radio" name="gender"> 
           				암컷
            		<input type="radio" name="gender">
            			중성화
            		<input type="radio" name="gender">
          			</td>
				</tr>
				
				<tr>
					<td>반려견 사진</td>
					<td><input type="text" id="dog_pic" name="dog_pic"></td>
					<td> <button id="dog_pic"> 사진업로드 </button></td>
				</tr>
				
				<tr>
					<td>반려견 소개글</td>
					<td><input type="text" id="dog_intrd" name="dog_intrd" ></td>
				</tr>
				
				<tr >
					<td>
					<button id=" " name=" "> 회원정보수정 </button>
					</td>
				</tr>
				
				</table>
				</div>
				
				
	
	<div class="bottombar">
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="160px"></a>
	</div>
</body>
</html>