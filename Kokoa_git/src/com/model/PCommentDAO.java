package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PCommentDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null; 
	int cnt=0;
	PCommentDTO dto =null;
 
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
	
	public int upload_com(PCommentDTO dto) {
		try {
			conn();
			String sql="insert into pcomment_info values(pcomment_num_seq.nextval,?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getProduct_num_1());
			psmt.setString(2, dto.getComment_con());
			psmt.setString(3, dto.getId());
			
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	
	public ArrayList<PCommentDTO> showComment() {
		ArrayList<PCommentDTO> comment_list = new ArrayList<PCommentDTO>();
		try {
			conn();
			String sql="select * from pcomment_info order by write_time";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int comment_num = rs.getInt("comment_num");
				int product_num_1 = rs.getInt("product_num_1");
				String comment_con= rs.getString("comment_con");
				String id= rs.getString("id");
				String write_time= rs.getString("write_time");
				
				PCommentDTO dto = new PCommentDTO(comment_num, product_num_1,comment_con, id, write_time);
				comment_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return comment_list;	
	}
	
	public PCommentDTO showOne_com(int product_num_1) {
		try {
			conn();
			String sql="select * from flea_market where product_num_1=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, product_num_1);
			rs = psmt.executeQuery();

			if(rs.next()) {
				String comment_con = rs.getString("comment_con");
				String id = rs.getString("id");
				String write_time = rs.getString("write_time");
				
				dto = new PCommentDTO(comment_con, id, write_time);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return dto; 
	}
	public int delete_com(int product_num_1, int comment_num) {
		try {
			conn();
			String sql="delete from pcomment_info where product_num_1 =? and comment_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, product_num_1);
			psmt.setInt(2, comment_num);
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
}