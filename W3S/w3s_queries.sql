show databases;
use mocdb;

select * 
from customer; 

select cust_name, cust_city 
from customer;

-- The SELECT DISTINCT statement is used to return only distinct (different/unique) values.

select distinct payment_amt 
from customer;

select count(distinct payment_amt) as 'count' 
from customer;

select * 
from customer
where grade=1;

select * 
from customer
where grade = 2 and cust_country= "India" and cust_city="Bangalore";

select * 
from customer
where not grade = 1 and cust_country = "India" or cust_city = "Bangaloe";

select *
from customer
where not cust_country = "India";

select * 
from customer
where not grade =1 and (cust_country = "India" and cust_city = "Bangaloe");

select * 
from customer
order by cust_code;

select * 
from customer
order by cust_code desc;

SELECT * FROM Customer
ORDER BY cust_Country, Cust_Name desc;

show tables;

select * from customer;

insert into customer
values ("C00027", "Digvijay","Manjarde", "Narhe", "INDIA", "1", "9000", "10000", "100000", "1000000", "9175535381", "A018");

SET SQL_SAFE_UPDATES = 0;

update customer
set cust_name = "Dipak" , Cust_city="Ambak", cust_country = "India"
where cust_code = "C00024";

update customer
set working_area = "Pune"
where working_area = "KOPARKHIRANE";

select * 
from customer
limit 3;

SELECT * FROM Customer
WHERE cust_Country='india'
order by cust_code
LIMIT 7;

select min(opening_amt) as min_amout
from customer;

select max(opening_amt) as max_amout
from customer;

select count(opening_amt) as count
from customer;

select avg(opening_amt) as avg_amout
from customer;

select sum(opening_amt) as sum_amout
from customer;

select count(cust_country) as india_count
from customer
where cust_country = "INDIA";

select min(opening_amt) as min_amout
from customer
where cust_country = "INDIA";

select max(opening_amt) as max_amout
from customer
where cust_country = "INDIA";

select * from customer;

-- LIKE Operator

/* 
LIKE Operator Description
WHERE CustomerName LIKE 'a%'    Finds any values that starts with "a"
WHERE CustomerName LIKE '%a'    Finds any values that ends with "a"
WHERE CustomerName LIKE '%or%'  Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'   Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%_%' Finds any values that starts with "a" and are at least 3 characters in length
WHERE ContactName LIKE  'a%o'   Finds any values that starts with "a" and ends with "o
*/


select * from customer
where cust_name like 'd%';

select * from customer
where cust_name like '%a';

select * from customer
where cust_name like '%d%';

select * from customer
where cust_name like '_a%';

select * from customer
where cust_name like 'a_%_%_%';

select * from customer
where cust_name like 'd%k';

select * from customer
where cust_name like '%di%';

SELECT * FROM Customer
WHERE cust_City not LIKE 'L_n_on';

SELECT * FROM Customer
WHERE cust_name LIKE 'd%' OR cust_name LIKE 'a%' OR cust_name LIKE 'c%';

-- in opeartor 
SELECT * FROM Customer
WHERE cust_name in ('bolt' ,'karl');

SELECT * FROM Customer
WHERE cust_country in ('uk','usa');

SELECT * FROM Customer
WHERE cust_country not in ('uk','usa');

select * from customer;

-- between opeartor

select * 
from customer
where OUTSTANDING_AMT between 2000 and 6000;

select * 
from customer
where OUTSTANDING_AMT not between 2000 and 6000;

select * from customer
where OUTSTANDING_AMT not between 2000 and 6000
order by OUTSTANDING_AMT;

select * from customer
where AGENT_CODE between "A003" and "A009";

-- BETWEEN With IN 
select * from customer
where grade between 1 and 2
and not cust_country in ('India');

select * from customer
where grade between 1 and 2
and cust_country in ('India');



