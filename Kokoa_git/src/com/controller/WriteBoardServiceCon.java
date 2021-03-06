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
		
		String story_title = multi.getParameter("story_title");
		String story_con = multi.getParameter("story_con");

		// 이미지 태그에 경로 작성시 16진수로 적어줘야해서 인코딩 진행
		String story_pic = URLEncoder.encode(multi.getFilesystemName("story_pic"), "EUC-KR");
		
		System.out.println(story_title);
		System.out.println(story_con);
		System.out.println(story_pic);

		
		BoardDTO dto= new BoardDTO(story_title, story_con, story_pic);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.upload(dto);
		
		if(cnt>0) {
			System.out.println("이미지 업로드 성공");
		}else {
			System.out.println("이미지 업로드 실패");
		}
		response.sendRedirect("SNS.jsp");
	}

}