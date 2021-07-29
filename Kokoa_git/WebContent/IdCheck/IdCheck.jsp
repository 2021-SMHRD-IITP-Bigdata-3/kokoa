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
		<b><font size="4" color="gray">아이디 중복 체크</font></b>
		<br>
		<div id="chk">
			<form action="../IdCheckServiceCon">
				<input type="text" name="idinput" id="userId">
				<input type="submit" value="중복확인">
			</form>
			<div id="msg"></div>
			<br>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
		</div>
	</div>
</body>
</html>