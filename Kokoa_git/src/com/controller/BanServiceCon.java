package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BanDAO;
import com.model.BanDTO;


@WebServlet("/BanServiceCon")
public class BanServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		int ban_mem_num = Integer.parseInt(request.getParameter("ban_mem_num"));
		String ban_id = request.getParameter("ban_id");
		
		System.out.println(ban_mem_num);
		System.out.println(ban_id);
		
		BanDTO dto = new BanDTO(ban_mem_num, ban_id);
		BanDAO dao = new BanDAO();
		
		int cnt = dao.block(dto);
		if(cnt > 0 ) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("BlockMem/Block_mem.jsp");
		
	}

}
