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
   <div style="width:100%; height:150px;"></div>
   <form action="JoinServiceCon" method="post" enctype="multipart/form-data">
      <h1>회원가입</h1>
      <h5 align = "left">아이디</h5>
      <table>
         <tr>
            <td><input type = "text" name ="id" placeholder = "아이디를 입력해주세요"></td>
            <td><input type = "button" value = "중복확인" onclick='window.open("IdCheck/IdCheck.jsp","checkForm","width=500,height=300,resizable=no,scrollbars=no")'></td>
         </tr>
      </table>
   
      <h5 align = "left">비밀번호</h5>
      <table>
         <tr>
            <td><input type = "password" name ="pw" placeholder = "비밀번호를 입력해주세요"></td>
         </tr>
      </table>
            
      <h5 align = "left">닉네임</h5>
      <table>
         <tr>
            <td><input type = "text" name ="nickname" placeholder = "닉네임을 입력해주세요"></td>
            <td><input type = "button" value = "중복확인" onclick='window.open("NickCheck/NickCheck.jsp","checkForm","width=500,height=300,resizable=no,scrollbars=no")'></td>
         </tr>
      </table>
      
      <h5 align = "left">이름</h5>
      <table>
         <tr>
            <td><input type = "text" name ="name" placeholder = "이름을 입력해주세요"></td>
         </tr>
      </table>
      
      <h5 align = "left">생년월일</h5>
      <table>
         <tr>
            <td><input type = "date" name ="birth"></td>
         </tr>
      </table>
      
      <h5 align = "left">나이</h5>
      <table>
         <tr>
            <td><input type = "text" name ="age"></td>
         </tr>
      </table>
      
      <h5 align = "left">성별</h5>
      <table>
         <tr>
            <td>남자<input type = "radio" value = "남자" name ="gender"></td>
            <td>여자<input type = "radio" value = "여자" name ="gender"></td>
         </tr>
      </table>
      
      <h5 align = "left">주소</h5>
      <table>
         <tr>
            <td><input style="width: 400px;" id="member_addr" name="addr" type="text" placeholder="주소" readonly onclick="findAddr()"></td>
         </tr>
      </table>
      
      <h5 align = "left">이메일 (선택)</h5>
      <table>
         <tr>
            <td><input type = "text" name ="email" placeholder = "이메일을 입력해주세요"></td>
         </tr>
      </table>
      
      <h5 align = "left">휴대전화</h5>
      <table>
         <tr>
            <td><input type = "text" name ="tel"></td>
         </tr>
      </table>
      
      <h5 align = "left">소개글(선택)</h5>      
      <table>
         <tr>
            <td>
               <textarea rows ="10" cols = "20" name="intrd"></textarea>
            </td>
         </tr>
      </table>
      
      <h5 align = "left">반려견 이름</h5>
      <table>
         <tr>
            <td><input type = "text" name ="dog_name" placeholder = "이름을 입력해주세요"></td>
         </tr>
      </table>   
      
      <h5 align = "left">반려견 나이</h5>
      <table>
         <tr>
            <td><input type = "text" name ="dog_age" placeholder = "나이를 입력해주세요"></td>
         </tr>
      </table>
            
      <h5 align = "left">반려견 성별</h5>
      <table>
         <tr>
            <td>수컷<input type = "radio" value = "수컷" name ="dog_gender"></td>
            <td>암컷<input type = "radio" value = "암컷" name ="dog_gender"></td>
            <td>중성<input type = "radio" value = "중성" name ="dog_gender"></td>
         </tr>
      </table>
      
      <h5 align = "left">반려견 품종</h5>
      <table>
         <tr>
            <td>
               <select name="dog_type">
                  <option>견종선택</option>
                  <option value ="그레이하운드">그레이하운드</option>
                  <option value ="시츄">시츄</option>
               </select>
            </td>
         </tr>
      </table>
      
      <h5 align = "left">반려견 크기</h5>
      <table>
         <tr>
            <td>소형<input type = "radio" value = "소형" name ="dog_size"></td>
            <td>중형<input type = "radio" value = "중형" name ="dog_size"></td>
            <td>대형<input type = "radio" value = "대형" name ="dog_size"></td>
         </tr>
      </table>
         
      <h5 align = "left">반려견 사진(선택)</h5>
         <table>
         <tr>
            <td><input type = "file" name ="dog_pic"></td>
         </tr>
      </table>
      
      <h5 align = "left">반려견 번호</h5>
      <table>
         <tr>
            <td><input type = "text" name ="dog_num"></td>
         </tr>
      </table>
         
      <table>
         <tr>
            <td colspan = "2" align = "center"><input type = "submit" value ="가입 하기"></td>
         </tr>
      </table>
   </form>
   
   <footer>
      <hr>
      <a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
      <a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
      <a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
      <a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
      <a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="100px"></a>
   </footer>
	<script>
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div style="width:100%; height:150px;"></div>
</body>
</html>