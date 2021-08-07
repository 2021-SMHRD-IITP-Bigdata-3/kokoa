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
			
		// post방식 인코딩
				// title, writer, content에 대한 인코딩 방식
				request.setCharacterEncoding("EUC-KR");
				
				// 1. 이미지 경로
				// getServletContext : 서블릿의 정보
				// getRealPath : 실제 경로
				// 이미지 저장할 경로를 지정(상대경로)
				String savePath = request.getServletContext().getRealPath("img");
				System.out.println(savePath);
				
				// 2. 이미지 크기
				// 이미지 크기를 제한 : 서버의 효율성을 위해
				// 1kb= 1024 byte
				// 1mb = 1024 kb
				int maxSize = 5*1024*1024; // 5mb
				
				
				// 3. 이미지명 인코딩 방식
				String encoding = "EUC-KR";
				
				// MultipartRequest : cos.jar 파일 내에 있는 클래스
				// request 객체, 이미지 저장 경로, 제한할 이미지 크기, 이미지 방식, 중복 제거
				
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
				
				String cs_title = multi.getParameter("cs_title");
				String cs_con = multi.getParameter("cs_con");

				// 이미지 태그에 경로 작성시 16진수로 적어줘야해서 인코딩 진행
				String cs_pic = URLEncoder.encode(multi.getFilesystemName("cs_pic"), "EUC-KR");
				
				System.out.println(cs_title);
				System.out.println(cs_con);
				System.out.println(cs_pic);

				
				CSBoardDTO dto= new CSBoardDTO(cs_title, cs_con, cs_pic);
				CSBoardDAO dao = new CSBoardDAO();
				int cnt = dao.upload(dto);
				
				if(cnt>0) {
					System.out.println("고객의 소리 전송 성공");
				}else {
					System.out.println("고객의 소리 전송 실패");
				}
				response.sendRedirect("MyPage.jsp");
			}

		}