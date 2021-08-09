package com.model;

public class CommentDTO {
	private int comment_num;
	private int board_num;
	private String comment_con;
	private String id;
	private String write_time;
	
	public CommentDTO(String comment_con, String id, String write_time) {
		super();
		this.comment_con = comment_con;
		this.id = id;
		this.write_time = write_time;
	}
	public CommentDTO(int comment_num, int board_num, String comment_con, String id, String write_time) {
		super();
		this.comment_num = comment_num;
		this.board_num = board_num;
		this.comment_con = comment_con;
		this.id = id;
		this.write_time = write_time;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public CommentDTO(int board_num, String comment_con, String id) {
		super();
		this.board_num = board_num;
		this.comment_con = comment_con;
		this.id = id;
	}
	public CommentDTO(String comment_con, String id) {
		super();
		this.comment_con = comment_con;
		this.id = id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
}
