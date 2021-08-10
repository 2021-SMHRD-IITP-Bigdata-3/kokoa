package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CourseDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	CourseDTO dto = null;
	
	public void conn() {
	   try {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	        
	      String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	      String dbid = "campus_f1";
	      String dbpw = "smhrd1";
	         
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
			String sql = "insert into course_list values(course_num_seq.nextval,?, sysdate, ?,?)";
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
	
	public ArrayList<CourseDTO> show(String id) {
		ArrayList<CourseDTO> list = new ArrayList<CourseDTO>();
		try {
			conn();
			String sql = "select * from course_list where id = ?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String tracking_time = rs.getString(2);
				String date = rs.getString(3);
				String nickname = rs.getString(5);
				dto = new CourseDTO(tracking_time, nickname, date);
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
