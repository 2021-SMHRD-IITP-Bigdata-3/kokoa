package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	   
	   public void conn() {
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");

	         String url = "jdbc:oracle:thin:@localhost:1521:xe";
	         // @localhost -> @59.0.100.45
	         // 동희 ip : 59.0.100.45
	         String dbid = "hr";
	         String dbpw = "hr";

	         conn = DriverManager.getConnection(url, dbid, dbpw);

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

	   public void close() {
	      try {
	         if (rs != null) {
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

	public int insertChat(int chat_num, String id, String content) {

		conn();
		int cnt = 0;
		
		String sql = "insert into chat values(?,?,?,sysdate)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, chat_num);
			psmt.setString(2, id);
			psmt.setString(3, content);
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}

	public ArrayList<ChatDTO> selectAllChat(String chat_num) {
		ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
		conn();
		
		// 채팅방 번호에 맞는 데이터만 최신순으로 
		String sql = "select * from chat where chat_num = ? order by day";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, chat_num);
			rs = psmt.executeQuery();
			while(rs.next()) {
				int number = rs.getInt(1);
				String id = rs.getString(2);
				String content = rs.getString(3);
				String day = rs.getString(4);
				ChatDTO dto = new ChatDTO(number, id, content, day);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	      
	   
}
