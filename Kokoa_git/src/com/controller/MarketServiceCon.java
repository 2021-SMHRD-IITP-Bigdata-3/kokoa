package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MarketDAO;
import com.model.MarketDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/MarketServiceCon")
public class MarketServiceCon extends HttpServlet {
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
		
		String product = multi.getParameter("product");
		String product_title = multi.getParameter("product_title");
		String product_con = multi.getParameter("product_con");
		String product_price = multi.getParameter("product_price");
		String product_seller = multi.getParameter("product_seller");
		

		// 이미지 태그에 경로 작성시 16진수로 적어줘야해서 인코딩 진행
		String product_pic = URLEncoder.encode(multi.getFilesystemName("product_pic"), "EUC-KR");
		
		System.out.println(product);
		System.out.println(product_title);
		System.out.println(product_con);
		System.out.println(product_pic);
		System.out.println(product_price);

		
		MarketDTO dto= new MarketDTO(product, product_title, product_con,product_pic, product_price, product_seller);
		MarketDAO dao = new MarketDAO();
		int cnt = dao.upload(dto);
		
		if(cnt>0) {
			System.out.println("상품등록 성공");
		}else {
			System.out.println("상품등록 실패");
		}
		response.sendRedirect("FleaMarket.jsp");
	}

}