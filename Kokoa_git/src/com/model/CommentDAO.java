package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null; 
	int cnt=0;
	CommentDTO dto =null;
 
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
	public int upload_com(CommentDTO dto) {
		try {
			conn();
			String sql="insert into comment_info values(comment_num_seq.nextval,?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBoard_num());
			psmt.setString(2, dto.getComment_con());
			psmt.setString(3, dto.getId());
			
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	public ArrayList<CommentDTO> showComment() {
		ArrayList<CommentDTO> comment_list = new ArrayList<CommentDTO>();
		try {
			conn();
			String sql="select * from comment_info order by write_time";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int comment_num = rs.getInt("comment_num");
				int board_num = rs.getInt("board_num");				
				String comment_con= rs.getString("comment_con");
				String id= rs.getString("id");
				String write_time= rs.getString("write_time");
				
				CommentDTO dto = new CommentDTO(comment_num, board_num, comment_con, id, write_time);
				comment_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return comment_list;
		
	}
	public CommentDTO showOne_com(int board_num) {
		try {
			conn();
			String sql="select * from sns where board_num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board_num);
			rs = psmt.executeQuery();

			if(rs.next()) {
				String comment_con = rs.getString("comment_con");
				String id = rs.getString("id");
				String write_time = rs.getString("write_time");
				
				dto = new CommentDTO(comment_con, id, write_time);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return dto; 
	}
	public int delete_com(int board_num, int comment_num) {
		try {
			conn();
			String sql="delete from comment_info where board_num =? and comment_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board_num);
			psmt.setInt(2, comment_num);
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
}


