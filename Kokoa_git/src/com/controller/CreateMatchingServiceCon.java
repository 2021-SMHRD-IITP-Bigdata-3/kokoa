package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateMatchingServiceCon")
public class CreateMatchingServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		String nickname = request.getParameter("nickname");
		String id = request.getParameter("id");
		String gender = request.getParameter("gender");
		String chatting_room_title = request.getParameter("chatting_room_title");
		String matching_date = request.getParameter("matching_date");
		String hour = request.getParameter("hour");
		String minute = request.getParameter("minute");
		String min_age = request.getParameter("min_age");
		String max_age = request.getParameter("max_age");
		String dog_gender = request.getParameter("dog_gender");
		String dog_size = request.getParameter("dog_size");
		
		System.out.println(nickname+id+gender+chatting_room_title+matching_date+hour+minute+min_age+max_age+dog_gender+dog_size);
		
		response.sendRedirect("Matching.jsp");
		
	}

}
