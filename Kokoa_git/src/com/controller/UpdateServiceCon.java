package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/UpdateServiceCon")
public class UpdateServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String intrd = request.getParameter("intrd");
		String dog_name = request.getParameter("dog_name");
		String dog_gender = request.getParameter("dog_gender");
		String dog_pic = request.getParameter("dog_pic");
		
		String id = request.getParameter("id");
		HttpSession session = request.getSession();		
	    MemberDTO info = (MemberDTO)session.getAttribute("info");
	    
	    info = new MemberDTO(id, nickname, pw, email, addr, tel, intrd, dog_name, dog_gender, dog_pic);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(info);
		
		if(cnt >0) {
	         System.out.println("회원 정보 수정");
	         session.setAttribute("info", info);
	      }else {
	         System.out.println("회원 정보 수정 실패");
	      }
	      response.sendRedirect("MyPage.jsp");
	   
	   }

	}