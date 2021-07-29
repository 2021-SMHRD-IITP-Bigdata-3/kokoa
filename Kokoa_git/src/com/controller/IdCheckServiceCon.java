package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/IdCheckServiceCon")
public class IdCheckServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("idinput");
		
		MemberDAO dao = new MemberDAO();
		boolean check = dao.idcheck(id);
		
		String moveURL = "";
		
		if(check) {
			moveURL = "IdCheck/IdCheckFail.jsp";
		} else {
			moveURL = "IdCheck/IdCheckSuccess.jsp";
		}
		
		response.sendRedirect(moveURL);
	}

}
