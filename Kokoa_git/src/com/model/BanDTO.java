package com.model;

public class BanDTO {
	private int ban_num;
	private int ban_mem_num;
	private String ban_id;
	private String block_date;
	public BanDTO(int ban_mem_num, String ban_id) {
		super();
		this.ban_mem_num = ban_mem_num;
		this.ban_id = ban_id;
	}
	public BanDTO(int ban_num, int ban_mem_num, String ban_id, String block_date) {
		super();
		this.ban_num = ban_num;
		this.ban_mem_num = ban_mem_num;
		this.ban_id = ban_id;
		this.block_date = block_date;
	}
	public int getBan_num() {
		return ban_num;
	}
	public void setBan_num(int ban_num) {
		this.ban_num = ban_num;
	}
	public int getBan_mem_num() {
		return ban_mem_num;
	}
	public void setBan_mem_num(int ban_mem_num) {
		this.ban_mem_num = ban_mem_num;
	}
	public String getBan_id() {
		return ban_id;
	}
	public void setBan_id(String ban_id) {
		this.ban_id = ban_id;
	}
	public String getBlock_date() {
		return block_date;
	}
	public void setBlock_date(String block_date) {
		this.block_date = block_date;
	}
	
}
