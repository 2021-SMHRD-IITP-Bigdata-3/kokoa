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
	
	<h1> 매칭 하는 곳 </h1>
	<br>
	<br>
	<hr>
	<h4 align ="left"> 필터링 </h4>
	<table>
	<tr>
	<td><b>견주 성별</b><td>
	<td colspan = "2">남자<input type = "checkbox" value = "남자" name ="gender">
	여자<input type = "checkbox" value = "여자" name ="gender"></td>
	</tr>
	
	<tr>
	<td><b>날짜와 시간</b><td>
	<td colspan = "2"> <input type = "datetime-local"> ~ <input type = "datetime-local"></td>
	</tr>
	
	<tr>
	<td><b>반려견 크기</b><td>
	<td colspan ="2">소형<input type = "checkbox" value = "소형" name ="dog_size">
	중형<input type = "checkbox" value = "중형" name ="dog_size">
	대형<input type = "checkbox" value = "대형" name ="dog_size"></td>
	</tr>
	
	<tr>
	<td><b>반려견 성별</b><td>
	<td colspan ="2">수컷<input type = "checkbox" value = "수컷" name ="dog_gender">
	암컷<input type = "checkbox" value = "암컷" name ="dog_gender">
	중성<input type = "checkbox" value = "중성" name ="dog_gender"></td>
	</tr>
	<tr>
	<td colspan = "2" align = "center">
	<input type = "submit" value = "필터적용">
	<input type = "reset" value = "초기화">
	</td>
	</tr>
	
	</table>
	<hr>
		
	<input type ="button" value ="방만들기" name ="make">
	<br><br>
	
	<table border = 1>
	<tr>
	<td rowspan = 5><img src="icons/puppy.jpg" width="153px" height="100px"></td>
	<td> 닉네임 (남성, 20대)</td>
	<td rowspan = 5> <input type = "submit" value ="산책 매칭 " onclick="location.href='Chat.jsp'"><br>2/5명</td>
	</tr>
	
	<tr>
	<td>2021.07.28  16시</td>
	</tr>
	
	<tr>
	<td>대형견</td>
	</tr>
	
	<tr>
	<td>골든 리트리버 (남, 활달)</td>
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