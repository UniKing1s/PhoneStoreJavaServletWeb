CREATE DATABASE `phonestore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE phonestore;

create table account
(
ID INT auto_increment unique,
USERNAME  VARCHAR(20) not null ,
PASSWORD  VARCHAR(20) not null,
EMAIL VARCHAR(50) not null,
TIMESIGNIN timestamp not null,
NAME VARCHAR(20) not null,
ISADMIN int not null,
primary key (USERNAME)
);

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
MASP INT auto_increment unique,
TENSP VARCHAR(20) not null,
SL int not null,
DONGIA DOUBLE not null,
GIAMGIA DOUBLE,
TAG VARCHAR(20),
MOTA VARCHAR(200),
MAHANG int not null,
MALOAI  int not null,
IMGURL VARCHAR(50) not null,
IDPAP int not null,
primary key (MASP),
FOREIGN KEY (MAHANG) REFERENCES hang(MAHANG),
FOREIGN KEY (MALOAI) REFERENCES loai(MALOAI),
FOREIGN KEY (IDPAP) REFERENCES account(ID)
);
create table hoaDon
(
MAHD INT auto_increment unique,
IDACC int,
DIACHIKH VARCHAR(200),
SDT VARCHAR(15),
TONGTIEN DOUBLE,
primary key (MAHD),
FOREIGN KEY (IDACC) REFERENCES account(ID)
);

create table cthoadon
(
MAHD INT not null,
MASP int not null,
SL int not null,
DONGIA DOUBLE not null ,
TONGTIEN DOUBLE not null,

primary key (MAHD,MASP),
FOREIGN KEY (MAHD) REFERENCES hoadon(MAHD),
FOREIGN KEY (MASP) REFERENCES sanpham(MASP)
);

-- giá trị account
-- admins
insert into account values(null,'king','khoivo','khoivo050603it@gmail.com',"2017-06-15 09:34:21",'khoi',1);
-- customers
insert into account values(null,'kuro','khoivo','khoivo050603it@gmail.com',"2017-06-15 09:34:21",'khoi',2);


-- giá trị hãng
insert into hang values(1,'iPhone');
insert into hang values(2,'SAMSUNG');
insert into hang values(3,'XIAOMI');
insert into hang values(4,'VIVO');
insert into hang values(5,'realme');

insert into hang values(6,'Nokia');
insert into hang values(7,'itel');
insert into hang values(8,'modell');

-- giá trị loại
insert into loai values(1,'Điện Thoại Cảm Ứng');
insert into loai values(2,'Điện Thoại Phím Bấm');

-- giá trị sản phẩm
insert into sanpham values(null,'Iphone 15',100,30000000,15,'Best seller','Iphone 15 vừa mới được ra mắt',1,1,'i15.jpg',1);
insert into sanpham values(null,'Iphone 12',100,25000000,null,null,'Iphone 12 hàng vừa về',1,1,'i12.jpg',1);
-- tạo giá trị hóa đơn
insert into hoadon values(null,2,'32/6/13','0901672781',null);

-- giá trị chi tiết cho hóa đơn
insert into cthoadon values(1,1,1,330000000,330000000);


create table CardItem
(
ID int not null,
MASP int not null,
SLITEM int not null,
primary key (ID,MASP),
FOREIGN KEY (ID) REFERENCES account(ID),
FOREIGN KEY (MASP) REFERENCES sanpham(MASP)
);
-- tong tien = Giá sản phẩm *(1-(giamgia/100)) * số lượng(item.soluong)
-- giasp và giam gia lấy từ product bằng DBCrudProduct.GetProductByID(ID = MASP)


