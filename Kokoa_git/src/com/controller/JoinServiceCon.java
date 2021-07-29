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
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		int maxSize = 5*1024*1024;
		
		String encoding = "EUC-KR";
		String dog_pic="";
		request.setCharacterEncoding("EUC-KR");
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
			dog_pic = URLEncoder.encode(multi.getFilesystemName("dog_pic"),"EUC-KR");
		} catch (Exception e) {
			e.getStackTrace();
		}
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		String intrd = request.getParameter("intrd");
		String dog_name = request.getParameter("dog_name");
		int dog_age = Integer.parseInt(request.getParameter("dog_age"));
		String dog_gender = request.getParameter("dog_gender");


		int dog_num = Integer.parseInt(request.getParameter("dog_num"));
		String dog_size = request.getParameter("dog_size");
		String dog_type = request.getParameter("dog_type");
		
		System.out.println(id);
		System.out.println(nickname);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(birth);
		System.out.println(tel);
		System.out.println(addr);
		System.out.println(email);
		System.out.println(intrd);
		System.out.println(dog_type);
		
		MemberDTO dto = new MemberDTO(id,nickname,pw,name,age,gender,birth,addr,tel,email,intrd,dog_name,dog_age,dog_gender,dog_pic,dog_num,dog_size,dog_type);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);
		
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
