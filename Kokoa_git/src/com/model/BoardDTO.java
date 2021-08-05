package com.model;

public class BoardDTO {
	
	
	private int story_num;
	private String Story_title;
	private String story_con;
	private String story_pic;
	private String write_time;
	
	public BoardDTO(String story_title, String story_con, String story_pic) {
		super();
		Story_title = story_title;
		this.story_con = story_con;
		this.story_pic = story_pic;
	}
	public BoardDTO(int story_num, String story_title, String story_con, String story_pic, String write_time) {
		super();
		this.story_num = story_num;
		this.Story_title = story_title;
		this.story_con = story_con;
		this.story_pic = story_pic;
		this.write_time = write_time;
	}
	public BoardDTO(int story_num) {
		super();
		this.story_num = story_num;
	}
	public String getStory_title() {
		return Story_title;
	}
	public void setStory_title(String story_title) {
		Story_title = story_title;
	}
	public int getStory_num() {
		return story_num;
	}
	public void setStory_num(int story_num) {
		this.story_num = story_num;
	}

	public String getStory_con() {
		return story_con;
	}
	public void setStory_con(String story_con) {
		this.story_con = story_con;
	}

	public BoardDTO(String story_title, String story_con, String story_pic, String write_time) {
		super();
		this.Story_title = story_title;
		this.story_con = story_con;
		this.story_pic = story_pic;
		this.write_time = write_time;
	}
	public String getStory_pic() {
		return story_pic;
	}
	public void setStory_pic(String story_pic) {
		this.story_pic = story_pic;
	}
	public String getWrite_time() {
		return write_time;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}

}