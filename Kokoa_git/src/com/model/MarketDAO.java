package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MarketDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt=0;
	MarketDTO dto =null;

	public void conn() {
		try {
			// model1 객체에서 사용하지 않았던 이유는 Exception 객체가 내장객체로 존재하기 때문
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@118.40.119.10:1524:xe";
			String dbid="campus_f1";
	        String dbpw = "smhrd1";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			// 가장 마지막에 열었기 때문에 첫번째로 닫아주기(rs)
			if (rs!=null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			} catch (Exception e) {
				e.printStackTrace();
			}

	}

	public int upload(MarketDTO dto) {
		try {
			conn();
			String sql="insert into flea_market values(product_num_seq.nextval, ?,?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getProduct());
			psmt.setString(2, dto.getProduct_title());
			psmt.setString(3, dto.getProduct_con());
			psmt.setString(4, dto.getProduct_pic());
			psmt.setString(5, dto.getProduct_price());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	
	public ArrayList<MarketDTO> showBoard() {
		ArrayList<MarketDTO> board_list = new ArrayList<MarketDTO>();
		try {
			conn();
			String sql="select * from flea_market";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {

				String product= rs.getString("product");
				String product_title= rs.getString("product_title");
				String product_con= rs.getString("product_con");
				String product_pic= rs.getString("product_pic");
				String product_price= rs.getString("product_price");
				
				MarketDTO dto = new MarketDTO(product, product_title, product_con, product_pic, product_price);
				board_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_list;
	}

	
}
