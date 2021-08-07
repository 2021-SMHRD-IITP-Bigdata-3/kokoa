package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MatchingDAO {
	Connection conn = null;
	   PreparedStatement psmt = null;
	   int cnt = 0;
	   ResultSet rs = null;
	   String dog_type = "";
	   MemberDTO info = null;
	   MatchingDTO dto = null;
	   
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
	   
	   
	   public int create(MatchingDTO dto) {
			try {
				conn();
				String sql = "insert into matching_chat_list values (chat_num_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
	   
	   public ArrayList<MatchingDTO> show() {
		   ArrayList<MatchingDTO> matchingList = new ArrayList<MatchingDTO>();
		   try {
			   conn();
			   String sql = "select * from matching_chat_list order by chatting_room_num desc";
			   psmt = conn.prepareStatement(sql);
			   rs = psmt.executeQuery();
			   while(rs.next()) {
				   int chatting_room_num = rs.getInt(1);
				   String chatting_room_title = rs.getString(2);
				   String gender = rs.getString(3);
				   String nickname = rs.getString(4);
				   String id = rs.getString(5);
				   String matching_date = rs.getString(6);
				   String dog_gender = rs.getString(7);
				   String dog_size = rs.getString(8);
				   int hour = rs.getInt(9);
				   int minute = rs.getInt(10);
				   int min_age = rs.getInt(11);
				   int max_age = rs.getInt(12);
				   
				   dto = new MatchingDTO(chatting_room_num, chatting_room_title, gender, nickname, id, matching_date, dog_gender, dog_size, hour, minute, min_age, max_age);
				   matchingList.add(dto);
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
		   } return matchingList;
	   }
	   
	   public ArrayList<MatchingDTO> showF(String input_gender, int input_min_age, int input_max_age, String input_min_date, String input_max_date, String input_dog_size, String input_dog_gender) {
		   ArrayList<MatchingDTO> matchingList = new ArrayList<MatchingDTO>();
		   try {
			   conn();
			   String sql = "select * from matching_chat_list "
			   		+ "where gender like ? "
			   		+ "and min_age between ? and ? "
			   		+ "and max_age between ? and ? "
			   		+ "and matching_date between ? and ? "
			   		+ "and dog_size like ? "
			   		+ "and dog_gender like ? "
			   		+ "order by chatting_room_num desc";
			   psmt = conn.prepareStatement(sql);
			   psmt.setString(1, input_gender);
			   psmt.setInt(2, input_min_age);
			   psmt.setInt(3,  input_max_age);
			   psmt.setInt(4, input_min_age);
			   psmt.setInt(5, input_max_age);
			   psmt.setString(6, input_min_date);
			   psmt.setString(7, input_max_date);
			   psmt.setString(8, input_dog_size);
			   psmt.setString(9, input_dog_gender);
			   rs = psmt.executeQuery();
			   while(rs.next()) {
				   int chatting_room_num = rs.getInt(1);
				   String chatting_room_title = rs.getString(2);
				   String gender = rs.getString(3);
				   String nickname = rs.getString(4);
				   String id = rs.getString(5);
				   String matching_date = rs.getString(6);
				   String dog_gender = rs.getString(7);
				   String dog_size = rs.getString(8);
				   int hour = rs.getInt(9);
				   int minute = rs.getInt(10);
				   int min_age = rs.getInt(11);
				   int max_age = rs.getInt(12);
				   
				   dto = new MatchingDTO(chatting_room_num, chatting_room_title, gender, nickname, id, matching_date, dog_gender, dog_size, hour, minute, min_age, max_age);
				   matchingList.add(dto);
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
		   } return matchingList;
	   }
	   
	   public String showI(String id, int room_num) {
		   String chatting_room_title="";
		   try {
			   conn();
			   String sql = "select * from matching_chat_list where id = ? and chatting_room_num = ? order by chatting_room_num desc";
			   psmt = conn.prepareStatement(sql);
			   psmt.setString(1, id);
			   psmt.setInt(2, room_num);
			   rs = psmt.executeQuery();
			   while(rs.next()) {
				   chatting_room_title = rs.getString("chatting_room_title");
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
		   } return chatting_room_title;
	   }
}
