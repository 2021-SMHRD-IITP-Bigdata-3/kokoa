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
