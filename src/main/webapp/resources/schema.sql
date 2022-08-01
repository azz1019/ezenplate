/* ezenplate_db 생성, ezenplate_user 생성 및 권한 부여 필요 */

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
) default CHARSET=utf8mb4;

create table review(
sno bigint not null,
rno bigint not null auto_increment,
rate float,
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
content text,
report int default '0',
writer varchar(100) not null,
primary key (rno)
) default CHARSET=utf8mb4;

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
) default CHARSET=utf8mb4;

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
) default CHARSET=utf8mb4;

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
) default CHARSET=utf8mb4;

create table comment(
cno bigint not null auto_increment,
bno bigint not null,
writer varchar(100) not null,
content text,
report int default '0',
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
primary key(cno)
) default CHARSET=utf8mb4;

create table want(
mno bigint not null,
sno bigint not null,
reg_at datetime default current_timestamp
) default CHARSET=utf8mb4;

create table visited(
mno bigint not null,
sno bigint not null,
reg_at datetime default current_timestamp
) default CHARSET=utf8mb4;

insert into member (email, pwd, nick_name, grade, user_locate) values ('admin@admin.com', '1111', 'ADMIN', 99, '서울');
insert into member (email, pwd, nick_name, grade, user_locate) values ('user1@user.com', '1234', 'USER1', 10, '경기');
insert into member (email, pwd, nick_name, grade, user_locate) values ('user2@user.com', '5678', 'USER2', 50, '인천');
