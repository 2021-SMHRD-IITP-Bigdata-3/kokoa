create table buyer(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product number(15),
	constraint buyer_mem_num foreign key references member(mem_num),
	constraint buyer_id foreign key references member(id),
	constraint buyer_nickname foreign key references member(nickname),
	constraint buyer_product primary key(product)
)

create table seller(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	product number(15),
	constraint seller_mem_num foreign key references member(mem_num),
	constraint seller_id foreign key references member(id),
	constraint seller_nickname foreign key references member(nickname),
	constraint seller_product primary key(product)
)

create table flea_market(
	product_num number(15),
	prodcut varchar2(20) not null,
	constraint flea_market_product_num primary key(product_num)
)

create table matching_host(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(10),
	constraint matching_host_mem_num foreign key references member(mem_num),
	constraint matching_host_id foreign key references member(id),
	constraint matching_host_nickname foreign key references member(nickname),
	constraint matching_host_chatting_room_num primary key(chatting_room_num)
)

create table matching_part(
	mem_num number(8),
	id varchar2(20),
	nickname varchar2(20),
	chatting_room_num number(15),
	constraint matching_part_mem_num foreign key references member(mem_num),
	constraint matching_part_id foreign key references member(id),
	constraint matching_part_nickname foreign key references member(nickname),
	constraint matching_part_chatting_room_num primary key(chatting_room_num)
)

create table matching_chat_list(
	chatting_room_num number(15),
	chatting_room_title varchar2(50) not null,
	constraint matching_chat_list_chatting_room_num_pk primary key(chatting_room_num)
)

create table matching_chat_ban_list(
	chatting_room_num number(15),
	id varchar2(20),
	constraint matching_chat_ban_list_chatting_romm_num_pk primary key(chatting_room_num number),
	constraint matching_chat_ban_list_id foreign key references member(id)
)
