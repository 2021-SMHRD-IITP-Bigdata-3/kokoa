create table member (
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	pw varchar2(20) not null,
	name varchar2(10) not null,
	age number(4) not null,
	gender varchar2(4) not null,
	birth date not null,
	addr varchar2(100) not null,
	tel varchar2(20) not null,
	email varchar2(20),
	intrd varchar2(200),
	dog_name varchar2(20) not null,
	dog_age number4) not null,
	dog_gender varchar2(4) not null,
	dog_pic varchar2(100),
	dog_num number(20) not null,
	dog_size varchar2(4) not null,
	dog_type varchar2(30) not null
	
	constraint member_mem_num_pk primary key(mem_num),
	constraint member_id_pk primary key (id),
	constraint member_nickname_pk primary key (nickname),
	constraint member_nickname_pk primary key (nickname),
)




create table dog (
	dog_type varchar2(30)
	
	constraint dog_dog_type_pk primary key(dog_type)
)

create table block_list (
	ban_num number(10),
	mem_num number(8),
	b_mem_num number(8)
	
	constraint block_list_ban_num_pk primary key(ban_num)
)

create table sns (
	story_num number(15),
	dog_pic varchar2(100),
	story_con varchar2(200),
	story_pic varchar2(100),
	write_time date,
	likes number(20),
	id varchar2(20),
	nickname varchar2(20)
)

create table notice(
	write_num number(15),
	write_title varchar2(50),
	write_content varchar2(1000)
)
	
create table faq(
	write_num number(15),
	write_title varchar2(50),
	write_content varchar2(1000)
)

create table customer_service(
	write_num number(15),
	write_title varchar2(50),
	write_content varchar2(1000),
	write_date date,
	id varchar2(20),
	nickname varchar2(20)
)

create table report_list(
	report_number number(15),
	report_content varchar2(1000),
	report_date date,
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	r_mem_num number(8),
	r_nickname varchar2(20)
)

create table course_list(
	course_num number(15),
	tracking_image varchar2(100),
	tracking_time varchar2(20),
	id varchar2(20),
	nickname varchar2(20)
)

create table course_review(
	course_latter_num number(15),
	course_num number(15),
	tracking_image varchar2(100),
	tracking_time varchar2(20),
	latter_title varchar2(50),
	latter_write varchar2(1000),
	id varchar2(20),
	nickname varchar2(20)
)


create table buyer(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product number(15)
)

create table seller(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product number(15)
)

create table flea_market(
	product_num number(15),
	prodcut varchar2(20)
)

create table matching_host(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(10)
)

create table matching_part(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(15)
)

create table matching_chat_list(
	chatting_room_num number(15),
	chatting_room_title varchar2(50)
)

create table matching_chat_ban_list(
	chatting_room_num number(15),
	id varchar2(20)
)
