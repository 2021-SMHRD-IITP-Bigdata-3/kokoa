package com.model;

public class MatchingDTO {
	private int chatting_room_num;
	private String chatting_room_title;
	private String gender;
	private String nickname;
	private String id;
	private String matching_date;
	private String dog_gender;
	private String dog_size;
	private int hour;
	private int minute;
	private int min_age;
	private int max_age;
	private String location;




	public MatchingDTO(int chatting_room_num, String chatting_room_title, String gender, String nickname, String id,
			String matching_date, String dog_gender, String dog_size, int hour, int minute, int min_age, int max_age, String location) {
		super();
		this.chatting_room_num = chatting_room_num;
		this.chatting_room_title = chatting_room_title;
		this.gender = gender;
		this.nickname = nickname;
		this.id = id;
		this.matching_date = matching_date;
		this.dog_gender = dog_gender;
		this.dog_size = dog_size;
		this.hour = hour;
		this.minute = minute;
		this.min_age = min_age;
		this.max_age = max_age;
		this.location = location;
	}


	public MatchingDTO(String chatting_room_title, String gender, String nickname, String id, int min_age, int max_age,
			String matching_date, int hour, int minute, String dog_gender, String dog_size, String location) {
		super();
		this.chatting_room_title = chatting_room_title;
		this.gender = gender;
		this.nickname = nickname;
		this.id = id;
		this.min_age = min_age;
		this.max_age = max_age;
		this.matching_date = matching_date;
		this.hour = hour;
		this.minute = minute;
		this.dog_gender = dog_gender;
		this.dog_size = dog_size;
		this.location = location;
	}


	public int getChatting_room_num() {
		return chatting_room_num;
	}


	public void setChatting_room_num(int chatting_room_num) {
		this.chatting_room_num = chatting_room_num;
	}


	public String getChatting_room_title() {
		return chatting_room_title;
	}


	public void setChatting_room_title(String chatting_room_title) {
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


	public int getMin_age() {
		return min_age;
	}


	public void setMin_age(int min_age) {
		this.min_age = min_age;
	}


	public int getMax_age() {
		return max_age;
	}


	public void setMax_age(int max_age) {
		this.max_age = max_age;
	}


	public int getHour() {
		return hour;
	}


	public void setHour(int hour) {
		this.hour = hour;
	}


	public int getMinute() {
		return minute;
	}


	public void setMinute(int minute) {
		this.minute = minute;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}

}

