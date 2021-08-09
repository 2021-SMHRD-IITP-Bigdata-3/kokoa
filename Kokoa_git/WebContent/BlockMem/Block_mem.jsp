<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
	<div id="wrap">
		<br>
		<b><font size="4" color="gray">차단하기</font></b>
		<br>
		<div id="chk">
			<form action="../BanServiceCon">
				<input type="hidden" name="ban_mem_num" value="<%=info.getMem_num() %>">
				<input type="text" name="ban_id" placeholder="차단할 id를 입력해주세요">
				<input type="submit" value="차단하기">
			</form>
			<div id="msg"></div>
			<br>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
		</div>
	</div>
</body>
</html>