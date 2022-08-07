CREATE DATABASE AjaxDjango;                                              --Query to Create a database name AjaxDjango
DROP DATABASE AjaxDjango;                                                 --Query to Delete a database name AjaxDjango

/*
CREATE TABLE table_name(                                                       
	variable_name data_type  constraints,
	variable_name data_type  constraints,
	variable_name data_type  constraints,
	variable_name data_type  constraints
);
*/
CREATE TABLE employee(                                                       --Query to Create a table named 'employee' in  AjaxDjango database.
    id INT PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	dob DATE  NOT NULL
);

DROP TABLE employee;                                                           --Query to delete single table
DROP TABLE employee,student;                                              --Query to delete multiple table

INSERT INTO employee(id,name,address,dob)                        --Query to insert a single data into the table
VALUES(1,'Samir','Pokhara',2000/10/04);

INSERT INTO employee(id,name,address,dob)                        --Query to insert multiple data into the table
VALUES
(1,'Sampada','Kathmandu',2004/7/04),
(2,'Sambhav','Myagdi',199/1/04),
(3,'Samir','Pokhara',2000/3/04),
(4,'Sama','Pokhara',2003/5/04);

--UPDATE RECORDS
UPDATE person SET email='amar@gmail.com';  --update all records with the specified email
UPDATE person SET email='amar@gmail.com' WHERE id=101;
UPDATE person SET first_name='Manika' ,last_name='Thakuri',email='manika12@gmail.com'  WHERE id=100;  --updatle  a certain records with multiple fields.

--DELETE RECORDS
DELETE FROM person;                         --Deletes all records
DELETE FROM person WHERE id=1;
DELETE FROM person WHERE id=1 AND address='Pokhara';

--DISPLAYING TABLES
SELECT * FROM employee;                                                       --Query to display all columns into the table
SELECT name FROM employee;                                                --Query to display specific column into the table

--SORTING DATA
SELECT name FROM employee ORDER BY address DESC ;   --Ouery to sort out by name ordering by descending order(Default Ordering is Ascending).

--SORTING AND DISPLAYING
SELECT DISTINCT address FROM employee ORDER BY address DESC ;   --Ouery to filter out specific address using WHERE and ordering by descending order.
SELECT * FROM person WHERE address='Pokhara' AND gender='MALE'; 
SELECT * FROM person WHERE address='Pokhara' AND (gender='MALE' OR country='NEPAL');

--EXTRACTING DATES
SELECT NOW();
SELECT EXTRACT(YEAR FROM NOW());               --QUERY TO EXTRACT YEAR FROM DATES.
SELECT EXTRACT(MONTH FROM NOW());          --QUERY TO EXTRACT MONTH FROM DATES.
SELECT EXTRACT(CENTURY FROM NOW());        --QUERY TO EXTRACT CENTURY FROM DATES.
SELECT EXTRACT(DOW FROM NOW());               --QUERY TO EXTRACT DAY FROM DATES.


--AGE FUNTION
SELECT *,AGE(NOW(),dob) AS age FROM person;
/*
 id  |    name    |           address            |    dob     |               age
-----+------------+------------------------------+------------+---------------------------------
   1 | Gerardo    | 31 Express Lane              | 2020-08-29 | 11 mons 25 days 11:58:04.915201
   2 | Lorry      | 0 Bultman Parkway            | 2021-04-23 | 4 mons 11:58:04.915201
   3 | Mehetabel  | 60 Stuart Circle             | 2021-06-18 | 2 mons 5 days 11:58:04.915201
   4 | Yettie     | 3290 Bashford Junction       | 2020-09-05 | 11 mons 18 days 11:58:04.915201
   5 | Mathe      | 89 Crownhardt Alley          | 2021-08-17 | 6 days 11:58:04.915201
   6 | Dawna      | 4422 Shelley Hill            | 2021-06-30 | 1 mon 23 days 11:58:04.915201
   7 | Hortense   | 12729 Fair Oaks Park         | 2020-11-12 | 9 mons 11 days 11:58:04.915201
   8 | Markus     | 7 Milwaukee Lane             | 2021-07-09 | 1 mon 14 days 11:58:04.915201
   9 | Hendrick   | 83 Bellgrove Place           | 2020-10-29 | 9 mons 25 days 11:58:04.915201
  10 | Alayne     | 22173 Katie Hill             | 2021-04-04 | 4 mons 19 days 11:58:04.915201
  11 | Daile      | 509 Superior Center          | 2020-12-01 | 8 mons 22 days 11:58:04.915201
  12 | Grove      | 9 Fuller Street              | 2021-05-15 | 3 mons 8 days 11:58:04.915201
  13 | Zara       | 7993 Rusk Pass               | 2021-07-21 | 1 mon 2 days 11:58:04.915201
  14 | Dominique  | 20981 Blackbird Circle       | 2021-06-14 | 2 mons 9 days 11:58:04.915201
  15 | Linda      | 724 Ronald Regan Road        | 2021-06-15 | 2 mons 8 days 11:58:04.915201
*/