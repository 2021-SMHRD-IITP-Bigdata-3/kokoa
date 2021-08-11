package com.model;

public class PCommentDTO {
	private int comment_num;
	private int product_num_1;
	private String comment_con;
	private String id;
	private String write_time;
	
	public PCommentDTO(String comment_con, String id) {
		super();
		this.comment_con = comment_con;
		this.id = id;
	}
	public PCommentDTO(int product_num_1, String comment_con, String id) {
		super();
		this.product_num_1 = product_num_1;
		this.comment_con = comment_con;
		this.id = id;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getProduct_num_1() {
		return product_num_1;
	}
	public void setProduct_num_1(int product_num_1) {
		this.product_num_1 = product_num_1;
	}
	public String getComment_con() {
		return comment_con;
	}
	public void setComment_con(String comment_con) {
		this.comment_con = comment_con;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWrite_time() {
		return write_time;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}
	public PCommentDTO(int comment_num, int product_num_1, String comment_con, String id, String write_time) {
		super();
		this.comment_num = comment_num;
		this.product_num_1 = product_num_1;
		this.comment_con = comment_con;
		this.id = id;
		this.write_time = write_time;
	}
	public PCommentDTO(String comment_con, String id, String write_time) {
		super();
		this.comment_con = comment_con;
		this.id = id;
		this.write_time = write_time;
	}
	

}
