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
values ("C00028", "Abhimanyu","Manjarde", "Narhe", "INDIA", "1", "10000", "110000", "110000", "1100000", "9175535381", "A019");

SET SQL_SAFE_UPDATES = 0;

update customer
set cust_name = "LALASHET" , Cust_city="MUMBAI", cust_country = "India"
where cust_code = "C00026";

update customer
set working_area = "KOPARKHIRANE"
where working_area = "PUNE";

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
and not cust_country in ('uk');

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

select c.cust_name , d.ord_date
from customer as c, daysorder as d
where cust_name = 'Dipak';


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

select o.ord_date, c.cust_name, o.ord_amount
from daysorder as o
inner join customer as c on o.cust_code = c.cust_code;

select orders.ord_num, customer.cust_name, orders.ord_date
from orders
inner join customer on orders.cust_code = customer.cust_code;

select c.cust_name, o.ord_date, o.ord_amount
from orders as o
inner join customer as c on o.cust_code = c.cust_code;

select customer.cust_name, customer.working_area, daysorder.ord_amount
from customer
inner join daysorder on customer.cust_code = daysorder.cust_code;

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
/* 
The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to
group the result-set by one or more columns
*/

select * from customer; 

select count(cust_name), working_area
from customer
group by working_area;

select count(cust_name), cust_country 
from customer
group by cust_country
order by count(cust_name);

select * from customer;

select count(grade), cust_country
from customer
group by cust_country
order by count(grade);

select count(opening_amt), cust_country
from customer
where opening_amt = 5000
group by cust_country;

select * from customer;

select count(cust_country), cust_country
from customer
group by cust_country
order by count(cust_country);

-- group by join

select count(customer.cust_name), daysorder.ord_num
from customer
left join daysorder on customer.cust_code = daysorder.cust_code
group by daysorder.ord_num;

-- group by having

select count(cust_name), cust_country
from customer
group by cust_country
having cust_country = 'India'
order by count(cust_name);

select * from customer;

select count(working_area), cust_country
from customer
group by cust_country
having count(working_area) <= 15;

SELECT 
    COUNT(grade), working_area
FROM
    customer
GROUP BY working_area
HAVING COUNT(grade) > 2
ORDER BY COUNT(grade);

-- SQL SELECT INTO 
-- The SELECT INTO statement copies data from one table into a new table.
/* SYNTAX:
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;
*/

/*
select *
into customer_backup
from customer;

select * from customer_backup;
-- not working in my system
*/

-- SQL INSERT INTO SELECT STATEMENT
/*
The INSERT INTO SELECT statement copies data from one table and inserts it into another table.
1. INSERT INTO SELECT requires that data types in source and target tables match
2. The existing records in the target table are unaffected

INSERT INTO SELECT Syntax:

Copy all columns from one table to another table:

INSERT INTO table2
SELECT * FROM table1
WHERE condition;
*/

insert INTO customer_backup
select * from customer;

select count(*) from customer;
select count(*) from customer_backup;

insert into listofitem
select * from foods;

select * from listofitem;

insert into customer_backup2
select * from customer
where cust_country = 'india';

select * from customer_backup2;

---






