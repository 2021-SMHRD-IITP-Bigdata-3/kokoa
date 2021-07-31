package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cnt = 0;
		
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		int maxSize = 5*1024*1024;
		
		String encoding = "EUC-KR";
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
			String id = multi.getParameter("id");
			String nickname = multi.getParameter("nickname");
			String pw = multi.getParameter("pw");
			String name = multi.getParameter("name");
			int age = Integer.parseInt(multi.getParameter("age"));
			String gender = multi.getParameter("gender");
			String birth = multi.getParameter("birth");
			String tel = multi.getParameter("tel");
			String addr = multi.getParameter("addr");
			String email = multi.getParameter("email");
			String intrd = multi.getParameter("intrd");
			String dog_name = multi.getParameter("dog_name");
			int dog_age = Integer.parseInt(multi.getParameter("dog_age"));
			String dog_gender = multi.getParameter("dog_gender");
			String dog_pic = URLEncoder.encode(multi.getFilesystemName("dog_pic"),"EUC-KR");
			int dog_num = Integer.parseInt(multi.getParameter("dog_num"));
			String dog_size = multi.getParameter("dog_size");
			String dog_type = multi.getParameter("dog_type");
			
			MemberDTO dto = new MemberDTO(id,nickname,pw,name,age,gender,birth,addr,tel,email,intrd,dog_name,dog_age,dog_gender,dog_pic,dog_num,dog_size,dog_type);
			MemberDAO dao = new MemberDAO();
			cnt = dao.join(dto);
			
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		
		String moveURL = "";
		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			moveURL = "Main.jsp";
			HttpSession session = request.getSession();
		} else {
			System.out.println("회원가입 실패");
			moveURL = "Main.jsp";
		}
		
		response.sendRedirect(moveURL);
	}

}
