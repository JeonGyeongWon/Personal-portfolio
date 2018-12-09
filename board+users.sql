show tables;

desc tblsawon;


create table users(
no int(10) primary key auto_increment,
id varchar(10) not null unique,
pass varchar(10) not null,
name varchar(10) not null,
email varchar(20) not null,
phoneNumber varchar(20) not null,
pSSN int(6) not null,
aSSN int(7) not null)
ENGINE INNODB;

select * from users where id = 'java' and pw = 'java';

delete from users
where no =2;

select *
from users;

insert into users(id,pass,name,email,phoneNumber,pSSN,aSSN)
values('java','java','전경원','janue97@naver.com','01034530091',971205,1121313);

select *
from users;

drop table users;

create table board(
no int(10) primary key,
id varchar(10) not null,
subject varchar(100) not null,
content varchar(4000) not null,
count int(10) not null,
ip varchar(20) not null,
regdate date not null,
re_group int(10) not null,
re_seq int(10) not null,
depth int(10) not null,
bestCount int(10) not null,
constraint bo_id_fk foreign key(id) references users(id)
)ENGINE INNODB;

show create table users;

show variables like 'have_innodb';

show status like '%innodb%';

use jspbeginner;

create table product(
no int(10) primary key auto_increment,
name varchar(20) unique not null,
price int(10) not null,
stock int(10)not null,
image varchar(15),
bestCount int(10) not null,
sale int(2),
pa_category varchar(10) check(pa_category in('sports','food','fasion','home','car')),
ch_category int(1) check(ch_category in(1,2,3,4,5))
)ENGINE INNODB;

create table buyer(
id varchar(10) primary key,
total_price int(20) not null,
product varchar(20) not null,
qty int(4) not null,
constraint bu_pro_fk foreign key(product) references product(name),
constraint bu_id_fk foreign key(id) references users(id)

)ENGINE INNODB;
