package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FilteringServiceCon")
public class FilteringServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String gender = request.getParameter("gender");
		String min_date = request.getParameter("min_date");
		String max_date = request.getParameter("max_date");
		String dog_size = request.getParameter("dog_size");
		String dog_gender = request.getParameter("dog_gender");
		
		System.out.println(gender+ min_date + max_date + dog_size + dog_gender);
		
		HttpSession session = request.getSession();
        //session.setAttribute("filter", filter);
		response.sendRedirect("Matching.jsp");
	}

}
