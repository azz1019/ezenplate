/* ezenplate_db 생성, ezenplate_user 생성 및 권한 부여 필요 */

drop table member;
drop table review;
drop table store;
drop table attached_file;
drop table board;
drop table comment;
drop table want;
drop table visited;

create table member(
mno bigint not null auto_increment,
email varchar(100) not null,
pwd varchar(1000) not null,
nick_name varchar(100) not null,
grade tinyint default '10',
last_login datetime default null,
user_locate varchar(100) not null,
review_count int default '0',
primary key (mno)
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table review(
sno bigint not null,
rno bigint not null auto_increment,
title varchar(100) not null,
rate float,
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
content text,
report int default '0',
writer varchar(100) not null,
diff_time varchar(100),
primary key (rno)
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table store (
sno bigint not null auto_increment,
writer varchar(100),
sname varchar(100) not null,
category varchar(100) not null,
locate varchar(1000) not null,
tel varchar(100) not null,
content text,
menu_name1 varchar(100),
menu_name2 varchar(100),
menu_name3 varchar(100),
menu_name4 varchar(100),
menu_name5 varchar(100),
menu_price1 int,
menu_price2 int,
menu_price3 int,
menu_price4 int,
menu_price5 int,
holiday varchar(100),
rate_avg float,
approve int default '0',
read_count int default '0',
cmt_qty int default '0',
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
likes int default '0',
primary key(sno)
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table attached_file(
uuid varchar(256) primary key,
save_dir varchar(1000) not null,
file_name varchar(1000) not null,
file_type tinyint(1) default 0,
sno bigint,
rno bigint,
mno bigint,
bno bigint,
cno bigint,
file_size bigint not null,
reg_at datetime default current_timestamp
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table board(
bno bigint not null auto_increment,
user_locate varchar(100) not null,
bname varchar(100) not null,
content text,
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
writer varchar(100),
read_count int default '0',
cmt_qty int default '0',
primary key(bno)
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table comment(
cno bigint not null auto_increment,
bno bigint not null,
writer varchar(100) not null,
content text,
report int default '0',
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
primary key(cno)
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table want(
mno bigint not null,
sno bigint not null,
sname varchar(100) not null,
reg_at datetime default current_timestamp
) default charset=utf8mb4 collate=utf8mb4_general_ci;

create table visited(
mno bigint not null,
sno bigint not null,
sname varchar(100) not null,
reg_at datetime default current_timestamp
) default charset=utf8mb4 collate=utf8mb4_general_ci;

insert into member (email, pwd, nick_name, grade, user_locate) values ('admin@admin.com', '1111', 'ADMIN', 99, '서울');
insert into member (email, pwd, nick_name, grade, user_locate) values ('holic1@holic.com', '1111', 'HOLIC1', 50, '경기');
insert into member (email, pwd, nick_name, grade, user_locate) values ('holic2@holic.com', '2222', 'HOLIC2', 50, '강원');
insert into member (email, pwd, nick_name, grade, user_locate) values ('guest1@guest.com', '1111', 'GUEST1', 10, '서울');
insert into member (email, pwd, nick_name, grade, user_locate) values ('guest2@guest.com', '2222', 'GUEST2', 19, '충북');
