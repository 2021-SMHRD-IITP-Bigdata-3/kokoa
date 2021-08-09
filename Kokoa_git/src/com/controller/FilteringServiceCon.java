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
		int min_age = Integer.parseInt(request.getParameter("min_age"));
		int max_age = Integer.parseInt(request.getParameter("max_age"));
		String min_date = request.getParameter("min_date");
		String max_date = request.getParameter("max_date");
		String dog_size = request.getParameter("dog_size");
		String dog_gender = request.getParameter("dog_gender");
		String location = request.getParameter("location");
		
		System.out.println(gender + min_age + max_age + min_date + max_date + dog_size + dog_gender + location);
		
		HttpSession session = request.getSession();
        session.setAttribute("gender", gender);
        session.setAttribute("min_age", min_age);
        session.setAttribute("max_age", max_age);
        session.setAttribute("min_date", min_date);
        session.setAttribute("max_date", max_date);
        session.setAttribute("dog_size", dog_size);
        session.setAttribute("dog_gender", dog_gender);
        session.setAttribute("location", location);
		response.sendRedirect("Matching.jsp");
	}

}
