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
	
	public int upload(CourseDTO dto) {	
		try {
			conn();
			String sql = "insert into course_list values(course_num_seq.nextval, 'pic',?,?,?)";
			psmt=conn.prepareStatement(sql);
			//psmt.setString(1, dto.getTracking_image());
			psmt.setString(1, dto.getTracking_time());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getNickname());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public CourseDTO show(String nickname) {	
		try {
			conn();
			String sql = "select * course_list from course_list where nickname = ?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, nickname);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int course_num = rs.getInt(1);
				String tracking_image = rs.getString(2);
				String tracking_time = rs.getString(3);
				String id = rs.getNString(4);
				dto = new CourseDTO(course_num, tracking_image, tracking_time, id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
}
