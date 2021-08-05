package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MatchingDAO {
	Connection conn = null;
	   PreparedStatement psmt = null;
	   int cnt = 0;
	   ResultSet rs = null;
	   String dog_type = "";
	   MemberDTO info = null;
	   
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
	   
	   
	   public int create(MatchingDTO dto) {
			try {
				conn();
				String sql = "insert into matching_chat_list values (chat_num_seq.netxval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getChatting_room_title());
				psmt.setString(2, dto.getGender());
				psmt.setString(3, dto.getNickname());
				psmt.setString(4, dto.getId());
				psmt.setString(5, dto.getMatching_date());
				psmt.setString(6, dto.getDog_gender());
				psmt.setString(7, dto.getDog_size());
				psmt.setInt(8, dto.getHour());
				psmt.setInt(9, dto.getMinute());
				psmt.setInt(10, dto.getMin_age());
				psmt.setInt(11, dto.getMax_age());
						
				cnt = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;

		}

}
