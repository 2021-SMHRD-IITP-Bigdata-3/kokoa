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
		<b><font size="4" color="gray">�����ϱ�</font></b>
		<br>
		<div id="chk">
			<form action="../BanServiceCon">
				<input type="hidden" name="ban_mem_num" value="<%=info.getMem_num() %>">
				<input type="text" name="ban_id" placeholder="������ id�� �Է����ּ���">
				<input type="submit" value="�����ϱ�">
			</form>
			<div id="msg"></div>
			<br>
			<input id="cancelBtn" type="button" value="���" onclick="window.close()">
		</div>
	</div>
</body>
</html>