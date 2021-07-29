package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/NickCheckServiceCon")
public class NickCheckServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String nick = request.getParameter("nickinput");
		
		MemberDAO dao = new MemberDAO();
		boolean check = dao.nickcheck(nick);
		
		String moveURL = "";
		
		if(check) {
			moveURL = "NickCheck/NickCheckFail.jsp";
		} else {
			moveURL = "NickCheck/NickCheckSuccess.jsp";
		}
		
		response.sendRedirect(moveURL);
	}

}
