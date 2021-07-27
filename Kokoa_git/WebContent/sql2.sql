create table buyer(
	mem_num num(),
	id varchar2(),
	nickname varchar2(),
	product num()
)

create table seller(
	mem_num num(),
	id varchar2(),
	nickname varchar2(),
	product num()
)

create table flea_market(
	product_num num(),
	prodcut varchar2()
)

create table matching_host(
	mem_num num(),
	id varchar2(),
	nickname varchar2(),
	chatting_room_num num()
)

create table matching_part(
	mem_num num(),
	id varchar2(),
	nickname varchar2(),
	chatting_room_num num()
)

create table matching_chat_list(
	chatting_room_num num(),
	chatting_room_title varchar2()
)

create table matching_chat_ban_list(
	chatting_room_num(),
	id varchar2()
)