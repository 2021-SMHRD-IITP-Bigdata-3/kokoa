package com.model;

public class PCommentDTO {
	private int comment_num;
	private int board_num;
	private String id;
	private String write_time;
	
	public PCommentDTO(String id, String write_time) {
		super();
		this.id = id;
		this.write_time = write_time;
	}
	public PCommentDTO(int comment_num, int board_num, String id, String write_time) {
		super();
		this.comment_num = comment_num;
		this.board_num = board_num;
		this.id = id;
		this.write_time = write_time;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public PCommentDTO(int board_num, String id) {
		super();
		this.board_num = board_num;
		this.id = id;
	}
	public PCommentDTO(String id) {
		super();
		this.id = id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
