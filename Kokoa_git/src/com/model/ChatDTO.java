package com.model;

public class ChatDTO {
	private int chat_num;
	private String id;
	private String content;
	private String day;

	public ChatDTO(int num, String id, String content, String day) {
		this.chat_num = num;
		this.id = id;
		this.content = content;
		this.day = day;
	}
	
	public int getChat_num() {
		return chat_num;
	}
	public void setNum(int num) {
		this.chat_num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
}
