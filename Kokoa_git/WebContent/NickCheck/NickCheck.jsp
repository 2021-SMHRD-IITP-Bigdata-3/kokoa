<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<br>
		<b><font size="4" color="gray">�г��� �ߺ� üũ</font></b>
		<br>
		<div id="chk">
			<form action="../NickCheckServiceCon">
				<input type="text" name="nickinput" id="userNick">
				<input type="submit" value="�ߺ�Ȯ��">
			</form>
			<div id="msg"></div>
			<br>
			<input id="cancelBtn" type="button" value="���" onclick="window.close()">
		</div>
	</div>
</body>
</html>