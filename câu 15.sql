SELECT employee.id, employee.name, education_degree.name, `position`.name, 
employee.phone_number, employee.address, count(contract.id) as 'số hợp đồng' from employee
join `position` on `position`.id = employee.position_id
join education_degree on education_degree.id = employee.education_degree_id
join contract on contract.employee_id = employee.id
where year(contract.start_date) between 2022 and 2023 
group by employee.id
having count(contract.id) <= 3;