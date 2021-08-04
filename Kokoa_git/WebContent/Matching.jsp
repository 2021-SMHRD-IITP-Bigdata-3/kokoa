<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   body{
      padding-bottom:150px;
      text-align: center;
      align-content: center;
   }
   
   header{
      position: fixed;
      top:0;
      left:0;
      background-color: #61da94;
      height: 150px;
      width: 100%;
   }
   footer{
      position: fixed;
      bottom: 0;
      left: 0;
      height: 150px;
      width:100%;
      background-color: white;
   }
   #menu{
      position: absolute;
      left:1%;
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
      right:1%;
      top: 50%;
      transform: translate(0,-50%);
   }
 
</style>
</head>
<body>
	
	<header>
      <a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
      <a id="logo"><img src="icons/together.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
	
	<h1> ��Ī �ϴ� �� </h1>
	<br>
	<br>
	<hr>
	<h4 align ="left"> ���͸� </h4>
	<table>
	<tr>
	<td><b>���� ����</b><td>
	<td colspan = "2">����<input type = "checkbox" value = "����" name ="gender">
	����<input type = "checkbox" value = "����" name ="gender"></td>
	</tr>
	
	<tr>
	<td><b>��¥�� �ð�</b><td>
	<td colspan = "2"> <input type = "datetime-local"> ~ <input type = "datetime-local"></td>
	</tr>
	
	<tr>
	<td><b>�ݷ��� ũ��</b><td>
	<td colspan ="2">����<input type = "checkbox" value = "����" name ="dog_size">
	����<input type = "checkbox" value = "����" name ="dog_size">
	����<input type = "checkbox" value = "����" name ="dog_size"></td>
	</tr>
	
	<tr>
	<td><b>�ݷ��� ����</b><td>
	<td colspan ="2">����<input type = "checkbox" value = "����" name ="dog_gender">
	����<input type = "checkbox" value = "����" name ="dog_gender">
	�߼�<input type = "checkbox" value = "�߼�" name ="dog_gender"></td>
	</tr>
	<tr>
	<td colspan = "2" align = "center">
	<input type = "submit" value = "��������">
	<input type = "reset" value = "�ʱ�ȭ">
	</td>
	</tr>
	
	</table>
	<hr>
		
	<input type ="button" value ="�游���" name ="make">
	<br><br>
	
	<table border = 1>
	<tr>
	<td rowspan = 5><img src="icons/puppy.jpg" width="153px" height="100px"></td>
	<td> �г��� (����, 20��)</td>
	<td rowspan = 5> <input type = "submit" value ="��å ��Ī " onclick="location.href='Chat.jsp'"><br>2/5��</td>
	</tr>
	
	<tr>
	<td>2021.07.28  16��</td>
	</tr>
	
	<tr>
	<td>������</td>
	</tr>
	
	<tr>
	<td>��� ��Ʈ���� (��, Ȱ��)</td>
	</tr>
	
	
	</table>
	
	
	<footer>
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
	</footer>

</body>
</html>