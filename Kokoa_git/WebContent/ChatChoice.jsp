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
 <!-- 공고테이블, 채팅테이블 완성되면 DTO, DAO 사용하는 방향으로  수정하기 -->
 <%for(int i=1; i<10; i++){ %>
<input type="button" value="<%=i %>번방" name="<%=i %>" onClick="location.href='ChatTest.jsp?chatnum=<%=i%>'">
<%} %>

</form>
</body>
</html>