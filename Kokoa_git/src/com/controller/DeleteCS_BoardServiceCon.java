package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CSBoardDAO;

@WebServlet("/DeleteCS_BoardServiceCon")
public class DeleteCS_BoardServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cs_num = Integer.parseInt(request.getParameter("cs_num"));
		
		System.out.println("������ ���� ��ȣ"+cs_num);
		
		CSBoardDAO dao = new CSBoardDAO();
		int cnt = dao.deleteCS(cs_num);
		
		if(cnt>0) {
			System.out.println("���� ����");
		}else {
			System.out.println("���� ����");
		}
		response.sendRedirect("CS_Board.jsp");
	}

}
