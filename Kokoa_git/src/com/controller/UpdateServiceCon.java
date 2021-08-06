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

@WebServlet("/UpdateServiceCon2")
public class UpdateServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ddddddddddddddddddddddddds");
		int cnt = 0;
		MemberDTO info = null;
		
		HttpSession session = request.getSession();	
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		int maxSize = 5*1024*1024;
		
		String encoding = "EUC-KR";
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
			String nickname = multi.getParameter("nickname");
			String pw = multi.getParameter("pw");
			String tel = multi.getParameter("tel");
			String addr = multi.getParameter("addr");
			String email = multi.getParameter("email");
			String intrd = multi.getParameter("intrd");
			String dog_name = multi.getParameter("dog_name");
			String dog_gender = multi.getParameter("dog_gender");
			String dog_pic = URLEncoder.encode(multi.getFilesystemName("dog_pic"),"EUC-KR");
			
			
			info = (MemberDTO)session.getAttribute("info");
			String id = info.getId();

		    System.out.println();
		    System.out.println(id+"/"+nickname+"/"+pw+"/"+addr+"/"+tel+"/"+email+"/"+intrd+"/"+dog_name+"/"+dog_gender+"/"+dog_pic);
			
			info = new MemberDTO(id,nickname,pw,addr,tel,email,intrd,dog_name,dog_gender,dog_pic);
			MemberDAO dao = new MemberDAO();
			cnt = dao.update(info);
			System.out.println("ȸ������ ����!!!!!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(cnt >0) {
	         System.out.println("ȸ�� ���� ����");
	         session.setAttribute("info", info);
	      }else {
	         System.out.println("ȸ�� ���� ���� ����");
	      }
	      response.sendRedirect("MyPage.jsp");
	   
	   }

	}