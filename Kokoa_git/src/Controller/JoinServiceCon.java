package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

vlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post방식 인코딩
			request.setCharacterEncoding("EUC-KR");
			
			// email, pw, name, tel, address
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String birthday = request.getParameter("birthday");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String intro = request.getParameter("intro");
			String dog_name = request.getParameter("dog_age");
			String dog_age = request.getParameter("dog_age");
			String dog_gender = request.getParameter("dog_gender");
			String dog_picture = request.getParameter("dog_picture");
			String dog_num = request.getParameter("dog_num");
			String dog_size = request.getParameter("dog_size");
			String dog_type = request.getParameter("dog_type");
			
			MemberDTO dto = new MemberDTO(email,pw,tel,addr);
			MemberDAO dao = new MemberDAO();
			int cnt = dao.join(dto);
			
			String moveURL = "";
			
			if(cnt > 0) {
				System.out.println("회원가입 성공");
				moveURL = "join_success.jsp";
				HttpSession session = request.getSession();
				session.setAttribute("name", email);
			} else {
				System.out.println("회원가입 실패");
				moveURL = "main.jsp";
			}
			
			response.sendRedirect(moveURL);
	}

}
