CREATE DATABASE phonestore;
USE phonestore;
create table roles
(
ROLE int not null,
NAMEROLE VARCHAR(20) not null,
primary key (ROLE)
) ;
create table accounts
(
ID INT auto_increment unique,
USERNAME  VARCHAR(20) not null ,
PASSWORD  VARCHAR(20) not null,
EMAIL VARCHAR(50) not null,
SDT VARCHAR(20) not null,
TIMESIGNIN timestamp not null,
NAME VARCHAR(20) not null,
ROLE int not null,
primary key (USERNAME),
FOREIGN KEY (ROLE) REFERENCES roles(ROLE)
) ;

create table loai
(
MALOAI  int not null,
TENLOAI  VARCHAR(20) not null,
primary key (MALOAI)
);

create table hang
(
MAHANG  int not null,
TENHANG  VARCHAR(20) not null,
primary key (MAHANG)
) ;
create table sanpham
(
MASP  int not null,
TENSP  VARCHAR(20) not null,
SL int not null,
MOTA VARCHAR(200),
MAHANG int not null,
MALOAI  int not null,
primary key (MASP),
FOREIGN KEY (MAHANG) REFERENCES hang(MAHANG),
FOREIGN KEY (MALOAI) REFERENCES loai(MALOAI)
) ;

select * from product;
insert into roles values(1,'admin');
insert into roles values(2,'customer');

insert into accounts values(null,'king','khoivo',"2017-06-15 09:34:21",'khoi',2);
insert into accounts values(null,'khoivo','admin',"2017-06-15 09:34:21",'Võ Anh Khôi',1);
