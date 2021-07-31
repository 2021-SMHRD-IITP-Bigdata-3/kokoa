package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CourseDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	CourseDTO dto = null;
	
	public void conn() {
	   try {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	        
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String dbid = "hr";
	      String dbpw = "hr";
	         
	      conn = DriverManager.getConnection(url, dbid, dbpw);
	         
	   } catch (Exception e) {
	      e.printStackTrace();
	   }
	}
	public void close() {
	   try {
	      if(psmt != null) {
	         psmt.close();
	      }
	      if(conn != null) {
	         conn.close();
	      }
	      if(rs != null) {
	         rs.close();
	      }
	   }catch (Exception e) {
	      e.printStackTrace();
	   }
	}
	
	public int upload() {	
		try {
			conn();
			String sql = "insert into web_board values(course_num_seq.nextval, ?,?,?,?)";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getTracking_image());
			psmt.setString(2, dto.getTracking_time());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getNickname());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	
	}
}
