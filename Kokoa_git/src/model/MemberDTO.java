package model;

public class MemberDTO {
	
	private int mem_num;
	private String nickname;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String birth;
	private String address;
	private String tel;
	private String email;
	private String intro;
	private String dog_name;
	private int dog_age;
	private String dog_gender;
	private String dog_picture;
	private int dog_num;
	private String dog_size;
	private String dog_type;

	public MemberDTO(int mem_num, String id, String nickname, String pw, String name, int age, String gender,
			String birth, String address, String tel, String email, String intro, String dog_name, int dog_age,
			String dog_gender, String dog_picture, int dog_num, String dog_size, String dog_type) {
		super();
		this.mem_num = mem_num;
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.birth = birth;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.intro = intro;
		this.dog_name = dog_name;
		this.dog_age = dog_age;
		this.dog_gender = dog_gender;
		this.dog_picture = dog_picture;
		this.dog_num = dog_num;
		this.dog_size = dog_size;
		this.dog_type = dog_type;
	}
	
	private String id;
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getDog_name() {
		return dog_name;
	}
	public void setDog_name(String dog_name) {
		this.dog_name = dog_name;
	}
	public int getDog_age() {
		return dog_age;
	}
	public void setDog_age(int dog_age) {
		this.dog_age = dog_age;
	}
	public String getDog_gender() {
		return dog_gender;
	}
	public void setDog_gender(String dog_gender) {
		this.dog_gender = dog_gender;
	}
	public String getDog_picture() {
		return dog_picture;
	}
	public void setDog_picture(String dog_picture) {
		this.dog_picture = dog_picture;
	}
	public int getDog_num() {
		return dog_num;
	}
	public void setDog_num(int dog_num) {
		this.dog_num = dog_num;
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
