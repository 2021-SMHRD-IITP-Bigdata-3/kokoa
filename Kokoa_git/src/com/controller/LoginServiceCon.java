package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.login(id,pw);
		MemberDTO info = dao.sess(id);
		
		if (dto != null) {
	         System.out.println("�α��� ����");
	         HttpSession session = request.getSession();
	         session.setAttribute("info", info);
	         response.sendRedirect("Main.jsp");
	        
	    }else {
	         System.out.println("�α��� ����");
	         response.sendRedirect("Login.jsp");
	          
	    }

	}

}
