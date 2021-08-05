package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt=0;
	BoardDTO dto =null;
 
	public void conn() {
		try {
			// model1 객체에서 사용하지 않았던 이유는 Exception 객체가 내장객체로 존재하기 때문
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid="campus_f1";
			String dbpw="smhrd1";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			// 가장 마지막에 열었기 때문에 첫번째로 닫아주기(rs)
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
	public int upload(BoardDTO dto) {
		try {
			conn();
			String sql="insert into sns values(story_num_seq.nextval, ?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStory_title());
			psmt.setString(2, dto.getStory_con());
			psmt.setString(3, dto.getStory_pic());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	public ArrayList<BoardDTO> showBoard() {
		ArrayList<BoardDTO> board_list = new ArrayList<BoardDTO>();
		try {
			conn();
			String sql="select * from sns order by write_time";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int story_num = rs.getInt("story_num");
				String story_title= rs.getString("story_title");
				String story_con= rs.getString("story_con");
				String story_pic= rs.getString("story_pic");
				String write_time= rs.getString("write_time");
				
				BoardDTO dto = new BoardDTO(story_num, story_title, story_con, story_pic, write_time);
				board_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_list;
	}
//개별 게시글 보여주기 메소드
	public BoardDTO showOne(int story_num) {
		try {
			conn();
			String sql="select * from sns where story_num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_num);
			rs = psmt.executeQuery();

			if(rs.next()) {
				String story_title = rs.getString("story_title");
				String story_con = rs.getString("story_con");
				String story_pic = rs.getString("story_pic");
				String write_time = rs.getString("write_time");
				
				dto = new BoardDTO(story_num, story_title, story_con, story_pic, write_time);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return dto; 
	}
}