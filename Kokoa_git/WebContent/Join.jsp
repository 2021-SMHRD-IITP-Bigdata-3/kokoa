<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" type="imgage/x-icon" href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzBfMTEw%2FMDAxNTE0NjQyODEzNjk0.MAVhPpxH_Hdr55KdZV_HQ8C5CzDF5Lcre1zQLEGrl84g.KO0kjg3rYiBEkRrJdxV5b_XDh6WhFXqmPfrbZE7dwXgg.PNG.koowq%2F%25BD%25C3%25B9%25D9%25B0%25DF_%25C4%25C3%25B7%25AF_%25BE%25C6%25C0%25CC%25C4%25DC-01.png&type=sc960_832">
<title>ȸ������</title>
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
      <a id="logo"><img src="icons/together1.PNG" width="153px" height="100px"></a>
      <a href="ChatList.jsp" id="chat"><img src="icons/chat.png" width="100px" height="100px"></a>
   </header>
   <div style="width:100%; height:150px;"></div>
   <form action="JoinServiceCon" method="post" enctype="multipart/form-data">
      <h1>ȸ������</h1>
      <h5 align = "left">���̵�</h5>
      <table>
         <tr>
            <td><input type = "text" name ="id" placeholder = "���̵� �Է����ּ���"></td>
            <td><input type = "button" value = "�ߺ�Ȯ��" onclick='window.open("IdCheck/IdCheck.jsp","checkForm","width=500,height=300,resizable=no,scrollbars=no")'></td>
         </tr>
      </table>
   
      <h5 align = "left">��й�ȣ</h5>
      <table>
         <tr>
            <td><input type = "password" name ="pw" placeholder = "��й�ȣ�� �Է����ּ���"></td>
         </tr>
      </table>
            
      <h5 align = "left">�г���</h5>
      <table>
         <tr>
            <td><input type = "text" name ="nickname" placeholder = "�г����� �Է����ּ���"></td>
            <td><input type = "button" value = "�ߺ�Ȯ��" onclick='window.open("NickCheck/NickCheck.jsp","checkForm","width=500,height=300,resizable=no,scrollbars=no")'></td>
         </tr>
      </table>
      
      <h5 align = "left">�̸�</h5>
      <table>
         <tr>
            <td><input type = "text" name ="name" placeholder = "�̸��� �Է����ּ���"></td>
         </tr>
      </table>
      
      <h5 align = "left">�������</h5>
      <table>
         <tr>
            <td><input type = "date" name ="birth"></td>
         </tr>
      </table>
      
      <h5 align = "left">����</h5>
      <table>
         <tr>
            <td><input type = "text" name ="age"></td>
         </tr>
      </table>
      
      <h5 align = "left">����</h5>
      <table>
         <tr>
            <td>����<input type = "radio" value = "����" name ="gender"></td>
            <td>����<input type = "radio" value = "����" name ="gender"></td>
         </tr>
      </table>
      
      <h5 align = "left">�ּ�</h5>
      <table>
         <tr>
            <td><input style="width: 400px;" id="member_addr" name="addr" type="text" placeholder="�ּ�" readonly onclick="findAddr()"></td>
         </tr>
      </table>
      
      <h5 align = "left">�̸��� (����)</h5>
      <table>
         <tr>
            <td><input type = "text" name ="email" placeholder = "�̸����� �Է����ּ���"></td>
         </tr>
      </table>
      
      <h5 align = "left">�޴���ȭ</h5>
      <table>
         <tr>
            <td><input type = "text" name ="tel"></td>
         </tr>
      </table>
      
      <h5 align = "left">�Ұ���(����)</h5>      
      <table>
         <tr>
            <td>
               <textarea rows ="10" cols = "20" name="intrd"></textarea>
            </td>
         </tr>
      </table>
      
      <h5 align = "left">�ݷ��� �̸�</h5>
      <table>
         <tr>
            <td><input type = "text" name ="dog_name" placeholder = "�̸��� �Է����ּ���"></td>
         </tr>
      </table>   
      
      <h5 align = "left">�ݷ��� ����</h5>
      <table>
         <tr>
            <td><input type = "text" name ="dog_age" placeholder = "���̸� �Է����ּ���"></td>
         </tr>
      </table>
            
      <h5 align = "left">�ݷ��� ����</h5>
      <table>
         <tr>
            <td>����<input type = "radio" value = "����" name ="dog_gender"></td>
            <td>����<input type = "radio" value = "����" name ="dog_gender"></td>
            <td>�߼�<input type = "radio" value = "�߼�" name ="dog_gender"></td>
         </tr>
      </table>
      
      <h5 align = "left">�ݷ��� ǰ��</h5>
      <table>
         <tr>
            <td>
               <select name="dog_type">
                  <option>��������</option>
                  <option value ="�׷����Ͽ��">�׷����Ͽ��</option>
                  <option value ="����">����</option>
                  <option value ="����� ��Ʈ����">"����� ��Ʈ����"</option>
                  <option value ="���޶�Ͼ�">"���޶�Ͼ�"</option>
                  <option value ="�ú����� �㽺Ű">"�ú����� �㽺Ű"</option>
                  <option value ="�ҵ���">"�ҵ���"</option>
                  <option value ="Ǫ��">"Ǫ��"</option>
                  <option value ="ġ�Ϳ�">"ġ�Ϳ�"</option>
                  <option value ="�ùٰ�">"�ùٰ�"</option>
                  <option value ="�������� �ɼ�">"�������� �ɼ�"</option>
                  <option value ="�۱�">"�۱�"</option>
                  <option value ="�Ƹ޸�ĭ �ͺ� �׸���">"�Ƹ޸�ĭ �ͺ� �׸���"</option>
                  <option value ="��Ʈ���Ϸ�">"��Ʈ���Ϸ�"</option>
                  <option value ="�ڽ���Ʈ">"�ڽ���Ʈ"</option>
                  <option value ="���">"���"</option>
                  <option value ="��Ƽ��">"��Ƽ��"</option>
                  <option value ="�׷���Ʈ ����">"�׷���Ʈ ����"</option>
                  <option value ="��������">"��������"</option>
                  <option value ="ī���ڸ���">"ī���ڸ���"</option>
                  <option value ="��𿹵��">"��𿹵��"</option>
                  <option value ="�丣�þ� ����Ƽ��">"�丣�þ� ����Ƽ��"</option>
                  <option value ="��ũ�� �׸���">"��ũ�� �׸���"</option>
                  <option value ="������ ����ƾ ����">"������ ����ƾ ����"</option>
                  <option value ="���ݵ鷣��">"���ݵ鷣��"</option>
                  <option value ="����ġ �ҵ���">"����ġ �ҵ���"</option>
                  <option value ="����">"����"</option>
                  <option value ="���� �����ڱ�">"���� �����ڱ�"</option>
                  <option value ="����Ʈ������">"����Ʈ������"</option>
                  <option value ="���� �ݸ�">"���� �ݸ�"</option>
                  <option value ="���� �׸���">"���� �׸���"</option>
                  <option value ="��ƼǪ">"��ƼǪ"</option>
                  <option value ="��� ������">"��� ������"</option>
                  <option value ="�ױ۸��� ����Ƽ��">"�ױ۸��� ����Ƽ��"</option>
                  <option value ="�ױ۸��� ��Ŀ ���дϾ�">"�ױ۸��� ��Ŀ ���дϾ�"</option>
                  <option value ="�̴Ͼ�ó �ɼ�">"�̴Ͼ�ó �ɼ�"</option>
                  <option value ="�� �׸���">"�� �׸���"</option>
                  <option value ="�����ε�">"�����ε�"</option>
                  <option value ="������ �׸���">"������ �׸���"</option>
                  <option value ="�׷����Ͽ��">"�׷����Ͽ��"</option>
                  <option value ="�޸��þ�">"�޸��þ�"</option>
                  <option value ="�̴Ͼ�ó ��������">"�̴Ͼ�ó ��������"</option>
                  <option value ="���� Ǫ��">"���� Ǫ��"</option>
                  <option value ="�ټ���">"�ټ���"</option>
                  <option value ="��ŰŸ��">"��ŰŸ��"</option>
                  <option value ="������">"������"</option>
                  <option value ="��Ű����">"��Ű����"</option>
                  <option value ="���ǿ�">"���ǿ�"</option>
                  <option value ="������ �Ͽ��">"������ �Ͽ��"</option>
                  <option value ="�Ϲٳ� ��ũ">"�Ϲٳ� ��ũ"</option>
                  <option value ="��Ÿ">"��Ÿ"</option> 
                
               </select>
            </td>
         </tr>
      </table>
      
      <h5 align = "left">�ݷ��� ũ��</h5>
      <table>
         <tr>
            <td>����<input type = "radio" value = "����" name ="dog_size"></td>
            <td>����<input type = "radio" value = "����" name ="dog_size"></td>
            <td>����<input type = "radio" value = "����" name ="dog_size"></td>
         </tr>
      </table>
         
      <h5 align = "left">�ݷ��� ����(����)</h5>
         <table>
         <tr>
            <td><input type = "file" name ="dog_pic"></td>
         </tr>
      </table>
      
      <h5 align = "left">�ݷ��� ��ȣ</h5>
      <table>
         <tr>
            <td><input type = "text" name ="dog_num"></td>
         </tr>
      </table>
         
      <table>
         <tr>
            <td colspan = "2" align = "center"><input type = "submit" value ="���� �ϱ�"></td>
         </tr>
      </table>
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
	        	
	            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
	            var jibunAddr = data.jibunAddress; // ���� �ּ� ����
	            
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