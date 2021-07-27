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
	dog_type varchar2(30) not null,
	
	constraint member_mem_num_pk primary key(mem_num),
	constraint member_id_pk primary key (id),
	constraint member_nickname_pk primary key (nickname),
	constraint member_nickname_pk primary key (nickname)
)




create table dog (
	dog_type varchar2(30),
	
	constraint dog_dog_type_pk primary key(dog_type)
)

create table block_list (
	ban_num number(10),
	mem_num number(8),
	b_mem_num number(8),
	
	constraint block_list_ban_num_pk primary key(ban_num),
	constraint block_list_mem_num_fk foreign key(mem_num) references member(mem_num),
	constraint block_list_b_mem_num_fk foreign key(mem_num) references member(mem_num)
)

create table sns (
	story_num number(15),
	dog_pic varchar2(100) not null,
	story_con varchar2(200) not null,
	story_pic varchar2(100) not null,
	write_time date not null,
	likes number(20) not null,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint sns_story_num_pk primary key(story_num),
	constraint sns_id_fk foreign key(id) references member(id),
	constraint sns_nickname_fk foreign key(nickname) references member(nickname)
	
	
)

create table notice(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	
	constraint notice_write_num_pk primary key(write_num)
)
	
create table faq(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	
	constraint faq_write_num_pk primary key(write_num)
)

create table customer_service(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	write_date date,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint customer_write_num_pk primary key(write_num),
	constraint customer_service_id_fk foreign key(id) references member(id),
	constraint customer_service_nickname_fk foreign key(nickname) references member(nickname)
	
)

create table report_list(
	report_number number(15),
	report_content varchar2(1000) not null,
	report_date date,
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	r_mem_num number(8) not null,
	r_nickname varchar2(20) not null,
	
	constraint report_list_report_number_pk primary key(report_num),
	constraint report_list_mem_num_fk foreign key(mem_num) references member(mem_num),
	constraint report_list_id_fk foreign key(id) references member(id),
	constraint report_list_nickname_fk foreign key(nickname) references member(nickname)
)

create table course_list(
	course_num number(15),
	tracking_image varchar2(100) not null,
	tracking_time varchar2(20) not null,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint coure_list_course_num_pk primary key(course_num),
	constraint coure_list_id_fk foreign key(id) references member(id),
	constraint report_list_nickname_fk foreign key(nickname) references member(nickname)
)

create table course_review(
	course_latter_num number(15),
	course_num number(15) not null,
	tracking_image varchar2(100) not null,
	tracking_time varchar2(20) not null,
	latter_title varchar2(50) not null,
	latter_write varchar2(1000) not null,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint course_review_course_latter_num_pk primary key(course_latter_num),
	constraint course_review_id_fk foreign key(id) references member(id),
	constraint course_review_nickname_fk foreign key(nickname) references member(nickname)
)


create table buyer(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product number(15),
	constraint buyer_mem_num_fk foreign key(mem_num) references member(mem_num),
	constraint buyer_id_fk foreign key(id) references member(id),
	constraint buyer_nickname_fk foreign key(nickname) references member(nickname),
	constraint buyer_product_num_fk foreign key(product_num) references flea_market(product_num)
)

create table seller(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product number(15),
	constraint seller_mem_num_fk foreign key(mem_num) references member(mem_num),
	constraint seller_id_fk foreign key(id) references member(id),
	constraint seller_nickname_fk foreign key(nickname) references member(nickname),
	constraint seller_product_num_fk foreign key(product_num) references flea_market(product_num)
)

create table flea_market(
	product_num number(15),
	prodcut varchar2(20) not null,
	constraint flea_market_product_num_pk primary key(product_num)
)

create table matching_host(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(10),
	constraint matching_host_mem_num_fk foreign key(mem_num) references member(mem_num),
	constraint matching_host_id_fk foreign key(id) references member(id),
	constraint matching_host_nickname_fk foreign key(nickname) references member(nickname),
	constraint matching_host_chatting_room_num_fk foreign key(chatting_room_num) references matching_chat_list(chatting_room_num)
)

create table matching_part(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(15),
	constraint matching_part_mem_num_fk foreign key(mem_num) references member(mem_num),
	constraint matching_part_id_fk foreign key(id) references member(id),
	constraint matching_part_nickname_fk foreign key(nickname) references member(nickname),
	constraint matching_part_chatting_room_num_fk foreign key(chatting_room_num) references matching_chat_list(chatting_room_num)
)

create table matching_chat_list(
	chatting_room_num number(15),
	chatting_room_title varchar2(50) not null,
	constraint matching_chat_list_chatting_room_num_pk primary key(chatting_room_num)
)

create table matching_chat_ban_list(
	chatting_room_num number(15),
	id varchar2(20),
	constraint matching_chat_ban_list_chatting_room_num_fk foreign key(chatting_room_num) references matching_chat_list(chatting_room_num),
	constraint matching_chat_ban_list_id_fk foreign key(id) references member(id)
)

