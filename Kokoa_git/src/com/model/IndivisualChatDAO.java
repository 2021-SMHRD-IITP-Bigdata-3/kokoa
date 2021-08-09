package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class IndivisualChatDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	String dog_type = "";
	IndivisualChatDTO info = null;
	
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
	
	public void joinChat(int mem_num, int chatting_room_num) {
		try {
			conn();
			String sql = "insert into indivisual_chat_list values(?,?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mem_num);
			psmt.setInt(2, chatting_room_num);
			cnt = psmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} 
	}
	
	public ArrayList<IndivisualChatDTO> showChat(int input_mem_num) {
		ArrayList<IndivisualChatDTO> list = new ArrayList<IndivisualChatDTO>();
		try {
			conn();
			String sql = "select * from indivisual_chat_list where mem_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, input_mem_num);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
	            int mem_num = rs.getInt(1);
	            int chatting_room_num = rs.getInt(2);
	            
	            info = new IndivisualChatDTO(mem_num, chatting_room_num);
	            list.add(info);
	         }
		} catch(Exception e){
			e.printStackTrace();
		} return list;
	}
	
	public int leaveChat(int mem_num, String chatting_room_num) {
		try {
			conn();
			String sql = "delete from indivisual_chat_list where mem_num = ? and chatting_room_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mem_num);
			psmt.setString(2, chatting_room_num);
			cnt = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return cnt;
	}
}
