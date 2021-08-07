package com.model;

public class IndivisualChatDTO {
	private int mem_num;
	private int chatting_room_num;
	public IndivisualChatDTO(int mem_num, int chatting_room_num) {
		super();
		this.mem_num = mem_num;
		this.chatting_room_num = chatting_room_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getChatting_room_num() {
		return chatting_room_num;
	}
	public void setChatting_room_num(int chatting_room_num) {
		this.chatting_room_num = chatting_room_num;
	}
	
}
