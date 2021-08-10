package com.model;

public class CourseDTO {
	private int course_num;
	private String tracking_time;
	private String id;
	private String nickname;


	public CourseDTO(String tracking_time, String id, String nickname) {
		super();
		this.tracking_time = tracking_time;
		this.id = id;
		this.nickname = nickname;
	}

	public CourseDTO(int course_num, String tracking_time, String id, String nickname) {
		super();
		this.course_num = course_num;
		this.tracking_time = tracking_time;
		this.id = id;
		this.nickname = nickname;
	}

	public int getCourse_num() {
		return course_num;
	}

	public void setCourse_num(int course_num) {
		this.course_num = course_num;
	}

	public String getTracking_time() {
		return tracking_time;
	}
	public void setTracking_time(String tracking_time) {
		this.tracking_time = tracking_time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
