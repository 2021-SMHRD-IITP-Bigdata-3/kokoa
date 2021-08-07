
create table k_member(
	mem_num number(10),
	id varchar2(20) not null unique,
	nickname varchar2(20) not null unique,
	pw varchar2(20) not null,
	name varchar2(10) not null,
	age number(10) not null,
	gender varchar2(10) not null,
	birth date not null,
	addr varchar2(100) not null,
	tel varchar2(20) not null,
	email varchar2(20),
	intrd varchar2(200),
	dog_name varchar2(20) not null,
	dog_age number(10) not null,
	dog_gender varchar2(10) not null,
	dog_pic varchar2(100),
	dog_num number(20) not null,
	dog_size varchar2(10) not null,
	dog_type varchar2(30) not null,
	constraint member_mem_num_pk primary key(mem_num)
)


create sequence mem_num_seq
increment by 1
start with 1
	

create table block_list(
	ban_num number(10),
	mem_num number(10),
	b_mem_num number(10),
	constraint block_list_ban_num_pk primary key(ban_num)
)


create sequence ban_num_seq
increment by 1
start with 1


create table sns (
	story_num number(10),
	story_title varchar2(100) not null,
	story_con varchar2(1000) not null,
	story_pic varchar2(100) not null,
	write_time date not null,
	
	constraint sns_story_num_pk primary key(story_num)
)

create sequence story_num_seq
increment by 1
start with 1


create table notice(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	
	constraint notice_write_num_pk primary key(write_num)
)


create sequence notice_seq
increment by 1
start with 1

	
create table faq(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	
	constraint faq_write_num_pk primary key(write_num)
)

create sequence faq_seq
increment by 1
start with 1


create table cs (
	cs_num number(10),
	cs_title varchar2(100) not null,
	cs_con varchar2(1000) not null,
	cs_pic varchar2(100) not null,
	write_time date not null,
	
	constraint cs_num_pk primary key(cs_num)
)


create sequence cs_num_seq
increment by 1
start with 1


create table report_list(
	report_num number(15),
	report_content varchar2(1000) not null,
	report_date date,
	mem_num number(10),
	id varchar2(20),
	nickname varchar2(20),
	r_mem_num number(10) not null,
	r_nickname varchar2(20) not null,
	
	constraint report_list_report_number_pk primary key(report_num)
)

create sequence report_number_seq
increment by 1
start with 1


create table course_list(
	course_num number(15),
	tracking_time varchar2(20) not null,
	tracking_distance varchar2(20),
	id varchar2(20),
	nickname varchar2(20),
	
	constraint course_list_course_num_pk primary key(course_num)
)


create sequence course_num_seq
increment by 1
start with 1


create table buyer(
	mem_num number(10),
	id varchar2(20),
	nickname varchar2(20),
	product_num number(15),
	constraint buyer_mem_num_fk foreign key(mem_num) references k_member(mem_num)
)


create table seller(
	mem_num number(10),
	id varchar2(20),
	nickname varchar2(20),
	product_num number(15),
	constraint seller_mem_num_fk foreign key(mem_num) references k_member(mem_num)
)


create table flea_market(
	product_num number(15),
	prodcut varchar2(20) not null,
	product_title varchar2(100) not null,
	product_con varchar2(1000) not null,
	product_pic varchar2(100) not null,
	product_price varchar2()
	constraint flea_market_product_num_pk primary key(product_num)
)


create sequence product_num_seq
increment by 1
start with 1


create table matching_chat_list(
	chatting_room_num number(15),
	chatting_room_title varchar2(50) not null,
	gender varchar2(20),
	nickname varchar2(20),
	id varchar2(20),
	matching_date varchar2(20),
	dog_gender varchar2(20),
	dog_size varchar2(20),
	hour number(10),
	minute number(10),
	min_age number(10),
	max_age number(10),
	
	constraint matching_chat_list_chatting_pk primary key(chatting_room_num)
)


create sequence chat_num_seq
increment by 1
start with 1



create table chat(
	chat_num number(15),
	id varchar2(20),
	content varchar2(100),
	day date	
)



create sequence chats_seq
increment by 1
start with 1



create table chattest(
	num number,
	member_id varchar(100),
	content varchar(200),
	day date);
	
	
select * from chattest
select * from chat


