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
		
		String product = multi.getParameter("product");
		String product_title = multi.getParameter("product_title");
		String product_con = multi.getParameter("product_con");
		String product_price = multi.getParameter("product_price");
		String product_seller = multi.getParameter("product_seller");
		

		// �̹��� �±׿� ��� �ۼ��� 16������ ��������ؼ� ���ڵ� ����
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
			System.out.println("��ǰ��� ����");
		}else {
			System.out.println("��ǰ��� ����");
		}
		response.sendRedirect("FleaMarket.jsp");
	}

}