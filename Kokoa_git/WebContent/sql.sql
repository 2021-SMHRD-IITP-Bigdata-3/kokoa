
create table k_member(
	mem_num number(8),
	id varchar2(20) not null unique,
	nickname varchar2(20) not null unique,
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
	dog_age number(4) not null,
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

insert into k_member(mem_num) values(mem_num_seq.nextval);

create table dog (
	dog_type varchar2(30),
	constraint dog_dog_type_pk primary key(dog_type)
)
	
create table block_list(
	ban_num number(10),
	mem_num number(8),
	b_mem_num number(8),
	constraint block_list_ban_num_pk primary key(ban_num),
	constraint block_list_mem_num_fk foreign key(mem_num) references k_member(mem_num),
	constraint block_list_b_mem_num_fk foreign key(b_mem_num) references k_member(mem_num)
)

create sequence ban_num_seq
increment by 1
start with 1

insert into block_list(ban_num) values(block_num_seq.nextval)


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
	constraint sns_id_fk foreign key(id) references k_member(id),
	constraint sns_nickname_fk foreign key(nickname) references k_member(nickname)
	
)

create sequence story_num_seq
increment by 1
start with 1

insert into sns(story_num) values(story_num_seq.nextval);


create table notice(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	
	constraint notice_write_num_pk primary key(write_num)
)

create sequence notice_seq
increment by 1
start with 1

insert into notice(write_num) values(notice_seq.nextval);
	
	
create table faq(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	
	constraint faq_write_num_pk primary key(write_num)
)

create sequence faq_seq
increment by 1
start with 1

insert into faq(write_num) values(faq_seq.nextval)

create table customer_service(
	write_num number(15),
	write_title varchar2(50) not null,
	write_content varchar2(1000) not null,
	write_date date,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint customer_write_num_pk primary key(write_num),
	constraint customer_service_id_fk foreign key(id) references k_member(id),
	constraint customer_service_nickname_fk foreign key(nickname) references k_member(nickname)
	
)
create sequence customer_seq
increment by 1
start with 1

insert into customer_service(write_num) values(customer_seq.nextval)


create table report_list(
	report_num number(15),
	report_content varchar2(1000) not null,
	report_date date,
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	r_mem_num number(8) not null,
	r_nickname varchar2(20) not null,
	
	constraint report_list_report_number_pk primary key(report_num),
	constraint report_list_mem_num_fk foreign key(mem_num) references k_member(mem_num),
	constraint report_list_id_fk foreign key(id) references k_member(id),
	constraint report_list_nickname_fk foreign key(nickname) references k_member(nickname)
)
create sequence report_number_seq
increment by 1
start with 1

insert into report_list(report_number) values(report_number_seq.nextval);


create table course_list(
	course_num number(15),
	tracking_image varchar2(100) not null,
	tracking_time varchar2(20) not null,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint course_list_course_num_pk primary key(course_num),
	constraint course_list_id_fk foreign key(id) references k_member(id),
	constraint course_list_nickname_fk foreign key(nickname) references k_member(nickname)
)
create sequence course_num_seq
increment by 1
start with 1

insert into course_list(course_num) values(course_num_seq.nextval);


create table course_review(
	course_latter_num number(15),
	course_num number(15) not null,
	tracking_image varchar2(100) not null,
	tracking_time varchar2(20) not null,
	latter_title varchar2(50) not null,
	latter_write varchar2(1000) not null,
	id varchar2(20),
	nickname varchar2(20),
	
	constraint course_review_latter_num_pk primary key(course_latter_num),
	constraint course_review_id_fk foreign key(id) references k_member(id),
	constraint course_review_nickname_fk foreign key(nickname) references k_member(nickname)
)
create sequence course_latter_seq
increment by 1
start with 1

insert into course_review(course_latter_num) values(course_latter_seq.nextval);

create table buyer(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product_num number(15),
	constraint buyer_mem_num_fk foreign key(mem_num) references k_member(mem_num),
	constraint buyer_id_fk foreign key(id) references k_member(id),
	constraint buyer_nickname_fk foreign key(nickname) references k_member(nickname),
	constraint buyer_product_num_fk foreign key(product_num) references flea_market(product_num)
)


create table seller(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product_num number(15),
	constraint seller_mem_num_fk foreign key(mem_num) references k_member(mem_num),
	constraint seller_id_fk foreign key(id) references k_member(id),
	constraint seller_nickname_fk foreign key(nickname) references k_member(nickname),
	constraint seller_product_num_fk foreign key(product_num) references flea_market(product_num)
)


create table flea_market(
	product_num number(15),
	prodcut varchar2(20) not null,
	constraint flea_market_product_num_pk primary key(product_num)
)
create sequence product_num_seq
increment by 1
start with 1

insert into flea_market(product_num) values(product_num_seq.nextval);








drop table matching_host


create table matching_host(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(10),
	constraint matching_host_mem_num_fk foreign key(mem_num) references k_member(mem_num),
	constraint matching_host_id_fk foreign key(id) references k_member(id),
	constraint matching_host_nickname_fk foreign key(nickname) references k_member(nickname),
	constraint matching_host_chatting_fk foreign key(chatting_room_num) references matching_chat_list(chatting_room_num)
)



create table matching_part(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(15),
	constraint matching_part_mem_num_fk foreign key(mem_num) references k_member(mem_num),
	constraint matching_part_id_fk foreign key(id) references k_member(id),
	constraint matching_part_nickname_fk foreign key(nickname) references k_member(nickname),
	constraint matching_part_chatting_fk foreign key(chatting_room_num) references matching_chat_list(chatting_room_num)
)











alter table matching_chat_list add (gender varchar2(10))
alter table matching_chat_list add (nickname varchar2(20))
alter table matching_chat_list add (id varchar2(20))
alter table matching_chat_list add (age varchar2(10))
alter table matching_chat_list add (matching_date date)
alter table matching_chat_list add (dog_gender varchar2(10))
alter table matching_chat_list add (dog_size varchar2(10))
alter table matching_chat_list add (dog_type varchar2(10))




select * from matching_chat_list







create table matching_chat_list(
	chatting_room_num number(15),
	chatting_room_title varchar2(50) not null,
	constraint matching_chat_list_chatting_pk primary key(chatting_room_num)
)

create sequence chat_num_seq
increment by 1
start with 1

insert into matching_chat_list(chatting_room_num) values(chat_num_seq.netxval)












create table matching_chat_ban_list(
	chatting_room_num number(15),
	id varchar2(20),
	constraint matching_chat_ban_list_chat_fk foreign key(chatting_room_num) references matching_chat_list(chatting_room_num),
	constraint matching_chat_ban_list_id_fk foreign key(id) references k_member(id)
)
create sequence ban_list_seq
increment by 1
start with 1

insert into matching_chat_ban_list(chatting_room_num) values(ban_list_seq.nextval);



drop table chat

create table chat(
	chat_num number(15),
	id varchar2(20),
	content varchar2(100),
	day date	
)

create sequence chat_list_seq
increment by 1
start with 1

select * from chat





select * from chattest


create table chattest(
	num number,
	member_id varchar(100),
	content varchar(200),
	day date);
	
	select * from chattest
	
	insert into chattest values('1','test','test', sysdate );

	
	
	-- 사용자 member
create table c_member(
	member_id varchar2(100), -- 아이디
	member_pw varchar2(100), -- 비밀번호
	member_name varchar2(100), -- 이름
	member_age number, -- 나이
	member_addr varchar2(100), -- 주소지
	member_plog_own char(20), -- 플로깅 참여 여부
	member_plog_count number, -- 플로깅 횟수
	constraint member_pk primary key (member_id)	
);

drop table c_member;

insert into c_member(member_id,member_pw,member_name,member_age,member_addr,member_plog_own,member_plog_count) values('test','test','test',1,'test','o',1);
insert into c_member(member_id,member_pw,member_name,member_age,member_addr,member_plog_own,member_plog_count) values('test1','test1','test1',1,'test','o',1);



select * from c_member
select * from chat