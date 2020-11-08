use [D:\LEARN\WEB MYSELF\TEST_DOAN\DOAN\DOAN\APP_DATA\QLSP.MDF]
create table KhachHang(makh char(10) primary key, tenkh char(50), gmail char(50))
create table TaiKhoan(loaiuser int,makh char(10) references KhachHang, userLogin char(20),passLogin char(20))
create table Loai(maloai char(10) primary key, tenloai char(10))
create table SanPham(masp char(10) primary key, hinh char(100), tensp char(20), dongia money, maloai char(10) references Loai)
create table GioHang(maloai char(10) references Loai, masp char(10) references SanPham)
create table HoaDon(maloai char(10) references SanPham, diachi char(100), ghichu char(300),sodienthoai char(12))

drop table HoaDon
drop table GioHang
drop table SanPham
drop table Loai
drop table TaiKhoan
drop table KhachHang

insert into KhachHang values ('kh01', 'Tín','buiductin1999@gmail.com')
insert into TaiKhoan values (1, 'kh01', 'admin', 'admin')