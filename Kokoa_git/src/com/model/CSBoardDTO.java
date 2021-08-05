package com.model;

public class CSBoardDTO {
	
	
	private int cs_num;
	private String cs_title;
	private String cs_con;
	private String cs_pic;
	private String write_time;
	 
	public CSBoardDTO(String cs_title, String cs_con, String cs_pic) {
		super();
		this.cs_title = cs_title;
		this.cs_con = cs_con;
		this.cs_pic = cs_pic;
	}
	public CSBoardDTO(int cs_num, String cs_title, String cs_con, String cs_pic, String write_time) {
		super();
		this.cs_num = cs_num;
		this.cs_title = cs_title;
		this.cs_con = cs_con;
		this.cs_pic = cs_pic;
		this.write_time = write_time;
	}
	public CSBoardDTO(int cs_num) {
		super();
		this.cs_num = cs_num;
	}
	public String getcs_title() {
		return cs_title;
	}
	public void setcs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	public int getcs_num() {
		return cs_num;
	}
	public void setcs_num(int cs_num) {
		this.cs_num = cs_num;
	}

	public String getcs_con() {
		return cs_con;
	}
	public void setcs_con(String cs_con) {
		this.cs_con = cs_con;
	}

	public CSBoardDTO(String cs_title, String cs_con, String cs_pic, String write_time) {
		super();
		this.cs_title = cs_title;
		this.cs_con = cs_con;
		this.cs_pic = cs_pic;
		this.write_time = write_time;
	}
	public String getcs_pic() {
		return cs_pic;
	}
	public void setcs_pic(String cs_pic) {
		this.cs_pic = cs_pic;
	}
	public String getWrite_time() {
		return write_time;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}

}