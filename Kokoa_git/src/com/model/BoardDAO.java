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
			
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String dbid="hr";
			String dbpw="hr";
			
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
			String sql="insert into sns values(?,?,?,sysdate)";
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
				String story_title= rs.getString("story_title");
				String story_con= rs.getString("story_con");
				String story_pic= rs.getString("story_pic");
				String write_time= rs.getString("write_time");
				
				BoardDTO dto = new BoardDTO(story_title, story_con, story_pic, write_time);
				board_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_list;
	}
}
