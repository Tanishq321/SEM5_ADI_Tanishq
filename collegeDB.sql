Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\Users\tg155> mysql -u root -p
Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 26.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create databse collegeDB;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databse collegeDB' at line 1
mysql> create database collegedb;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Ansh_mehta         |
| college            |
| college2           |
| collegedb          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| traveldb           |
+--------------------+
9 rows in set (0.00 sec)

mysql> use collegedb;
Database changed
mysql> create table students(
    -> student_id int primary key auto_increment,
    -> name varchar(100) not null,
    -> email varchar(100) unique,.
    -> email varchar(100) unique,
    -> age int check(age>=18),
    -> city varchar(50),
    -> course varchar(50),
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.
email varchar(100) unique,
age int check(age>=18),
city varchar(50),
course va' at line 4
mysql> CREATE TABLE Students(
    -> 
    -> student_id INT PRIMARY KEY AUTO_INCREMENT,
    -> 
    -> name VARCHAR(100) NOT NULL,
    -> 
    -> email VARCHAR(100) UNIQUE,
    -> 
    -> age INT CHECK(age>=18),
    -> 
    -> city VARCHAR(50),
    -> 
    -> course VARCHAR(50)
    -> 
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table courses(
    -> course_id int primary key auto_increment,
    -> course_name varchar(100) not null,
    -> fees int not null
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table Enrollements(
    -> enrollement_id int primary key auto_increment,
    -> student_id int,
    -> course_id int,
    -> marks int,
    -> foreign key(student_id)
    -> references Students(student_id),
    -> foreign key(course_id)
    -> references courses(course_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> insert into Students(name,email,age,city,course)
    -> values
    -> ('Rahul','rahul@gmail.com',21,'delhi','java');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(name,email,age,city,course)
    -> VALUES
    -> ('Neha','neha@gmail.com',20,'Mumbai','Python'),
    -> ('Amit','amit@gmail.com',23,'Delhi','Java'),
    -> ('Priya','priya@gmail.com',22,'Chandigarh','Python'),
    -> ('Rohan','rohan@gmail.com',25,'Delhi','Java'),
    -> ('Simran','simran@gmail.com',24,'Mohali','DevOps'),
    -> ('Karan','karan@gmail.com',26,'Delhi','Python');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Students;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          1 | Rahul  | rahul@gmail.com  |   21 | delhi      | java   |
|          2 | Neha   | neha@gmail.com   |   20 | Mumbai     | Python |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi      | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
|          7 | Karan  | karan@gmail.com  |   26 | Delhi      | Python |
+------------+--------+------------------+------+------------+--------+
7 rows in set (0.00 sec)

mysql> INSERT INTO Courses(course_name,fees)
    -> VALUES
    -> ('Java',30000),
    -> ('Python',25000),
    -> ('DevOps',40000);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from Courses;
+-----------+-------------+-------+
| course_id | course_name | fees  |
+-----------+-------------+-------+
|         1 | Java        | 30000 |
|         2 | Python      | 25000 |
|         3 | DevOps      | 40000 |
+-----------+-------------+-------+
3 rows in set (0.00 sec)

mysql> insert into Enrollements(student_id,course_id,marks)
    -> values
    -> (1,1,90),
    -> (2,2,80),
    -> (3,3,70),
    -> (4,4,60),
    -> (5,5,95),
    -> (6,6,67),
    -> (7,2,78);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`collegedb`.`enrollements`, CONSTRAINT `enrollements_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`))
mysql> INSERT INTO Enrollments(student_id,course_id,marks)
    -> VALUES
    -> 
    -> (1,1,90),
    -> (2,2,80),
    -> (3,1,95),
    -> (4,2,70),
    -> (5,1,88),
    -> (6,3,92),
    -> (7,2,75);
ERROR 1146 (42S02): Table 'collegedb.enrollments' doesn't exist
mysql> INSERT INTO Enrollements(student_id,course_id,marks) VALUES  (1,1,90), (2,2,80), (3,1,95), (4,2,70), (5,1,88), (6,3,92), (7,2,75);
Query OK, 7 rows affected (0.00 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from Enrollements;
+----------------+------------+-----------+-------+
| enrollement_id | student_id | course_id | marks |
+----------------+------------+-----------+-------+
|              8 |          1 |         1 |    90 |
|              9 |          2 |         2 |    80 |
|             10 |          3 |         1 |    95 |
|             11 |          4 |         2 |    70 |
|             12 |          5 |         1 |    88 |
|             13 |          6 |         3 |    92 |
|             14 |          7 |         2 |    75 |
+----------------+------------+-----------+-------+
7 rows in set (0.00 sec)

mysql> select city,
    -> count(*) as TotalStudents
    -> from Students
    -> group by city;
+------------+---------------+
| city       | TotalStudents |
+------------+---------------+
| delhi      |             4 |
| Mumbai     |             1 |
| Chandigarh |             1 |
| Mohali     |             1 |
+------------+---------------+
4 rows in set (0.00 sec)

mysql> select city,
    -> sum(marks)
    -> from Students
    -> join Enrollements
    -> on Students.student_id=Enrollements.student_id
    -> group by city;
+------------+------------+
| city       | sum(marks) |
+------------+------------+
| delhi      |        348 |
| Mumbai     |         80 |
| Chandigarh |         70 |
| Mohali     |         92 |
+------------+------------+
4 rows in set (0.01 sec)

mysql> select city,
    -> avg(marks)
    -> from Students
    -> join Enrollements
    -> on Students.student_id=Enrollements.student_id
    -> group by city;
+------------+------------+
| city       | avg(marks) |
+------------+------------+
| delhi      |    87.0000 |
| Mumbai     |    80.0000 |
| Chandigarh |    70.0000 |
| Mohali     |    92.0000 |
+------------+------------+
4 rows in set (0.00 sec)

mysql> select city,
    -> avg(marks) as AverageMarks
    -> from Students
    -> join Enrollements
    -> on Students.student_id=Enrollement.student_id
    -> group by city
    -> having avg(marks)>85;
ERROR 1054 (42S22): Unknown column 'Enrollement.student_id' in 'on clause'
mysql> SELECT city,
    -> AVG(marks) AS AverageMarks
    -> 
    -> FROM Students
    -> JOIN Enrollments
    -> ON Students.student_id=Enrollments.student_id
    -> 
    -> GROUP BY city
    -> 
    -> HAVING AVG(marks)>85;
ERROR 1146 (42S02): Table 'collegedb.enrollments' doesn't exist
mysql> SELECT city, AVG(marks) AS AverageMarks  FROM Students JOIN Enrollements ON Students.student_id=Enrollements.student_id  GROUP BY city  HAVING AVG(marks)>85;
+--------+--------------+
| city   | AverageMarks |
+--------+--------------+
| delhi  |      87.0000 |
| Mohali |      92.0000 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql>
