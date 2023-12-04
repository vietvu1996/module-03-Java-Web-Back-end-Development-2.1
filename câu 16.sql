select employee.id as 'Mã nhân viên',
employee.name as 'Tên nhân viên',
employee.email as 'Email nhân viên',
employee.phone_number as 'Số điện thoại',
count(contract.id) as 'Số hợp động'
from employee
left join contract on contract.id = employee.id and year(contract.start_date) between 2022 and 2023
group by employee.id
having count(contract.id) = 0;
-- Chuyển trạng thái is_delete của nhân viên (Soft delete)
set sql_safe_updates = 0;

update employee
set is_delete = 1
where id in (
    select id from (
        select employee.id
        from employee
        left join contract on contract.employee_id = employee.id and year(start_date) between 2022 and 2023
        group by employee.id
        having count(contract.id) = 0
    ) as tmp
); 