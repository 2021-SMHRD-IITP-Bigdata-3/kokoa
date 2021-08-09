package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CommentDAO;
import com.model.CommentDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/WriteCommentServiceCon")
public class WriteCommentServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String id = request.getParameter("id");
		String comment_con = request.getParameter("comment_con");
		System.out.println(board_num);
		System.out.println(id);
		System.out.println(comment_con);
		
		CommentDTO dto = new CommentDTO(board_num, comment_con, id);
		CommentDAO dao = new CommentDAO();
		int cnt = dao.upload_com(dto);
		
		if(cnt>0) {
			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("board_num", board_num);
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("Stories.jsp");
	}

}
