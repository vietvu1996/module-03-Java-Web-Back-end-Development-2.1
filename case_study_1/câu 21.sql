create view v_nhan_vien as 
select * from employee
where employee.address = '%TP.Hồ Chí Minh' and id in (select employee_id from contract 
where contract.start_date = '2023-02-15');

select * from v_nhan_vien;