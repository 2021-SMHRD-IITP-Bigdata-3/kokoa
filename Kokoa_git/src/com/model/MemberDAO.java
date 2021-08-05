package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.MemberDTO;

public class MemberDAO {
   Connection conn = null;
   PreparedStatement psmt = null;
   int cnt = 0;
   ResultSet rs = null;
   String dog_type = "";
   MemberDTO info = null;
   
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
   
   // 회원가입
   public int join(MemberDTO dto) {   
      try {
         conn();   // connect to DB
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
   //로그인
   public MemberDTO login(String getId, String getPw) {
      try {
         conn();   
         String sql = "select id,pw from k_member where id = ? and pw = ?";
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
   
   public MemberDTO sess(String getId) {
	      try {
	         conn();   
	         String sql = "select * from k_member where id = ?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, getId);
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
	            int mem_num = rs.getInt(1);
	            String id = rs.getString(2);
	            String nickname = rs.getString(3);
	            String pw = rs.getString(4);
	            String name = rs.getString(5);
	            int age = rs.getInt(6);
	            String gender = rs.getString(7);
	            String birth = rs.getString(8);
	            String addr = rs.getString(9);
	            String tel = rs.getString(10);
	            String email = rs.getString(11);
	            String intrd = rs.getString(12);
	            String dog_name = rs.getString(13);
	            int dog_age = rs.getInt(14);
	            String dog_gender = rs.getString(15);
	            String dog_pic = rs.getString(16);
	            int dog_num = rs.getInt(17);
	            String dog_size = rs.getString(18);
	            String dog_type = rs.getString(19);
	            
	            info = new MemberDTO(mem_num, id, nickname, pw, name, age, gender, birth, addr, tel, email, intrd, dog_name, dog_age, dog_gender, dog_pic, dog_num, dog_size, dog_type);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return info;
	   }
   
   public boolean idcheck(String inputid) {
         boolean check = false;
         try {
            conn();
            String sql ="select id from k_member where id=?";
            
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, inputid);
            rs = psmt.executeQuery();
            if(rs.next()) {
               check = true;
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            close();
         } return check;
     }

   public boolean nickcheck(String inputnickname) {
         boolean check = false;
         try {
            conn();
            String sql ="select nickname from k_member where nickname=?";
            
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, inputnickname);
            rs = psmt.executeQuery();
            if(rs.next()) {
               check = true;
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            close();
         } return check;
    }
   
   //회원정보수정
   public int update(MemberDTO dto) {
	   try {
	   conn();
	   String sql = "update k_member set nickname=?, pw=?, email=?, addr=?, tel=?, intrd=?, dog_name=?, dog_gender=?, dog_pic=? where id=?";
	   
	   psmt = conn.prepareStatement(sql);
	   
	   psmt.setString(1, dto.getNickname());
	   psmt.setString(2, dto.getPw());
	   psmt.setString(3, dto.getEmail());
	   psmt.setString(4, dto.getAddr());
	   psmt.setString(5, dto.getTel());
	   psmt.setString(6, dto.getIntrd());
	   psmt.setString(7, dto.getDog_name());
	   psmt.setString(8, dto.getDog_gender());
	   psmt.setString(9, dto.getDog_pic());
	   psmt.setString(10, dto.getId());
	   
	   cnt = psmt.executeUpdate();
	   
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   close();
	   } return cnt;
   }
   
   public ArrayList<MemberDTO> showMember(){
	  ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	  try {
		  conn();
		  String sql = "select * from k_member";
		  psmt = conn.prepareStatement(sql);
		  rs = psmt.executeQuery();
		  
		  while(rs.next()) {
			  String id = rs.getString("id");
			  String nickname = rs.getString("nickname");
			  String pw = rs.getString("pw");
			  String email = rs.getString("email");
			  String addr = rs.getString("addr");
			  String tel = rs.getString("tel");
			  String intrd = rs.getString("intrd");
			  String dog_name = rs.getString("dog_name");
			  String dog_gender = rs.getString("dog_gender");
			  String dog_pic = rs.getString("dog_pic");
			  
			  MemberDTO dto = new MemberDTO(id,nickname,pw,email,addr,tel,intrd,dog_name,dog_gender,dog_pic);
			  list.add(dto);
		  }
		  
	  } catch (SQLException e) {
		  e.printStackTrace();
	  }finally {
		  close();
	  }return list;
   }

}

