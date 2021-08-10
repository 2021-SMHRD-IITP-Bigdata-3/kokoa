package com.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BanDAO;


@WebServlet("/DeleteBanMemberServiceCon")
public class DeleteBanMemberServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String[] ban_num =request.getParameterValues("chk");
		System.out.println(Arrays.toString(ban_num));
		
		int cnt=0;
		BanDAO dao = new BanDAO();
		for(int i = 0; i<ban_num.length; i++) {
			cnt += dao.DeleteBan(Integer.parseInt(ban_num[i]));
			
		}
		
		if(cnt > 0 ) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("BlockList.jsp");
		
	}

}