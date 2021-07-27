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

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(id,pw);
		
		String moveURL = "";
		
		if (info != null) {
	         System.out.println("로그인 성공");
	         HttpSession session = request.getSession();
	         session.setAttribute("info", info);
	         moveURL = "Main.jsp";
	         
	    }else {
	         System.out.println("로그인 실패");
	         moveURL = "Login.jsp";
	    }
	      
	      response.sendRedirect(moveURL);
	}

}
