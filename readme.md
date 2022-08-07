# A. Basic
### 1. Login
``` 
mysql -u root -p
``` 

### 2. Display all databases
``` 
show databases;
``` 

### 3. Drop a database
``` 
drop database test;
``` 
Note, delete keyword doesn't work.


### 4. Select Database
``` 
use sam;
``` 


### 5. Description of Table
``` 
desc course;
``` 

### 6. Display all Tables
``` 
show tables;
``` 


# B. Data Definition language(DDL)
### 1. CREATE
``` 
create table course(id int primary key, name varchar(20), price mediumint not null);
``` 

using auto_increment
``` 
create table category(id int auto_increment primary key,
    -> name varchar(30));
``` 

### 2. DROP 
``` 
drop table course;
``` 

### 3. ALTER
``` 
people table:
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(50) | NO   |     | NULL    |                |
| last_name  | varchar(50) | NO   |     | NULL    |                |
| birth_date | date        | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
``` 

#### i. Add new column
``` 
alter table people add(age int);
``` 

#### ii. Modify existing column's datatype
``` 
alter table people modify column birth_date year;
```
Info: date -> year

#### iii. Delete existing column
``` 
alter table event drop column name;
``` 

#### iv. Delete existing column's datatype
``` 
alter table event drop column DOB year;
``` 

### 4. TRUNCATE
It deletes or removes all the records from the table.
``` 
category table:
+----+-----------------+
| id | name            |
+----+-----------------+
|  1 | Web Develpoment |
|  3 | Devops          |
``` 

#### i. Remove all rows from the table
``` 
truncate table category;
``` 


### 5. RENAME
It is used to change the name of the database table.
``` 
rename table category to options;
``` 


# B. Data Manipulation language(DML)
### 1. INSERT
#### i. Single insertion
``` 
insert into course values(1,'Python OOP', 1500);
``` 


#### ii. Multiple Insertion at a time
``` 
insert into course(id, name, price)
    -> values(3,'DjangoAdvancedSignUp', 2500),(5,'Advanced JavaCourse', 3000);
``` 

``` 
 insert into course values(6,'Artificial Intelligence', 2500),
 (15,'Digital Marketing', 3000);
```  

``` 
 insert all 
 into course values(6,'Artificial Intelligence', 2500),
 into course values(15,'Digital Marketing', 3000),
 into course values(22,'Mysql', 4000),
```  


#### iii. Insertion records of one table into another one
``` 
insert into people(first_name, age)
    -> select name, age from employee;
``` 
Insert all the records of employee into people with specified attributes only.
***
<br/>


### 2. SELECT 

#### i. Display all attributes of a row
``` 
select * from people;
``` 

#### ii. Display only some attributes of a row
``` 
select first_name, last_name from people;
``` 

#### iii. Display  all unique name from people
``` 
select distinct first_name from people;
```
Note after 'distinct' keyword at least one attribute is compulsory. 

***
<br/>

### 3. UPDATE
Syntax:
``` 
update table_name set attribute=<value> where condition;
``` 
``` 
employee Table:
+-----+--------+-------------------+--------+-------------+------+
| eid | name   | post              | salary | working_hrs | age  |
+-----+--------+-------------------+--------+-------------+------+
|   1 | Ram    | Hacker            | 500000 |           0 | NULL |
|   2 | Anjan  | Businessman       | 500000 |           0 | NULL |
|   5 | Bishal | Businessman       | 400000 |           4 | NULL |
|  12 | Sam    | Software Engineer | 700000 |          12 | NULL |
|  25 | Rohan  | Scientist         | 800000 |           0 | NULL |
+-----+--------+-------------------+--------+-------------+------+
``` 
#### i. Update a particular attribute of row
``` 
update employee set age=21 where name="Ram";
``` 

#### ii. Update multiple attribute of row
``` 
update employee set age = 22, working_hrs = 11 where name = "Sam";
``` 

#### ii. Update multiple attribute of row with multuple conditions
``` 
update employee set salary = 750000 where working_hrs = 12 and age > 18;
``` 


### 4. DELETE
#### i. delete record(s) from a table
``` 
delete from employee where name= "Rohan";
``` 



<br/>

# C. Constraints in SQL
Syntax:
``` 
create table table_name(
    column1 data_type,
    column2 data_type,
    column3 data_type,
    constraint constraint_name1 constraint_type(column1),
    constraint constraint_name2 constraint_type(column2),
    constraint constraint_name3 constraint_type(column2),
);
``` 

Examples:
For Book table
``` 
create table book(
    -> book_id int,
    -> book_name varchar(30),
    -> author_name varchar(30),
    -> book_cost int,
    -> constraint bid primary key(book_id),
    -> constraint bname unique(book_name),
    -> constraint bcost CHECK (book_cost > 1000));
``` 


For Customer table:
``` 
create table customer(
    -> customer_id int,
    -> customer_name varchar(30),
    -> email_id varchar(30),
    -> issue_date date,
    -> bid int,
    -> constraint cid primary key (customer_id),
    -> constraint emid unique (email_id),
    -> constraint bid foreign key (bid) references book(book_id));
```     

Cmd1
```  
insert into book values (12, 'Artifical Intelligence', 'Sam', 30000),(23, 'Database Management System','Ram', 15000),(24, 'Theory of Computation', 'Sam', 2000);
```  
Cmd2
```  
insert into customer values(1,'Shyam', 'shyam111@gmail.com', '2022-12-1', 12);
insert into customer values(5,'Hari', 'hari22@gmail.com', '2021-01-21', 24);
 insert into customers values(5,'Hari', 'hari22@gmail.com', '2021-01-21', 22);
```   
Cmd3
``` 
 insert into customers values(5,'Hari', 'hari22@gmail.com', '2021-01-21', 22);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`sam`.`customers`, CONSTRAINT `bid` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`))
```  


## Clauses

### 1. BETWEEN  -It must be used with where clause for providing range of values

Syntax of Between operator:
``` 
select columns
from table_name
where column_name between value1 and value2;
``` 
Note: It returns results hvaing attribute starting with value1 and ending with value2

Syntax of Not Between operator:
``` 
select columns
from table_name
where column_name not between value1 and value2;
``` 

Examples
Consider a book table:
``` 
+---------+----------------------------+-------------+-----------+
| book_id | book_name                  | author_name | book_cost |
+---------+----------------------------+-------------+-----------+
|       2 | Computer Networks          | Sam         |     35000 |
|       6 | Compiler Design            | Ram         |     45000 |
|      12 | Artifical Intelligence     | Sam         |     30000 |
|      23 | Database Management System | Ram         |     15000 |
|      24 | Theory of Computation      | Sam         |      2000 |
+---------+----------------------------+-------------+-----------+
``` 

Run the query
```   
select * from book where book_id between 12 and 23;
``` 
It returns
``` 
+---------+----------------------------+-------------+-----------+
| book_id | book_name                  | author_name | book_cost |
+---------+----------------------------+-------------+-----------+
|      12 | Artifical Intelligence     | Sam         |     30000 |
|      23 | Database Management System | Ram         |     15000 |
+---------+----------------------------+-------------+-----------+
2 rows in set (0.077 sec)
``` 

### 2. BETWEEN -It must be used with where clause
It checks a value within a set of values separated by commas and retrieve from the table that gets matched.

Example

Ex1:
```   
select * from book where book_id in (1,2,3);
``` 
It returns 
``` 
+---------+-------------------+-------------+-----------+
| book_id | book_name         | author_name | book_cost |
+---------+-------------------+-------------+-----------+
|       2 | Computer Networks | Sam         |     35000 |
+---------+-------------------+-------------+-----------+
``` 
    
Ex2:    
``` 
select * from book where book_id not in (1,2,3);
```   
It returns 
``` 
+---------+----------------------------+-------------+-----------+
| book_id | book_name                  | author_name | book_cost |
+---------+----------------------------+-------------+-----------+
|       6 | Compiler Design            | Ram         |     45000 |
|      12 | Artifical Intelligence     | Sam         |     30000 |
|      23 | Database Management System | Ram         |     15000 |
|      24 | Theory of Computation      | Sam         |      2000 |
+---------+----------------------------+-------------+-----------+
4 rows in set (0.001 sec)
``` 


### 3. ORDER BY 
It returns results in either ascending or descending order.
Syntax:
``` 
select attribute1, attribute2 from table_name ORDER BY column1 [DESC | ASC]
``` 

``` 
MariaDB [sam]> select * from book order by book_id desc;
+---------+----------------------------+-------------+-----------+
| book_id | book_name                  | author_name | book_cost |
+---------+----------------------------+-------------+-----------+
|      24 | Theory of Computation      | Sam         |      2000 |
|      23 | Database Management System | Ram         |     15000 |
|      12 | Artifical Intelligence     | Sam         |     30000 |
|       6 | Compiler Design            | Ram         |     45000 |
|       2 | Computer Networks          | Sam         |     35000 |
+---------+----------------------------+-------------+-----------+
5 rows in set (0.028 sec)
``` 


``` 
MariaDB [sam]> select * from book order by book_name desc;
+---------+----------------------------+-------------+-----------+
| book_id | book_name                  | author_name | book_cost |
+---------+----------------------------+-------------+-----------+
|      24 | Theory of Computation      | Sam         |      2000 |
|      23 | Database Management System | Ram         |     15000 |
|       2 | Computer Networks          | Sam         |     35000 |
|       6 | Compiler Design            | Ram         |     45000 |
|      12 | Artifical Intelligence     | Sam         |     30000 |
+---------+----------------------------+-------------+-----------+
``` 
