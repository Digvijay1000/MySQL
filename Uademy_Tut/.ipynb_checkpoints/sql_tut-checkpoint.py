show databases;
use abhidb;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone TEXT NOT NULL,
    city TEXT,
    registration_date DATETIME NOT NULL,
    UNIQUE KEY unique_email (email(255))
);

INSERT INTO users (user_id, first_name, last_name, email, phone, city, registration_date) 
VALUES
(1,'John', 'Doe', 'johndoe@example.com', '555-1234', 'New York', '2023-01-02'),
(2,'Jane', 'Doe', 'janedoe@example.com', '555-5678', 'Los Angeles', '2023-01-03'),
(3,'Bob', 'Smith', 'bobsmith@example.com', '555-9012', 'Chicago', '2023-01-04'),
(4,'Samantha', 'Johnson', 'sjohnson@example.com', '555-3456', 'San Francisco', '2023-01-05'),
(5,'David', 'Brown', 'dbrown@example.com', '555-7890', 'Seattle', '2023-01-06'),
(6,'Emily', 'Davis', 'edavis@example.com', '555-2345', 'Boston', '2023-01-07'),
(7,'Michael', 'Wilson', 'mwilson@example.com', '555-6789', 'Houston', '2023-01-08'),
(8,'Sarah', 'Garcia', 'sgarcia@example.com', '555-0123', 'Miami', '2023-01-09'),
(9,'Daniel', 'Martinez', 'dmartinez@example.com', '555-4567', 'Atlanta', '2023-01-10'),
(10,'Jessica', 'Lee', 'jlee@example.com', '555-8901', 'Dallas', '2023-01-11'),
(11,'Matthew', 'Anderson', 'manderson@example.com', '555-8902', 'Detroit', '2023-01-12'),
(12,'Ashley', 'Thomas', 'athomas@example.com', '555-8903', 'Phoenix', '2023-01-13'),
(13,'Christopher', 'Taylor', 'ctaylor@example.com', '555-8904', 'San Diego', '2023-01-14'),
(14,'Jennifer', 'Moore', 'jmoore@example.com', '555-8905', 'Denver', '2023-01-15'),
(15,'Joshua', 'Jackson', 'jjackson@example.com', '555-8906', 'Portland', '2023-01-16'),
(16,'Amanda', 'White', 'awhite@example.com', '555-8907', 'Indianapolis', '2023-01-17'),
(17,'Andrew', 'Harris', 'aharris@example.com', '555-8908', 'Las Vegas', '2023-01-18'),
(18,'Brittany', 'Martin', 'bmartin@example.com', '555-8909', 'Austin', '2023-01-19'),
(19,'Brandon', 'Thompson', 'bthompson@example.com', '555-8910', 'Jacksonville', '2023-01-20'),
(20,'Megan', 'Garcia', 'mgarcia@example.com', '555-8911', 'San Jose', '2023-01-21'),
(21,'Justin', 'Martinez', 'jmartinez@example.com', '555-8912', 'Charlotte', '2023-01-22'),
(22,'Melissa', 'Robinson', 'mrobinson@example.com', '555-8913', 'Fort Worth', '2023-01-23'),
(23,'Kevin', 'Clark', 'kclark@example.com', '555-8914', 'Washington', '2023-01-24'),
(24,'Rebecca', 'Rodriguez', 'rrodriguez@example.com', '555-8915', 'Baltimore', '2023-01-25'),
(25,'Jacob', 'Lewis', 'jlewis@example.com', '555-8916', 'Milwaukee', '2023-01-26'),
(26,'Michelle', 'Walker', 'mwalker@example.com', '555-8917', 'Albuquerque', '2023-01-27'),
(27,'Ryan', 'Hall', 'rhall@example.com', '555-8918', 'Tucson', '2023-01-28'),
(28,'Stephanie', 'Allen', 'sallen@example.com', '555-8919', 'Fresno', '2023-01-29'),
(29,'Brian', 'Young', 'byoung@example.com', '555-8920', 'Sacramento', '2023-01-30'),
(30,'Heather', 'King', 'hking@example.com', '555-8921', 'Kansas City', '2023-01-31');

  
show tables;

select * 
from users;

select "hello world";

select *
from users
where city = "New York" ;

select * 
from users;

select *
from users
where city = "Dallas";

select first_name as NAME ,last_name as Surname
from users;

SELECT count(*) as Total_users,
COUNT(PHONE) AS "USERS WITH PHONE"
FROM USERS;

SELECT count(dept_id)
FROM dept
WHERE location='CHICAGO'
  AND DEPT_ID = '20';

select * from dept;

SELECT *
FROM users
WHERE REGISTRATION_DATE >= '2023-01-01';

SELECT *
FROM USERS
WHERE CITY != 'New York';

SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM USERS;

SELECT FIRST_NAMELAST_NAME AS FULL_NAME
FROM USERS
WHERE CITY = 'New York';

SELECT 
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    users;
    
SELECT 
    first_name,
    last_name,
    first_name || " " || last_name AS full_name
FROM
    users;
    
    

CREATE TABLE vehicles (
  vehicle_id INTEGER PRIMARY KEY,
  make TEXT NOT NULL,
  model TEXT NOT NULL,
  year INTEGER NOT NULL,
  license_plate varchar(100) NOT NULL UNIQUE
);

CREATE TABLE drivers (
  driver_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email varchar(255) NOT NULL UNIQUE,
  phone varchar(12) NOT NULL UNIQUE,
  city TEXT NOT NULL,
  vehicle_id INTEGER NOT NULL,
  FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id)
);

CREATE TABLE rides (
  ride_id INTEGER PRIMARY KEY,
  pickup_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dropoff_time DATETIME NOT NULL,
  pickup_location TEXT NOT NULL,
  dropoff_location TEXT NOT NULL,
  fare_amount REAL NOT NULL,
  tip_amount REAL NOT NULL,
  distance REAL NOT NULL,
  user_id INTEGER NOT NULL,
  driver_id INTEGER NOT NULL,
  status TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (driver_id) REFERENCES drivers (driver_id)
);


-- Additional users from San Jose
INSERT INTO users (user_id, first_name, last_name, email, phone, city, registration_date) VALUES
(36, 'Anthony', 'Ortega', 'aortega@example.com', '505-3456', 'San Jose', '2023-01-12 08:30:00'),
(37, 'Christina', 'Henderson', 'chenderson@example.com', '505-7890', 'San Jose', '2023-01-13 10:00:00'),
(38, 'George', 'Murphy', 'gmurphy@example.com', '505-2345', 'San Jose', '2023-01-14 11:45:00'),
(39, 'Linda', 'Peterson', 'lpeterson@example.com', '505-6789', 'San Jose', '2023-01-15 16:00:00'),
(40, 'Thomas', 'Harris', 'tharris@example.com', '505-0123', 'San Jose', '2023-01-16 18:00:00');

-- Additional users from New York
INSERT INTO users (user_id, first_name, last_name, email, phone, city, registration_date) VALUES
(31, 'Jennifer', 'Thompson', 'jthompson@example.com', '515-4567', 'New York', '2023-01-17 10:30:00'),
(32, 'Robert', 'Turner', 'rturner@example.com', '515-8901', 'New York', '2023-01-18 11:00:00'),
(33, 'Maria', 'Sanchez', 'msanchez@example.com', '515-5678', 'New York', '2023-01-19 14:00:00'),
(34, 'John', 'Phillips', 'jphillips@example.com', '515-9012', 'New York', '2023-01-20 16:30:00'),
(35, 'Susan', 'Gonzalez', 'sgonzalez@example.com', '515-3456', 'New York', '2023-01-21 17:30:00');

-- Additional users from San Francisco
INSERT INTO users (user_id, first_name, last_name, email, phone, city, registration_date) VALUES
(41, 'David', 'Clark', 'dclark@example.com', '525-7890', 'San Francisco', '2023-01-22 09:00:00'),
(42, 'Nancy', 'Adams', 'nadams@example.com', '525-2345', 'San Francisco', '2023-01-23 10:45:00'),
(43, 'Joseph', 'Baker', 'jbaker@example.com', '525-6789', 'San Francisco', '2023-01-24 12:30:00'),
(44, 'Margaret', 'Taylor', 'mtaylor@example.com', '525-0123', 'San Francisco', '2023-01-25 14:15:00'),
(45, 'Charles', 'Anderson', 'canderson@example.com', '525-4567', 'San Francisco', '2023-01-26 15:00:00');



-- Vehicles table
INSERT INTO vehicles (vehicle_id, make, model, year, license_plate) VALUES
(1, 'Toyota', 'Camry', 2018, 'ABC123'),
(2, 'Honda', 'Civic', 2017, 'DEF456'),
(3, 'Ford', 'F-150', 2020, 'GHI789'),
(4, 'Chevrolet', 'Malibu', 2019, 'JKL012'),
(5, 'Nissan', 'Altima', 2018, 'MNO345');

-- Drivers table
INSERT INTO drivers (driver_id, first_name, last_name, email, phone, city, vehicle_id) VALUES
(1,'Mike', 'Brown', 'mbrown@example.com', '555-2345', 'New York', 1),
(2,'Rachel', 'Garcia', 'rgarcia@example.com', '555-6789', 'Los Angeles', 2),
(3,'David', 'Lee', 'dlee@example.com', '555-0123', 'Chicago', 3),
(4,'Linda', 'Martinez', 'lmartinez@example.com', '555-4567', 'San Francisco', 4),
(5,'Alex', 'Wilson', 'awilson@example.com', '555-8901', 'Seattle', 5);

-- Rides table
INSERT INTO rides (ride_id, pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id,status) VALUES
(1,'2023-04-06 10:00:00', '2023-04-06 10:15:00', 'Central Park', 'Empire State Building', 10.50, 2.00, 3.0, 1, 1,11),
(2,'2023-04-06 11:30:00', '2023-04-06 12:15:00', 'Universal Studios', 'Hollywood Walk of Fame', 25.75, 5.00, 8.0, 2, 2,22),
(3,'2023-04-06 14:00:00', '2023-04-06 14:45:00', 'Millennium Park', 'Willis Tower', 15.20, 3.00, 5.5, 3, 3,33),
(4,'2023-04-06 16:30:00', '2023-04-06 17:15:00', 'Golden Gate Bridge', "Fisherman's Wharf", 21.80, 4.00, 7.5, 4, 4,44),
(5,'2023-04-06 18:30:00', '2023-04-06 19:00:00', 'Space Needle', 'Pike Place Market', 12.50, 2.50, 3.0, 5, 5,55);

-- Subsequent Insert Statements with Tip Amount
INSERT INTO rides (ride_id, pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES (6,'2023-04-15 10:00:00', '2023-04-15 10:30:00', 'Central Park', 'Times Square', 10.0, 2.00, 5.0, 1, 1, 'completed');

INSERT INTO rides (ride_id,pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES (7,'2023-04-15 11:00:00', '2023-04-15 11:30:00', 'Empire State Building', 'Grand Central Station', 15.0, 3.00, 7.5, 2, 2, 'completed');

INSERT INTO rides (ride_id,pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES (8,'2023-04-16 10:00:00', '2023-04-16 10:30:00', 'Central Park', 'Times Square', 12.0, 2.40, 6.0, 3, 1, 'completed');

INSERT INTO rides (ride_id,pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES (9,'2023-04-16 11:00:00', '2023-04-16 11:30:00', 'Empire State Building', 'Grand Central Station', 20.0, 4.00, 10.0, 4, 2, 'completed');

INSERT INTO rides (pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES ('2023-04-17 10:00:00', '2023-04-17 10:30:00', 'Central Park', 'Times Square', 18.0, 3.60, 9.0, 5, 1, 'completed');

INSERT INTO rides (pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES ('2023-04-17 11:00:00', '2023-04-17 11:30:00', 'Empire State Building', 'Grand Central Station', 25.0, 5.00, 12.5, 6, 2, 'completed');

INSERT INTO rides (pickup_time, dropoff_time, pickup_location, dropoff_location, fare_amount, tip_amount, distance, user_id, driver_id, status)
VALUES ('2023-04-18 10:00:00', '2023-04-18 10:30:00', 'Central Park', 'Times Square', 22.0, 4.40, 11.0, 7, 1, 'completed');


select * from rides;

-- Find all rides where the fare amount was greater than $20 

select *
from rides
where fare_amount >= 20;

-- Find all users who registered before a specific date: 2022-01-01
select *
from users
where registration_date < '2022-01-01';

-- Calculate the total fare amount for all rides
select * from rides;

select sum(fare_amount)
from rides;

SELECT FARE_AMOUNT + TIP_AMOUNT AS TOTAL_FARE
FROM RIDES;

-- Calculate the average fare amount per mile for all rides

select avg(fare_amount)
from rides;

select sum(fare_amount)/count(fare_amount)
from rides;

-- calculate the remainder of dividing the fare amount by 5 for all rides

select fare_amount, fare_amount/5  as remainder
from rides;

SELECT fare_amount, FARE_AMOUNT % 5 AS FARE_REMAINDER
FROM RIDES;

-- Find all rides where the pickup location was either Central Park or Times Square
select * 
from rides
where pickup_location = "Central Park" 
or pickup_location = "Times Square";

-- Find all users who registered before a specific date (2023-02-01) and are from New York
select *
from users
where registration_date < "2023-02-01" 
and city = "New York";













