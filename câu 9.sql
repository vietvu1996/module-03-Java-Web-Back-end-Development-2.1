select month(contract.start_date),
count(distinct customer.id)
from customer
join contract on contract.customer_id = customer_id
where year(contract.start_date) = 2022
group by month(contract.start_date);