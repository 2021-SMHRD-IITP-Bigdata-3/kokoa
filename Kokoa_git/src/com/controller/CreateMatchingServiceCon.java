package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MatchingDAO;
import com.model.MatchingDTO;

@WebServlet("/CreateMatchingServiceCon")
public class CreateMatchingServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		String nickname = request.getParameter("nickname");
		String id = request.getParameter("id");
		String gender = request.getParameter("gender");
		String chatting_room_title = request.getParameter("chatting_room_title");
		String matching_date = request.getParameter("matching_date");
		int hour = Integer.parseInt(request.getParameter("hour"));
		int minute = Integer.parseInt(request.getParameter("minute"));
		int min_age = Integer.parseInt(request.getParameter("min_age"));
		int max_age = Integer.parseInt(request.getParameter("max_age"));
		String dog_gender = request.getParameter("dog_gender");
		String dog_size = request.getParameter("dog_size");
		String location = request.getParameter("location");
		
		System.out.println(nickname+id+gender+chatting_room_title+matching_date+hour+minute+min_age+max_age+dog_gender+dog_size+location);
		
		MatchingDAO dao = new MatchingDAO();
		MatchingDTO dto = new MatchingDTO(chatting_room_title,gender,nickname,id,min_age,max_age,matching_date,hour,minute,dog_gender,dog_size,location);
		int cnt = dao.create(dto);
		
		if(cnt > 0) {
			System.out.println("매칭방 개설 성공");
		} else {
			System.out.println("매칭방 개설 실패");
		}
	
		response.sendRedirect("Matching.jsp");
		
	}

}
