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
	   
	   
	   public int upload(MatchingDTO dto) {
			try {
				conn();
				String sql = "insert into matching_chat_list values (chat_num_seq.netxval, ?, ?, ?, ?, sysdate)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getChatting_room_num());
				psmt.setString(2, dto.get());
				psmt.setString(3, dto.get());
				psmt.setString(4, dto.get());
				psmt.setString(4, dto.get());
				psmt.setString(4, dto.get());
				psmt.setString(4, dto.get());
				
//				����� ��� ��Ҿ�� ����ǥ�� �� �ְ� sql �� ������Ѽ� ���� ������� cnt�� ������ return���� ������?
//						������ cnt�� �����ä� ���������� 0�̶�� �����س��Ƽ� �����ͺ��̽��� ������ ������ return�� 0���� �˴ϴ�.!
						
						cnt = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;

		}

}
