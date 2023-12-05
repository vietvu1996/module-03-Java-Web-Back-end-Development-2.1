create database case_study;
use case_study;

create table division (
id int primary key auto_increment,
name varchar(45),
is_delete bit(1) default 0
);

create table education_degree (
id int primary key auto_increment,
name varchar(45),
is_delete bit(1) default 0
);

create table `position` (
id int primary key auto_increment,
name varchar(45),
is_delete bit(1) default 0
);

create table user(
user_name varchar(255) primary key,
password varchar(255),
is_delete bit(1)
);

create table role (
role_id int primary key auto_increment,
role_name varchar(255),
is_delete bit(1) default 0
);

create table user_role(
role_id int,
user_name varchar(255),
is_delete bit(1) default 0,
primary key (role_id, user_name),
foreign key (role_id) references role(role_id),
foreign key (user_name) references user(user_name)
);

create table employee(
id int primary key auto_increment,
name varchar(50) not null,
date_of_birth varchar(50) not null,
id_card varchar(12) not null,
salary double not null,
phone_number varchar(12) not null,
email varchar(45),
address varchar(50),
position_id int,
education_degree_id int,
division_id int,
user_name varchar(255),
is_delete bit(1),
foreign key(position_id) references `position`(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id),
foreign key(user_name) references user(user_name)
);

create table customer_type(
id int primary key auto_increment,
name varchar(50),
is_delete bit(1) default 0
);

create table customer(
id int primary key auto_increment,
customer_type_id int,
foreign key(customer_type_id) references customer_type(id),
name varchar(50) not null,
gender bit(1) not null,
date_of_birth varchar(50) not null,
id_card varchar(12) not null,
phone_number varchar(12) not null,
email varchar(45),
address varchar(50),
is_delete bit(1)
);

create table facility_type(
id int primary key auto_increment,
name varchar(45),
is_delete bit(1) default 0
);

create table rent_type(
id int primary key auto_increment,
name varchar(50),
is_delete bit(1) default 0
);

create table facility(
id int primary key auto_increment,
name varchar(50) not null,
area int,
cost double,
max_people int,
rent_type_id int,
facility_type_id int,
foreign key(rent_type_id) references rent_type(id),
foreign key(facility_type_id) references facility_type(id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
is_delete bit(1)
);


create table contract(
id int primary key auto_increment,
start_date datetime not null,
end_date datetime not null,
deposit double not null,
employee_id int,
customer_id int,
facility_id int,
is_delete bit(1),
foreign key(employee_id) references employee(id),
foreign key(customer_id) references customer(id),
foreign key(facility_id) references facility(id)
);

create table attach_facility(
id int primary key auto_increment,
name varchar(45) not null,
cost double not null,
unit varchar(10) not null,
status varchar(45),
is_delete bit(1)
);

create table contract_detail(
id int primary key auto_increment,
contract_id int,
attach_facility_id int,
foreign key(contract_id) references contract(id),
foreign key(attach_facility_id) references attach_facility(id),
quantity int not null,
is_delete bit(1)
);

insert into division(name)
values ('lễ tân'),
('phục vụ'),
('chuyên viên'),
('giám sát'),
('quản lý'),
('giám đốc');

insert into education_degree(name) values
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

insert into `position`(name) values
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

-- Khởi tạo 10 user với tên người Việt Nam và mật khẩu theo regex
INSERT INTO user (user_name, password, is_delete)
VALUES
('nguyen_van_an', 'Password1', 0),
('tran_thi_bao', 'Pass123word', 0),
('le_thi_hoa', 'securePWD', 0),
('pham_thi_dung', 'StrongPass123', 0),
('dang_xuan_cuong', 'P@ssword123', 0),
('vu_thi_hong', 'p@ssword', 0),
('hoang_xuan_dai', 'Password2023', 0),
('truong_thi_van', 'SecurePwd123', 0),
('nguyen_xuan_duc', 'UserPwd789', 0),
('pham_thi_thu', 'MyPassword', 0);

-- Khởi tạo 2 role: 'admin' và 'employee'
INSERT INTO role (role_name, is_delete)
VALUES
('admin', 0),
('employee', 0);

-- Khởi tạo 10 user_role với user và role tương ứng
INSERT INTO user_role (user_name, role_id, is_delete)
VALUES
('nguyen_van_an', 1, 0),
('tran_thi_bao', 2, 0),
('le_thi_hoa', 1, 0),
('pham_thi_dung', 2, 0),
('dang_xuan_cuong', 1, 0),
('vu_thi_hong', 2, 0),
('hoang_xuan_dai', 1, 0),
('truong_thi_van', 2, 0),
('nguyen_xuan_duc', 1, 0),
('pham_thi_thu', 2, 0);

-- thêm bảng employee
INSERT INTO employee (
    name,
    date_of_birth,
    id_card,
    salary,
    phone_number,
    email,
    address,
    position_id,
    education_degree_id,
    division_id,
    user_name,
    is_delete
) VALUES
('Nguyễn Văn An', '1990-01-01', '123456789', 10000000, '0123456789', 'nguyenvanan@example.com', 'Sài Gòn, Việt Nam', 1, 3, 1, 'nguyen_van_an', 0),
('Trần Thị Bảo', '1988-05-15', '987654321', 12000000, '0987654321', 'tran_thi_bao@example.com', 'Quảng Nam, Việt Nam', 2, 4, 2, 'tran_thi_bao', 0),
('Lê Thị Hoa', '1992-07-20', '456789012', 8000000, '0112233445', 'le_thi_hoa@example.com', 'Hà Nội, Việt Nam', 3, 2, 3, 'le_thi_hoa', 0),
('Phạm Thị Dung', '1995-03-10', '567890123', 15000000, '0345678901', 'pham_thi_dung@example.com', 'Đà Nẵng, Việt Nam', 4, 3, 4, 'pham_thi_dung', 0),
('Đặng Xuân Cường', '1985-12-25', '345678901', 11000000, '0567890123', 'dang_xuan_cuong@example.com', 'Nha Trang, Việt Nam', 1, 4, 5, 'dang_xuan_cuong', 0),
('Vũ Thị Hồng', '1993-09-05', '234567890', 9000000, '0678901234', 'vu_thi_hong@example.com', 'Huế, Việt Nam', 2, 3, 2, 'vu_thi_hong', 0),
('Hoàng Xuân Đại', '1987-04-02', '123456789', 13000000, '0789012345', 'hoang_xuan_dai@example.com', 'Hồ Chí Minh, Việt Nam', 3, 2, 3, 'hoang_xuan_dai', 0),
('Trương Thị Vân', '1991-06-15', '987654321', 9500000, '0890123456', 'truong_thi_van@example.com', 'Sài Gòn, Việt Nam', 4, 1, 4, 'truong_thi_van', 0),
('Nguyễn Xuân Đức', '1989-08-20', '456789012', 14000000, '0901234567', 'nguyen_xuan_duc@example.com', 'Đà Lạt, Việt Nam', 1, 3, 5, 'nguyen_xuan_duc', 0),
('Phạm Thị Thu', '1994-11-30', '567890123', 10000000, '0123456789', 'pham_thi_thu@example.com', 'Quảng Ngãi, Việt Nam', 2, 4, 2, 'pham_thi_thu', 0);

-- thêm dữ liệu cho bảng customer_type
insert into customer_type(name) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

-- thêm dữ liệu cho bảng customer
INSERT INTO customer (
    customer_type_id,
    name,
    gender,
    date_of_birth,
    id_card,
    phone_number,
    email,
    address,
    is_delete
) VALUES
(1, 'Ngọc Trinh', 0, '1990-01-01', '123456789012', '0987654321', 'ngoc.trinh@example.com', '123 Nguyễn Huệ, Quận 1, TP.Hồ Chí Minh', 0),
(2, 'Quốc Anh', 1, '1988-05-15', '987654321012', '0123456789', 'quoc.anh@example.com', '456 Đống Đa, Quảng Nam', 0),
(3, 'Hồng Nhung', 0, '1992-07-20', '456789012345', '0234567890', 'hong.nhung@example.com', '789 Hoàn Kiếm, Hà Nội', 0),
(4, 'Văn Hùng', 1, '1995-03-10', '567890123456', '0345678901', 'van.hung@example.com', '101 Đà Nẵng, Đà Nẵng', 0),
(5, 'Linh Dương', 1, '1985-12-25', '345678901234', '0567890123', 'linh.duong@example.com', '202 Hòa Khánh, Nha Trang', 0),
(1, 'Thùy Trâm', 0, '1993-09-05', '234567890123', '0678901234', 'thuy.tram@example.com', '303 Huế, Huế', 0),
(2, 'Minh Đại', 1, '1987-04-02', '123456789012', '0789012345', 'minh.dai@example.com', '404 Quận 5, TP.Hồ Chí Minh', 0),
(3, 'Hải Yến', 0, '1991-06-15', '987654321012', '0890123456', 'hai.yen@example.com', '505 Cần Thơ, Cần Thơ', 0),
(4, 'Tuấn Đức', 1, '1989-08-20', '456789012345', '0901234567', 'tuan.duc@example.com', '606 Đà Lạt, Lâm Đồng', 0),
(5, 'Phương Thư', 0, '1994-11-30', '567890123456', '0123456789', 'phuong.thu@example.com', '707 Quảng Ngãi, Quảng Ngãi', 0);

-- thêm dữ liệu cho bảng rent_type
insert into rent_type(name) values
('Năm'),
('Tháng'),
('Ngày'),
('Giờ');

-- thêm dữ liệu cho bảng facility_type
insert into facility_type(name) values
('Villa'),
('House'),
('Room');

-- thêm dữ liệu cho bảng facility 
INSERT INTO facility (
    name,
    area,
    cost,
    max_people,
    rent_type_id,
    facility_type_id,
    standard_room,
    description_other_convenience,
    pool_area,
    number_of_floors,
    facility_free,
    is_delete
) VALUES
('Villa A', 150, 10000000, 10, 1, 1, 'Luxury', 'Private garden, BBQ area', 50, 2, 'WiFi, Breakfast', 0),
('House B', 100, 8000000, 8, 2, 1, 'Standard', 'Kitchen, Terrace', 0, 1, 'Cleaning service', 0),
('Room C', 30, 2000000, 2, 3, 2, 'Basic', 'Shared bathroom', 0, 3, 'TV, Air conditioning', 0),
('Villa D', 200, 15000000, 12, 1, 1, 'Deluxe', 'Private pool, Ocean view', 80, 3, 'WiFi, Breakfast, Spa', 0),
('House E', 120, 6000000, 6, 2, 1, 'Superior', 'Balcony, Garden view', 0, 2, 'Bicycle rental', 0),
('Room F', 40, 2500000, 3, 3, 2, 'Economy', 'Ensuite bathroom', 0, 4, 'Parking, 24/7 reception', 0),
('Villa G', 180, 12000000, 10, 1, 1, 'Premium', 'Private cinema, Gym', 60, 2, 'WiFi, Breakfast, Shuttle service', 0),
('House H', 90, 7000000, 7, 2, 1, 'Executive', 'Roof terrace, Sauna', 0, 1, 'Laundry service', 0),
('Room I', 35, 2300000, 2, 3, 2, 'Standard', 'Mini bar, Mountain view', 0, 3, 'WiFi, Breakfast', 0),
('Villa J', 220, 18000000, 15, 1, 1, 'Luxury', 'Private beach, Helipad', 100, 3, 'WiFi, Breakfast, Spa, Private chef', 0);

-- Thêm dữ liệu vào bảng attach_facility
INSERT INTO attach_facility (name, cost, unit, status, is_delete) VALUES
('Massage Service', 500000, 'hour', 'Available', 0),
('Karaoke Service', 300000, 'hour', 'Not Available', 0),
('Food Service', 200000, 'meal', 'Available', 0),
('Beverage Service', 100000, 'drink', 'Available', 0),
('Tour Shuttle Service', 800000, 'day', 'Available', 0);

-- Thêm dữ liệu vào bảng contract
INSERT INTO contract (
    start_date,
    end_date,
    deposit,
    employee_id,
    customer_id,
    facility_id,
    is_delete
) VALUES
('2022-01-01', '2022-01-10', 5000000, 1, 1, 1, 0),
('2022-02-15', '2022-03-01', 6000000, 2, 2, 2, 0),
('2022-03-10', '2022-03-20', 4500000, 3, 3, 3, 0),
('2022-04-05', '2022-04-15', 7000000, 4, 4, 4, 0),
('2022-05-20', '2022-06-01', 8000000, 5, 5, 5, 0),
('2023-01-01', '2023-01-10', 5000000, 1, 1, 1, 0),
('2023-01-01', '2023-01-10', 5000000, 1, 1, 1, 0),
('2023-02-15', '2023-03-01', 6000000, 2, 2, 2, 0),
('2023-03-10', '2023-03-20', 4500000, 3, 3, 3, 0),
('2023-04-05', '2023-04-15', 7000000, 4, 4, 4, 0),
('2023-02-15', '2023-03-01', 6000000, 2, 2, 2, 0),
('2023-03-10', '2023-03-20', 4500000, 3, 3, 3, 0),
('2023-04-05', '2023-04-15', 7000000, 4, 4, 4, 0),
('2023-05-20', '2023-06-01', 8000000, 5, 5, 5, 0);

select * from contract;

-- Thêm dữ liệu vào bảng contract_detail
INSERT INTO contract_detail (
    contract_id,
    attach_facility_id,
    quantity,
    is_delete
) VALUES
(1, 1, 2, 0),
(2, 2, 1, 0),
(3, 3, 3, 0),
(4, 4, 2, 0),
(5, 5, 1, 0),
(6, 1, 2, 0),
(7, 2, 1, 0),
(8, 3, 3, 0),
(9, 4, 2, 0),
(10, 5, 1, 0),
(11, 1, 2, 0),
(12, 2, 1, 0),
(13, 3, 3, 0),
(14, 4, 2, 0);

