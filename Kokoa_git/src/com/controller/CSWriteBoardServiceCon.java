package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CSBoardDAO;
import com.model.CSBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/CSWriteBoardServiceCon")
public class CSWriteBoardServiceCon extends HttpServlet {

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
				
				String cs_title = multi.getParameter("cs_title");
				String cs_con = multi.getParameter("cs_con");

				// �̹��� �±׿� ��� �ۼ��� 16������ ��������ؼ� ���ڵ� ����
				String cs_pic = URLEncoder.encode(multi.getFilesystemName("cs_pic"), "EUC-KR");
				
				System.out.println(cs_title);
				System.out.println(cs_con);
				System.out.println(cs_pic);

				
				CSBoardDTO dto= new CSBoardDTO(cs_title, cs_con, cs_pic);
				CSBoardDAO dao = new CSBoardDAO();
				int cnt = dao.upload(dto);
				
				if(cnt>0) {
					System.out.println("���� �Ҹ� ���� ����");
				}else {
					System.out.println("���� �Ҹ� ���� ����");
				}
				response.sendRedirect("MyPage.jsp");
			}

		}