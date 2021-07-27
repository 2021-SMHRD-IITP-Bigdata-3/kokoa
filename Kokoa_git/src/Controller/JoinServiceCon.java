package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post방식 인코딩
			request.setCharacterEncoding("EUC-KR");
			
			int mem_num = Integer.parseInt(request.getParameter("mem_num"));
			String id = request.getParameter("id");
			String nickname = request.getParameter("nickname");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String birth = request.getParameter("birth");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			String intrd = request.getParameter("intrd");
			String dog_name = request.getParameter("dog_name");
			int dog_age = Integer.parseInt(request.getParameter("dog_age"));
			String dog_gender = request.getParameter("dog_gender");
			String dog_pic = request.getParameter("dog_pic");
			int dog_num = Integer.parseInt(request.getParameter("dog_num"));
			String dog_size = request.getParameter("dog_size");
			String dog_type = request.getParameter("dog_type");
			
			MemberDTO dto = new MemberDTO(mem_num,id,nickname,pw,name,age,gender,birth,tel,addr,email,intrd,dog_name,dog_age,dog_gender,dog_pic,dog_num,dog_size,dog_type);
			MemberDAO dao = new MemberDAO();
			int cnt = dao.join(dto);
			
			String moveURL = "";
			
			if(cnt > 0) {
				System.out.println("회원가입 성공");
				moveURL = "Main.jsp";
				HttpSession session = request.getSession();
			} else {
				System.out.println("회원가입 실패");
				moveURL = "Main.jsp";
			}
			
			response.sendRedirect(moveURL);
	}

}
