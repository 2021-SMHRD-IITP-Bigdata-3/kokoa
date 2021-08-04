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
				
//				결과값 어디에 담았어요 물음표에 값 넣고 sql 문 실행시켜서 나온 결과값을 cnt에 담아줘야 return값에 담기겠죠?
//						지금은 cnt가 위에ㅓㅅ 전역변수로 0이라고 선언해놓아서 데이터베이스에 들어가더라도 무조건 return이 0으로 됩니다.!
						
						cnt = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;

		}

}
