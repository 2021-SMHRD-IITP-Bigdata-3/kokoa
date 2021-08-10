package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CourseDAO;
import com.model.CourseDTO;

@WebServlet("/CourseSaveServiceCon")
public class CourseSaveServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("EUC-KR");

			String tracking_time = request.getParameter("tracking_time");
			String id = request.getParameter("id");
			String nickname = request.getParameter("nickname");
			
			CourseDTO dto = new CourseDTO(tracking_time, id, nickname);
			CourseDAO dao = new CourseDAO();
			int cnt = dao.upload(dto);
			
			String moveURL = "";
			
			if(cnt > 0) {
				System.out.println("코스 저장 성공");
				moveURL = "WalkHistory.jsp";
			} else {
				System.out.println("코스 저장 실패");
				moveURL = "WalkHistory.jsp";
			}
			
			response.sendRedirect(moveURL);
	}

}
