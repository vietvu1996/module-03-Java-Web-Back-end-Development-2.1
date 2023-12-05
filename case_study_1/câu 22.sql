create view v_nhan_vien as 
select * from employee
where employee.address = '%TP.Hồ Chí Minh%' or id in (select employee_id from contract 
where contract.start_date = '2023-01-01');

update v_nhan_vien
set address = 'Phú Nhuận';

set sql_safe_updates = 0;


select * from v_nhan_vien;
select * from employee;
set sql_safe_updates = 1;