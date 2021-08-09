package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.IndivisualChatDAO;

@WebServlet("/LeaveChat")
public class LeaveChat extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		String chatting_room_num = request.getParameter("chatting_room_num");
		
		IndivisualChatDAO dao = new IndivisualChatDAO();
		int cnt = dao.leaveChat(mem_num, chatting_room_num);
		
		String moveURL = "";
		
		if(cnt > 0) {
			System.out.println("나가기 성공");
			moveURL = "ChatList.jsp";
			HttpSession session = request.getSession();
		} else {
			System.out.println("나가기 실패");
			moveURL = "ChatList.jsp";
		}
		
		response.sendRedirect(moveURL);
	}

}
