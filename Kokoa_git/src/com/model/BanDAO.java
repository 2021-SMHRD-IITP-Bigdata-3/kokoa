package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BanDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null; 
	int cnt=0;
	int res=0;
	int[] cnt1=null;
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
	public int block(BanDTO dto) {
		try {
			conn();
			String sql="insert into block_list values(ban_num_seq.nextval,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBan_mem_num());
			psmt.setString(2, dto.getBan_id());
			
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	public ArrayList<BanDTO> showBanMem(int input_mem_num) {
		ArrayList<BanDTO> block_list = new ArrayList<BanDTO>();
		try {
			conn();
			String sql="select * from block_list where ban_mem_num = ? order by block_date";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, input_mem_num);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int ban_num = rs.getInt("ban_num");
				int ban_mem_num = rs.getInt("ban_mem_num");				
				String ban_id= rs.getString("ban_id");
				String block_date= rs.getString("block_date");
				
				BanDTO dto = new BanDTO(ban_num, ban_mem_num, ban_id, block_date);
				block_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return block_list;
}
	public int DeleteBan(String[] ban_num) {
		try {
			conn();
			String sql="delete from block_list where ban_num=? ";
			psmt = conn.prepareStatement(sql);
			for(int i=0; i<ban_num.length; i++) {
				psmt.setString(0, ban_num[i]);
				cnt = psmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
