<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form>
 <!-- �������̺�, ä�����̺� �ϼ��Ǹ� DTO, DAO ����ϴ� ��������  �����ϱ� -->
 <%for(int i=1; i<10; i++){ %>
<input type="button" value="<%=i %>����" name="<%=i %>" onClick="location.href='ChatTest.jsp?chatnum=<%=i%>'">
<%} %>

</form>
</body>
</html>