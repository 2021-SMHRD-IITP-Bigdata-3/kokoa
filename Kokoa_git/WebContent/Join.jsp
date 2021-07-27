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
	
	
	<h1>ȸ������</h1>
	
	<h5 align = "left">���̵�</h5>
	<table>
	<tr>
	<td><input type = "text" id ="id" placeholder = "���̵� �Է����ּ���"></td>
	<td><input type = "submit" value = "�ߺ�Ȯ��"></td>
	</tr>
	</table>
	
	<h5 align = "left">��й�ȣ</h5>
	<table>
	<tr>
	<td><input type = "password" id ="pw" placeholder = "��й�ȣ�� �Է����ּ���"></td>
	</tr>
	</table>
	
	<h5 align = "left">��й�ȣ ��Ȯ��</h5>
	<table>
	<tr>
	<td><input type = "password" id ="pw" placeholder = "��й�ȣ�� ���Է����ּ���"></td>
	</tr>
	</table>
	
	<h5 align = "left">�г���</h5>
	<table>
	<tr>
	<td><input type = "text" id ="nickname" placeholder = "�г����� �Է����ּ���"></td>
	<td><input type = "submit" value = "�ߺ�Ȯ��"></td>
	</tr>
	</table>
	
	<h5 align = "left">�̸�</h5>
	<table>
	<tr>
	<td><input type = "text" id ="name" placeholder = "�̸��� �Է����ּ���"></td>
	</tr>
	</table>
	
	<h5 align = "left">�������</h5>
	<table>
	<tr>
	<td><input type = "date" id ="birth"></td>
	</tr>
	</table>
	
	<h5 align = "left">����</h5>
	<table>
	<tr>
	<td>����<input type = "radio" value = "����" name ="gender"></td>
	<td>����<input type = "radio" value = "����" name ="gender"></td>
	</tr>
	</table>
	
	<h5 align = "left">�ּ�</h5>
	<table>
	<tr>
	<td><input type = "text" id ="addr"></td>
	<td><input type = "submit" value ="�ּ�ã��"></td>
	</tr>
	<tr>
	<td><input type = "text" id ="addr_detail" placeholder = "���ּҸ� �Է����ּ���"></td>
	</tr>
	</table>
	
	<h5 align = "left">�̸��� (����)</h5>
	<table>
	<tr>
	<td><input type = "text" id ="email" placeholder = "�̸����� �Է����ּ���"></td>
	</tr>
	</table>
	
	<h5 align = "left">�޴���ȭ</h5>
	<table>
	<tr>
	<td><input type = "text" id ="phone"></td>
	<td><input type = "submit" value ="������ȣ ����"></td>
	</tr>
	<tr>
	<td><input type = "text" id ="permission" placeholder = "������ȣ�� �Է����ּ���"></td>
	</tr>
	</table>


	<h5 align = "left">�ݷ��� �̸�</h5>
	<table>
	<tr>
	<td><input type = "text" id ="dog_name" placeholder = "�̸��� �Է����ּ���"></td>
	</tr>
	</table>
	
	<h5 align = "left">�Ұ���(����)</h5>
	
	<table>
	<tr>
	<td>
	<textarea rows ="10" cols = "20">	
	</textarea>
	</td>
	</tr>
	</table>
	
	
	
	<h5 align = "left">�ݷ��� ����</h5>
	<table>
	<tr>
	<td><input type = "text" id ="dog_age" placeholder = "���̸� �Է����ּ���"></td>
	</tr>
	</table>
	
	
	<h5 align = "left">�ݷ��� ����</h5>
	<table>
	<tr>
	<td>����<input type = "radio" value = "����" name ="dog_gender"></td>
	<td>����<input type = "radio" value = "����" name ="dog_gender"></td>
	<td>�߼�<input type = "radio" value = "�߼�" name ="dog_gender"></td>
	</tr>
	</table>
	
	<h5 align = "left">�ݷ��� ǰ��</h5>
	<table>
	<tr>
	<td><select>
	<option value ="">��������</option>
	<option value ="">�׷����Ͽ��</option>
	<option value ="">����</option>
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