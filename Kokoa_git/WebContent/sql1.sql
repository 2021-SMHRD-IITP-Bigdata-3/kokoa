
create table notice(
	write_num num(100),
	write_title varchar2(100),
	write_content varchar2(100)
)
	
create table faq(
	write_num num(100),
	write_title varchar2(100),
	write_content varchar2(100)
)

create table customer_service(
	write_num num(100),
	write_title varchar2(100),
	write_content varchar2(100),
	write_date varchar2(100),
	id varchar2(100),
	nickname varchar2(100)
)

create table report_list(
	report_number num(100),
	report_content varchar2(100),
	report_date varchar2(100),
	mem_num num(100),
	id varchar2(100),
	nickname varchar2(100),
	r_mem_num num(100),
	r_nickname varchar2(100)
)

create table course_list(
	course_num num(100),
	tracking_image varchar2(100),
	tracking_time varchar2(100),
	id varchar2(100),
	nickname varchar2(100)
)

create table course_review(
	course_latter_num num(100),
	course_num num(100),
	tracking_image varchar2(100),
	tracking_time varchar2(100),
	latter_title varchar2(100),
	latter_write varchar2(100),
	id varchar2(100),
	nickname varchar2(100)
)

