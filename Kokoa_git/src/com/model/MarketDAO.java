package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MarketDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt=0;
	MarketDTO dto =null;

	public void conn() {
		try {
			// model1 ��ü���� ������� �ʾҴ� ������ Exception ��ü�� ���尴ü�� �����ϱ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@118.40.119.10:1524:xe";
			String dbid="hr";
			String dbpw="hr";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			// ���� �������� ������ ������ ù��°�� �ݾ��ֱ�(rs)
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
			psmt.setString(1, dto.getproduct());
			psmt.setString(2, dto.getproduct_title());
			psmt.setString(3, dto.getproduct_con());
			psmt.setString(4, dto.getproduct_pic());
			psmt.setString(5, dto.getproduct_price());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
}
