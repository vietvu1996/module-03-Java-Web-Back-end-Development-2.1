select * from customer
where (2023 - year(date_of_birth) between 18 and 50) AND 
(address LIKE "%TP.Hồ Chí Minh" OR address LIKE "%Quảng Nam");