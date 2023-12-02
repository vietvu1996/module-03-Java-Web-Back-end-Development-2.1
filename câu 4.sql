select customer.name, customer_type.name, count(contract.id) as bookingtimes from customer
join customer_type on customer.customer_type_id = customer_type.id
join contract on contract.customer_id = customer.id
where customer_type.name = "Diamond"
group by customer.id, customer_type.name
order by bookingtimes;