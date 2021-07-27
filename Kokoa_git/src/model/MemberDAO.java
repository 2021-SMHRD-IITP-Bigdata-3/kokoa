package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			String sql = "insert into k_member values(mem_num_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getPw());
			psmt.setString(4, dto.getName());
			psmt.setInt(5, dto.getAge());
			psmt.setString(6, dto.getGender());
			psmt.setString(7, dto.getBirth());
			psmt.setString(8, dto.getAddr());
			psmt.setString(9, dto.getTel());
			psmt.setString(10, dto.getEmail());
			psmt.setString(11, dto.getIntrd());
			psmt.setString(12, dto.getDog_name());
			psmt.setInt(13, dto.getDog_age());
			psmt.setString(14, dto.getDog_gender());
			psmt.setString(15, dto.getDog_pic());
			psmt.setInt(16, dto.getDog_num());
			psmt.setString(17, dto.getDog_size());
			psmt.setString(18, dto.getDog_type());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public MemberDTO login(String getId, String getPw) {
		try {
			conn();	
			String sql = "select * from k_member where id = ? and pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, getId);
			psmt.setString(2, getPw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				
				info = new MemberDTO(id,pw);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return info;
	}
}
