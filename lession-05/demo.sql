create database demo;
use demo;

create table product(
id int auto_increment primary key,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount double,
product_description varchar(50),
product_status bit
);

insert into product(id, product_code, product_name, product_price, product_amount, product_description, product_status)
values(1, "MH370", "Toy", 2000, 1500, "Worst", 0);

create UNIQUE INDEX code_of_product on product(product_code);

create INDEX composite_index on product(product_name, product_price);

EXPLAIN select * from product;

create view product_view as select product_code, product_name, product_price, product_status 
from product;

select * from product_view;

create or replace view product_view as select product_code, product_name, product_price, product_status
from product
where product_name = 'Hieu';

drop view product_view;

DELIMITER //
create procedure allProduct()
BEGIN
select * from product;
END // 
DELIMITER ;

call allProduct();

DELIMITER //
create procedure addProduct(
newId int, new_product_code varchar(50), new_product_name varchar(50), new_product_price double, new_product_amount double, new_product_description varchar(50), new_product_status bit
)
begin
insert into product 
values (newId, new_product_code, new_product_name, new_product_price, new_product_amount, new_product_description, new_product_status);
end //
DELIMITER ;

call addProduct(2, "BOEING747", "Hieu", 1500, 2000, "Normal", 0);

DELIMITER //
create procedure editProduct(newId int, new_product_code varchar(50), new_product_name varchar(50), 
new_product_price double, new_product_amount double, 
new_product_description varchar(50), new_product_status bit)
begin
update product set product.product_name = new_product_name,
product.product_price = new_product_price
where product.id = newId;
end //
delimiter ;

call editProduct(2,"BOEING747", "Viet", 3000, 2000, "Normal", 1);

DELIMITER // 
create procedure deleteProduct(newId int)
begin
delete from product where product.id = newId;
end //
delimiter ;

call deleteProduct(2);