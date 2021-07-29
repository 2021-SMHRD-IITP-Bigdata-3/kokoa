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
		<h1 id="title"><button type="button" id="backbtn"> �� </button> ȸ���������� </h1>
	</div>
	
	<form  action="" name="" >
		<div class="join">
			<table>
				
				<tr>
					<td>�г���</td>
					<td><input type="text" id="id" name="nickname"></td>
					<td><input type="submit" value="�ߺ�Ȯ��"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" id="repassword" name="repassword"></td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td><input type="text" id="firstmail" name="firstmail">@<select id="lattermail" name="mail" size="1">
							<option value="">�����ϼ���</option>
							<option value="gmail">gmail.com</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="nate">nate.com</option>
					</select></td>
				</tr>
				<tr>
					<td>�ּ�</td>
					<td><input type="text" id="firstaddr" name="firstaddr"> ���ּ� <input type="text" id="lastaddr" name="lastaddr"></td>
					<td><input type="submit" value="�ּ�ã��"></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text" id="tel" name="tel"></td>
				</tr>
				
				<tr>
					<td>�Ұ���</td>
					<td>
					<textarea rows ="10" cols = "20" name="intrd"></textarea>
				</td>
				</tr>
				
				<tr>
					<td>�ݷ��� �̸�</td>
					<td><input type="text" id="dog_name" name="dog_name"></td>
				</tr>
				
				<tr>
					<td>�ݷ��� ����</td>
					<td>
            			����
            		<input type="radio" name="gender"> 
           				����
            		<input type="radio" name="gender">
            			�߼�ȭ
            		<input type="radio" name="gender">
          			</td>
				</tr>
				
				<tr>
					<td>�ݷ��� ����</td>
					<td><input type="text" id="dog_pic" name="dog_pic"></td>
					<td><input type="submit" value="�������ε�"></td>
				</tr>
				
			
				
				<tr >
					<td>
					<input type="submit" value="ȸ����������">
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
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="160px"></a>
	</footer>
</body>
</html>