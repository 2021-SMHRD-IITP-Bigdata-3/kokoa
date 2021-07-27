<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body{
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
</style>
</head>
<body>
	
	<div class="topbar">
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</div>
	
	
	<h1>회원가입</h1>
	
	<h5 align = "left">아이디</h5>
	<table>
	<tr>
	<td><input type = "text" id ="id" placeholder = "아이디를 입력해주세요"></td>
	<td><input type = "submit" value = "중복확인"></td>
	</tr>
	</table>
	
	<h5 align = "left">비밀번호</h5>
	<table>
	<tr>
	<td><input type = "password" id ="pw" placeholder = "비밀번호를 입력해주세요"></td>
	</tr>
	</table>
	
	<h5 align = "left">비밀번호 재확인</h5>
	<table>
	<tr>
	<td><input type = "password" id ="pw" placeholder = "비밀번호를 재입력해주세요"></td>
	</tr>
	</table>
	
	<h5 align = "left">닉네임</h5>
	<table>
	<tr>
	<td><input type = "text" id ="nickname" placeholder = "닉네임을 입력해주세요"></td>
	<td><input type = "submit" value = "중복확인"></td>
	</tr>
	</table>
	
	<h5 align = "left">이름</h5>
	<table>
	<tr>
	<td><input type = "text" id ="name" placeholder = "이름을 입력해주세요"></td>
	</tr>
	</table>
	
	<h5 align = "left">생년월일</h5>
	<table>
	<tr>
	<td><input type = "date" id ="birth"></td>
	</tr>
	</table>
	
	<h5 align = "left">성별</h5>
	<table>
	<tr>
	<td>남자<input type = "radio" value = "남자" name ="gender"></td>
	<td>여자<input type = "radio" value = "여자" name ="gender"></td>
	</tr>
	</table>
	
	<h5 align = "left">주소</h5>
	<table>
	<tr>
	<td><input type = "text" id ="addr"></td>
	<td><input type = "submit" value ="주소찾기"></td>
	</tr>
	<tr>
	<td><input type = "text" id ="addr_detail" placeholder = "상세주소를 입력해주세요"></td>
	</tr>
	</table>
	
	<h5 align = "left">이메일 (선택)</h5>
	<table>
	<tr>
	<td><input type = "text" id ="email" placeholder = "이메일을 입력해주세요"></td>
	</tr>
	</table>
	
	<h5 align = "left">휴대전화</h5>
	<table>
	<tr>
	<td><input type = "text" id ="phone"></td>
	<td><input type = "submit" value ="인증번호 전송"></td>
	</tr>
	<tr>
	<td><input type = "text" id ="permission" placeholder = "인증번호를 입력해주세요"></td>
	</tr>
	</table>


	<h5 align = "left">반려견 이름</h5>
	<table>
	<tr>
	<td><input type = "text" id ="dog_name" placeholder = "이름을 입력해주세요"></td>
	</tr>
	</table>
	
	<h5 align = "left">소개글(선택)</h5>
	
	<table>
	<tr>
	<td>
	<textarea rows ="10" cols = "20">	
	</textarea>
	</td>
	</tr>
	</table>
	
	
	
	<h5 align = "left">반려견 나이</h5>
	<table>
	<tr>
	<td><input type = "text" id ="dog_age" placeholder = "나이를 입력해주세요"></td>
	</tr>
	</table>
	
	
	<h5 align = "left">반려견 성별</h5>
	<table>
	<tr>
	<td>수컷<input type = "radio" value = "수컷" name ="dog_gender"></td>
	<td>암컷<input type = "radio" value = "암컷" name ="dog_gender"></td>
	<td>중성<input type = "radio" value = "중성" name ="dog_gender"></td>
	</tr>
	</table>
	
	<h5 align = "left">반려견 품종</h5>
	<table>
	<tr>
	<td><select>
	<option value ="">견종선택</option>
	<option value ="">그레이하운드</option>
	<option value ="">시츄</option>
	</select></td>
	</tr>
	</table>
	
	
	
	
	
	
	
	
	<div class="bottombar">
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	</div>

</body>
</html>