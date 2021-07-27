package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
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
	
	public int join(MemberDTO dto) {	
		try {
			conn();	// connect to DB
			String sql = "insert into k_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getMem_num());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getPw());
			psmt.setString(5, dto.getName());
			psmt.setInt(6, dto.getAge());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getBirth());
			psmt.setString(9, dto.getAddr());
			psmt.setString(10, dto.getTel());
			psmt.setString(11, dto.getEmail());
			psmt.setString(12, dto.getIntrd());
			psmt.setString(13, dto.getDog_name());
			psmt.setInt(14, dto.getDog_age());
			psmt.setString(15, dto.getDog_gender());
			psmt.setString(16, dto.getDog_pic());
			psmt.setInt(17, dto.getDog_num());
			psmt.setString(18, dto.getDog_size());
			psmt.setString(19, dto.getDog_type());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
}
}
