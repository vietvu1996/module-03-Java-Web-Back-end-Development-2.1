DELIMITER //
create procedure sp_xoa_khach_hang(ma_khach_hang int)
begin 
delete from customer where customer.id = ma_khach_hang;
end //
DELIMITER ;

select * from customer;
call sp_xoa_khach_hang(20)