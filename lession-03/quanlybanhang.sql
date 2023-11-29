create database quanlybanhang;
use quanlybanhang;

create table customer(
customer_id int auto_increment primary key,
name varchar(25),
customer_age tinyint
);

insert into customer(name, customer_age)
values("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

create table `order`(
order_id int auto_increment primary key,
order_date datetime,
order_total_price int,
customer_id int,
foreign key (customer_id) references customer(customer_id)
);

insert into `order`(order_date, order_total_price, customer_id)
values('2006-3-21', null, 1), 
('2006-3-23', null, 2),
('2006-3-16', null, 1);

create table product(
product_id int auto_increment primary key,
product_name varchar(25),
product_price int
);

insert into product(product_name, product_price)
values("May Giat", 3),
("Tu Lanh", 5),
("Dieu Hoa", 7),
("Quat", 1),
("Bep Dien", 2);

create table order_detail(
order_id int,
product_id int,
order_quantiy int,
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product (product_id)
);

insert into order_detail(order_id, product_id, order_quantiy)
values(7, 1, 3),
(8, 3, 7),
(7, 4, 2),
(8, 1, 1),
(9, 1, 8),
(8, 5, 4),
(8, 3, 3);

select order_id, order_date, order_total_price from `order`;

select customer.customer_id,customer.name, product.product_name
from customer
join `order` on `order`.customer_id = customer.customer_id
join order_detail on order_detail.order_id = `order`.order_id
join product on order_detail.product_id = product.product_id
group by customer_id,name, product.product_name;

select customer.customer_id, customer.name
from customer
where customer_id not in (select customer_id from `order`)
group by customer.customer_id, customer.name;

select `order`.order_id, `order`.order_date, sum(order_detail.order_quantiy * product.product_price) as gia_tien
from `order`
join order_detail on `order`.order_id = order_detail.order_id
join product on order_detail.product_id = product.product_id
group by `order`.order_id, `order`.order_date;