<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>회원정보수정</title>
<script src="https://kit.fontawesome.com/59b21ab85e.js" crossorigin="anonymous"></script>
<style>
	body{
		position:relative;
		top:150px;
		text-align: center;
		align-content: center;
		z-index:30;
		}
	
	   header{
	      position: fixed;
	      top:0;
	      left:0;
	      background-color: #61da94;
	      height: 150px;
	      width: 100%;
	      z-index:100;
	   }
	
	footer{
		position: fixed;
		bottom: 0;
		height: 150px;
		width: 100%;
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

	#title{
		position: relative;
        font-size: 50px;
	}
	
	tr{	
		font-size: 20px;
		margin-top:50px;
		
	}
	input{	
		font-size: 20px;
	}
	.join{
		position:relative;
		font-size:22px;
	}
	.title{
		font-size:30px;
	}
	.button{
		text-align:center;
		font-size:25px;
	   	background-color:#61da94;
	   	padding:20px 35px;
	   	border:1;
	   	outline:0;
	   	border: 1px solid #61da94;
	   	border-radius:5%;
	   	color:white;
	   	position:relative;
	   	top:45px;
	   	left:320px;
	}
	.button_pic{
		text-align:center;
		font-size:25px;
	   	background-color:#61da94;
	   	padding:10px 20px;
	   	border:1;
	   	outline:0;
	   	border: 1px solid #61da94;
	   	border-radius:5%;
	   	color:white;
	}
	.tr > td input{
		width:100%;
	}
	.button_confirm{
		position:relative;
		left:20px;
		font-size:25px;
	   	background-color:#61da94;
	   	padding:10px 25px;
	   	border:1;
	   	outline:0;
	   	border: 1px solid #61da94;
	   	border-radius:5%;
	   	color:white;
	}
	.tr > td textarea{
		width:100%;
	}
	.back{
		position:fixed;
		top:170px;
		left:40px;
		color:#61da94;
		z-index:10;	
	}
	
</style>
</head>
<body>

	<%
		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		System.out.print(id);
	%>
	
	<header>
		<a href="MyPage.jsp" id="menu"><img src="icons/menu.png" width="100px" height="100px"></a>
		<a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
		<a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
	</header>
	<table class='icon'>
		<tr>
			<td>
				<a class="back" href="#" onclick="location.href='Main.jsp'"><i class="fas fa-arrow-left fa-2x"></i></a>
			</td>
		</tr>
	</table>
	
	<div class="pagetitle">	
		<h1> 회원정보수정 </h1>
	</div>
	
	<form action="UpdateServiceCon2" method="post" enctype="multipart/form-data">
		<div class="join">
			<table  style="text-align:left; border-collapse:separate; border-spacing: 0 30px; margin:auto;">
				<tr class="tr">
					<td><input type="text" name="id" hidden="hidden" value="<%=id%>"></td>
				</tr>
				<tr class="tr">
					<td class="title">닉네임</td>
					<td><input placeholder="닉네임" type="text" name="nickname"></td>
					<td><input class="button_confirm" type="button" value="중복확인" onclick='window.open("NickCheck/NickCheck.jsp","checkForm","width=500,height=300,resizable=no,scrollbars=no")'></td>
					
				</tr>
				<tr class="tr">
					<td class="title">비밀번호</td>
					<td><input placeholder="비밀번호" type="password" name="pw"></td>
				</tr>
				<tr class="tr">
					<td class="title">이메일</td>
					<td><input placeholder="이메일" type = "text" name ="email" ></td>
				</tr>
				<tr class="tr">
					<td class="title">주소</td>
					 <td><input style="width: 400px;" id="member_addr" name="addr" type="text" placeholder="주소" readonly onclick="findAddr()"></td>
				</tr>
				<tr class="tr">
					<td class="title">전화번호</td>
					<td><input placeholder="전화번호" type="text" name="tel"></td>
				</tr>
				
				<tr class="tr">
					<td class="title">소개글</td>
					<td>
					<textarea rows ="10" cols = "20" name="intrd"></textarea>
					</td>
				</tr>
				
				<tr class="tr">
					<td class="title">반려견 이름</td>
					<td><input placeholder="반려견 이름" type="text" name="dog_name"></td>
				</tr>
				
				<tr>
					<td class="title">반려견 성별</td>
					<td>
            			수컷
            		<input type="radio" name="dog_gender"> 
           				암컷
            		<input type="radio" name="dog_gender">
            			중성화
            		<input type="radio" name="dog_gender">
          			</td>
				</tr>
				
				<tr class="tr">
					<td class="title">반려견 사진</td>
					 <td><input class="button_pic" type = "file" name ="dog_pic"></td>
				</tr>
				
			
				
				<tr class="submit_wrap">
					<td>
					<input class="button" type="submit" value="회원정보수정">
					</td>
				</tr>
				
				</table>
				</div>
	</form>
	
	<footer>
		<hr>
		<a href="Main.jsp" style="position: absolute; left:17%; top:60%; transform: translate(-50%,-50%)"><img src="icons/home.png" width="100px" height="160px"></a>
		<a href="Walk.jsp" style="position: absolute; left:34%; top:60%; transform: translate(-50%,-50%)"><img src="icons/map.png" width="100px" height="160px"></a>
		<a href="Matching.jsp" style="position: absolute; left:51%; top:60%; transform: translate(-50%,-50%)"><img src="icons/matching.png" width="100px" height="160px"></a>
		<a href="FleaMarket.jsp" style="position: absolute; left:68%; top:60%; transform: translate(-50%,-50%)"><img src="icons/shopping_basket.png" width="100px" height="160px"></a>
		<a href="SNS.jsp" style="position: absolute; left:85%; top:60%; transform: translate(-50%,-50%)"><img src="icons/pawprint.png" width="100px" height="175px"></a>
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
</body>
</html>