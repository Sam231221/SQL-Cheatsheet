create table person (
	id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,	
	email VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
);

insert into person (id, first_name, last_name, email, gender, address, country, dob) values (1, 'Erena', 'Stiant', 'estiant0@gov.uk', 'Male', '85 Porter Crossing', 'Colombia', '2021-05-18');
--WHEN WE TRY TO EXCEUTE THE ABOVE PREPOPULATED WITH SAM FIELD ATTRIBUTES,IT THROWS FOLLOWING ERROR
/*
postgres=# insert into person (id, first_name, last_name, email, gender, address, country, dob) values (1, 'Erena', 'Stiant', 'estiant0@gov.uk', 'Male', '85 Porter Crossing', 'Colombia', '2021-05-18');
ERROR:  duplicate key value violates unique constraint "person_pkey"
DETAIL:  Key (id)=(1) already exists.
*/

--SO WE RUN THE FOLLOWING QUERY
ALTER TABLE person DROP CONSTRAINT person_pkey;
/*
postgres=# ALTER TABLE person DROP CONSTRAINT person_pkey;
ALTER TABLE
postgres=# \d person
                        Table "public.person"
   Column   |         Type          | Collation | Nullable | Default
------------+-----------------------+-----------+----------+---------
 id         | integer               |           | not null |
 first_name | character varying(50) |           | not null |
 last_name  | character varying(50) |           | not null |
 email      | character varying(50) |           | not null |
 gender     | character varying(50) |           | not null |
 address    | character varying(50) |           | not null |
 country    | character varying(50) |           | not null |
 dob        | date                  |           | not null |

NOTE:-There's no person_pkey now since we drop the primary key.
*/
insert into person (id, first_name, last_name, email, gender, address, country, dob) values (1, 'Erena', 'Stiant', 'estiant0@gov.uk', 'Male', '85 Porter Crossing', 'Colombia', '2021-05-18');
--The above query is now accepted.
/*
postgres=# insert into person (id, first_name, last_name, email, gender, address, country, dob) values (1, 'Erena', 'Stiant', 'estiant0@gov.uk', 'Male', '85 Porter Crossing', 'Colombia', '2021-05-18');
INSERT 0 1
postgres=# SELECT * FROM person  WHERE id=1;
 id | first_name | last_name |      email      | gender |      address       | country  |    dob
----+------------+-----------+-----------------+--------+--------------------+----------+------------       
  1 | Erena      | Stiant    | estiant0@gov.uk | Male   | 85 Porter Crossing | Colombia | 2021-05-18        
  1 | Erena      | Stiant    | estiant0@gov.uk | Male   | 85 Porter Crossing | Colombia | 2021-05-18        
(2 rows)
*/

--DEFINING UNIQUE CONSTRAINT
ALTER TABLE PERSON ADD PRIMARY KEY(id);--when we run this,it gives us error,since id column has two id which were previously identical.
/*
ERROR:  could not create unique index "person_pkey"
DETAIL:  Key (id)=(1) is duplicated.
*/

--To Fix this,we delete the two id using WHERE
DELETE FROM person WHERE id=1;
ALTER TABLE person ADD PRIMARY KEY(id);
insert into person (id, first_name, last_name, email, gender, address, country, dob) values (1, 'Erena', 'Stiant', 'estiant0@gov.uk', 'Male', '85 Porter Crossing', 'Colombia', '2021-05-18');
/*
Now we have only one with id=1 and our primary key is back.
postgres=# SELECT *  FROM person WHERE id=1; 
 id | first_name | last_name |      email      | gender |      address       | country  |    dob
----+------------+-----------+-----------------+--------+--------------------+----------+------------       
  1 | Erena      | Stiant    | estiant0@gov.uk | Male   | 85 Porter Crossing | Colombia | 2021-05-18        
(1 row)

*/


--DEFINING CUSTOM UNIQUE CONSTRAINTS

SELECT email,count(*) FROM person GROUP BY email;  --count of eachemails
SELECT email,count(*) FROM person GROUP BY email HAVING COUNT(*)>1;  --Displays if email count>1 i.e duplicate emails
-- we delete one of these 2 duplicated ones.
/*

postgres=# SELECT * FROM person WHERE email='jganforth2r@goo.gl'; 
 id  | first_name | last_name |       email        |   gender   |     address      | country |    dob
-----+------------+-----------+--------------------+------------+------------------+---------+------------
 100 | Jodie      | Ganforth  | jganforth2r@goo.gl | Polygender | 8 Old Gate Trail | Malawi  | 2020-11-07
 101 | Joddie     | Gforth    | jganforth2r@goo.gl | Polygender | Gate Trail       | Malawi  | 2020-11-07
(2 rows)


postgres=# DELETE FROM person WHERE id=101;
DELETE 1
postgres=# ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE (email);
ALTER TABLE

Now We can see a new unique constraint for email.
postgres=# \d person
                        Table "public.person"
   Column   |         Type          | Collation | Nullable | Default
------------+-----------------------+-----------+----------+---------
 id         | integer               |           | not null |
 first_name | character varying(50) |           | not null |
 last_name  | character varying(50) |           | not null |
 email      | character varying(50) |           | not null |
 gender     | character varying(50) |           | not null |
 address    | character varying(50) |           | not null |
 country    | character varying(50) |           | not null |
 dob        | date                  |           | not null |
Indexes:
    "person_pkey" PRIMARY KEY, btree (id)
    "unique_email_address" UNIQUE CONSTRAINT, btree (email)
*/