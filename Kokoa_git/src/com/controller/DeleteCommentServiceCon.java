package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommentDAO;
import com.model.CommentDTO;

/**
 * Servlet implementation class DeleteCommentServiceCon
 */
@WebServlet("/DeleteCommentServiceCon")
public class DeleteCommentServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		CommentDAO dao = new CommentDAO();
		int cnt = dao.delete_com(board_num, comment_num);
		
		if(cnt>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		response.sendRedirect("Stories.jsp?story_num="+board_num);
	}

}
