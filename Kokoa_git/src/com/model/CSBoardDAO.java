package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CSBoardDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt=0;
	CSBoardDTO dto =null;

	public void conn() {
		try {
			// model1 객체에서 사용하지 않았던 이유는 Exception 객체가 내장객체로 존재하기 때문
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid="campus_f1";
	        String dbpw = "smhrd1";
			
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
	
	public int upload(CSBoardDTO dto) {
		try {
			conn();
			String sql="insert into cs values(customer_seq.nextval, ?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getcs_title());
			psmt.setString(2, dto.getcs_con());
			psmt.setString(3, dto.getcs_pic());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	
	public ArrayList<CSBoardDTO> showBoard() {
		ArrayList<CSBoardDTO> board_list = new ArrayList<CSBoardDTO>();
		try {
			conn();
			String sql="select * from cs order by write_time";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int cs_num = rs.getInt("cs_num");
				String cs_title= rs.getString("cs_title");
				String cs_con= rs.getString("cs_con");
				String cs_pic= rs.getString("cs_pic");
				String write_time= rs.getString("write_time");
				
				CSBoardDTO dto = new CSBoardDTO(cs_num, cs_title, cs_con, cs_pic, write_time);
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
	public CSBoardDTO showOne(int cs_num) {
		try {
			conn();
			String sql="select * from cs where cs_num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cs_num);
			rs = psmt.executeQuery();

			if(rs.next()) {
				String cs_title = rs.getString("cs_title");
				String cs_con = rs.getString("cs_con");
				String cs_pic = rs.getString("cs_pic");
				String write_time = rs.getString("write_time");
				
				dto = new CSBoardDTO(cs_num, cs_title, cs_con, cs_pic, write_time);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return dto; 
	}

	public int deleteCS(int cs_num) {
		try {
			 conn();
		 	
			 String sql = "delete from cs where cs_num = ?";	
			 psmt = conn.prepareStatement(sql);
			 psmt.setInt(1, cs_num);
			 cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close();
		}
		 return cnt;
		
	 }
}
