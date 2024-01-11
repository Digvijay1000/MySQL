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

-- alis 

select cust_code as "ID" , cust_name as "Name"
from customer;

select cust_name as CN, WORKING_AREA AS WA from customer;

select concat(cust_name, cust_city, working_area, cust_country) as Customer_Details
from customer;

select concat_ws(' - ',cust_name, cust_city, working_area, cust_country) as Customer_Details
from customer;

-- Alis for table example
/* Aliases can be useful when:
1. There are more than one table involved in a query
2. Functions are used in the query
3. Column names are big or not very readable
4. Two or more columns are combined together */

select * from customer;
select * from daysorder;

select c.cust_name, d.ord_date
from customer as c, daysorder as d;

select c.cust_name, d.ord_date
from customer as c, daysorder as d
where c.cust_name='Digvijay' and d.advance_amount = 1000;

-- SQL Joins
/* 
SYNTAX : 
SELECT column_name(s)
FROM table1
INNER JOIN table2 ON table1.column_name = table2.column_name;
*/


/* 
Here are the different types of the JOINs in SQL:
1. (INNER) JOIN: Returns records that have matching values in both tables
2. LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
3. RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
4. FULL (OUTER) JOIN: Return all records when there is a match in either left or right table 
*/

-- 1.(INNER) JOIN: Returns records that have matching values in both tables
select * from orders;
select * from customer;

select orders.ord_num, customer.cust_name, orders.ord_date
from orders
inner join customer on orders.cust_code = customer.cust_code;

select c.cust_name, o.ord_date, o.ord_amount
from orders as o
inner join customer as c on o.cust_code = c.cust_code;

select concat(c.cust_name, ' - ', c.cust_city, ' - ', c.working_area) as customer_details, d.ord_date, d.ord_amount
from daysorder as d
inner join customer as c on d.cust_code = c.cust_code;

-- 2. LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table

/*
SELECT column_name(s)
FROM table1
LEFT JOIN table2 ON table1.column_name = table2.column_name;
*/

select c.cust_name, d.ord_amount
from customer as c
left join daysorder as d on c.cust_code = d.cust_code;

select concat(c.cust_name, ' - ', c.cust_city, ' - ', c.working_area) as customer_details, d.ord_date, d.ord_amount
from customer as c
left join daysorder as d on d.cust_code = c.cust_code;

-- 3. RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table

/*
SELECT coulumns()
FROM Table1
RIGHT JOIN Table2 on Table1.coulmn_name = Table2.column_name
*/
select count(cust_code) from customer; -- 29
select count(cust_code) from orders; -- 36

select c.cust_name, c.cust_city, o.ord_amount, o.advance_amount
from customer as c
right join orders as o on c.cust_code = o.cust_code;

select c.cust_name, c.cust_city, o.ord_amount, o.advance_amount
from orders as o
right join customer as c on c.cust_code = o.cust_code;

-- 4. FULL (OUTER) JOIN: Return all records when there is a match in either left or right table 

/*
SELECT Columns()
FROM Table1
LEFT JOIN Table2 ON Table1.ColumnName = Table2.ColumnName
UNION
SELECT Columns()
FROM Table1
RIGHT JOIN Table2 ON Table1.ColumnName = Table2.ColumnName;
*/

select * from orders;
select * from customer;

SELECT c.cust_name, o.advance_amount, o.ord_amount 
FROM customer as c
LEFT JOIN orders o ON c.cust_code = o.cust_code
UNION  
SELECT c.cust_name, o.advance_amount, o.ord_amount
FROM customer as c 
RIGHT JOIN orders o ON c.cust_code = o.cust_code;

SELECT c.cust_name, o.advance_amount, o.ord_amount 
FROM customer as c
LEFT JOIN orders as o ON c.cust_code = o.cust_code
UNION  
SELECT c.cust_name, o.advance_amount, o.ord_amount
FROM customer as c 
RIGHT JOIN orders as o ON c.cust_code = o.cust_code
order by cust_name;

-- SQL SELF JOIN
select * from customer as c , orders as o
where o.cust_code <> c.cust_code; -- <> => !=

-- UNION 
/*
SYNTAX: 
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

The UNION operator is used to combine the result-set of two or more SELECT statements.
	Each SELECT statement within UNION must have the same number of columns
	The columns must also have similar data types
	The columns in each SELECT statement must also be in the same orde
*/

-- UNION ALL
/*
SYNTAX: 
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

*/

-- GROUP BY 
