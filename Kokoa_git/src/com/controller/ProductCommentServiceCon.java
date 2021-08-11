package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CommentDAO;
import com.model.CommentDTO;
import com.model.PCommentDAO;
import com.model.PCommentDTO;

@WebServlet("/ProductCommentServiceCon")
public class ProductCommentServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		int product_num_1 = Integer.parseInt(request.getParameter("product_num_1"));
		String comment_con = request.getParameter("comment_con");
		String id = request.getParameter("id");
		System.out.println(product_num_1);
		System.out.println(id);
		
		PCommentDTO dto = new PCommentDTO(product_num_1, comment_con, id);
		PCommentDAO dao = new PCommentDAO();
		int cnt = dao.upload_com(dto);
		
		if(cnt>0) {
			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("product_num_1", product_num_1);
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("PComment.jsp");
	}

}