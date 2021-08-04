package com.model;

public class MatchingDTO {
	private int chatting_room_num;
	private int chatting_room_title;
	private String gender;
	private String nickname;
	private String id;
	private String age;
	private String matching_date;
	private String dog_gender;
	private String dog_size;
	private String dog_type;
	
	
	public MatchingDTO(int chatting_room_num, int chatting_room_title, String gender, String nickname, String id,
			String age, String matching_date, String dog_gender, String dog_size, String dog_type) {
		super();
		this.chatting_room_num = chatting_room_num;
		this.chatting_room_title = chatting_room_title;
		this.gender = gender;
		this.nickname = nickname;
		this.id = id;
		this.age = age;
		this.matching_date = matching_date;
		this.dog_gender = dog_gender;
		this.dog_size = dog_size;
		this.dog_type = dog_type;
	}


	public int getChatting_room_num() {
		return chatting_room_num;
	}


	public void setChatting_room_num(int chatting_room_num) {
		this.chatting_room_num = chatting_room_num;
	}


	public int getChatting_room_title() {
		return chatting_room_title;
	}


	public void setChatting_room_title(int chatting_room_title) {
		this.chatting_room_title = chatting_room_title;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getMatching_date() {
		return matching_date;
	}


	public void setMatching_date(String matching_date) {
		this.matching_date = matching_date;
	}


	public String getDog_gender() {
		return dog_gender;
	}


	public void setDog_gender(String dog_gender) {
		this.dog_gender = dog_gender;
	}


	public String getDog_size() {
		return dog_size;
	}


	public void setDog_size(String dog_size) {
		this.dog_size = dog_size;
	}


	public String getDog_type() {
		return dog_type;
	}


	public void setDog_type(String dog_type) {
		this.dog_type = dog_type;
	}


}

