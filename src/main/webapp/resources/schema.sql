/* ezenplate_db 생성, ezenplate_user 생성 및 권한 부여 필요 */

create table member (
mno bigint auto_increment,
email varchar(100) not null,
pwd varchar(100) not null,
nick_name varchar(100) not null,
grade tinyint default '10',
review_count bigint default '0',
user_locate varchar(100) not null,
last_login datetime default null,
primary key(mno)
) default charset=utf8mb4 collate=utf8mb4_general_ci;

insert into member (email, pwd, nick_name, grade, user_locate) values ('admin@admin.com', '1111', 'ADMIN', 99, '서울');
insert into member (email, pwd, nick_name, grade, user_locate) values ('user1@user.com', '1234', 'USER1', 10, '경기');
insert into member (email, pwd, nick_name, grade, user_locate) values ('user2@user.com', '5678', 'USER2', 50, '인천');