package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class WriteBoardServiceCon
 */
@WebServlet("/WriteBoardServiceCon")
public class WriteBoardServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post��� ���ڵ�
		// title, writer, content�� ���� ���ڵ� ���
		request.setCharacterEncoding("EUC-KR");
		
		// 1. �̹��� ���
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		// �̹��� ������ ��θ� ����(�����)
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		// 2. �̹��� ũ��
		// �̹��� ũ�⸦ ���� : ������ ȿ������ ����
		// 1kb= 1024 byte
		// 1mb = 1024 kb
		int maxSize = 5*1024*1024; // 5mb
		
		
		// 3. �̹����� ���ڵ� ���
		String encoding = "EUC-KR";
		
		// MultipartRequest : cos.jar ���� ���� �ִ� Ŭ����
		// request ��ü, �̹��� ���� ���, ������ �̹��� ũ��, �̹��� ���, �ߺ� ����
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String story_title = multi.getParameter("story_title");
		String story_con = multi.getParameter("story_con");

		// �̹��� �±׿� ��� �ۼ��� 16������ ��������ؼ� ���ڵ� ����
		String story_pic = URLEncoder.encode(multi.getFilesystemName("story_pic"), "EUC-KR");
		
		System.out.println(story_title);
		System.out.println(story_con);
		System.out.println(story_pic);

		
		BoardDTO dto= new BoardDTO(story_title, story_con, story_pic);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.upload(dto);
		
		if(cnt>0) {
			System.out.println("�̹��� ���ε� ����");
		}else {
			System.out.println("�̹��� ���ε� ����");
		}
		response.sendRedirect("SNS.jsp");
	}

}