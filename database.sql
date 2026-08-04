Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\Users\tg155> mysql -u root -p
Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 26.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Ansh_mehta         |
| college            |
| college2           |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| traveldb           |
+--------------------+
8 rows in set (0.00 sec)

mysql> use college2;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+--------------------+
| Tables_in_college2 |
+--------------------+
| courses            |
| students           |
+--------------------+
2 rows in set (0.00 sec)

mysql> select * from students;
+----+--------+------+-----------+
| id | name   | age  | course_id |
+----+--------+------+-----------+
|  1 | Rahul  |   20 |       101 |
|  2 | Vishal |   21 |       101 |
|  3 | Akash  |   22 |       102 |
|  4 | Yogya  |   23 |       103 |
+----+--------+------+-----------+
4 rows in set (0.00 sec)

mysql> select * from courses;
Empty set (0.00 sec)

mysql> insert into courses values
    -> (101,'java'),
    -> (102,'python'),
    -> (103,'pa');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from courses;
+-----------+-------------+
| course_id | course_name |
+-----------+-------------+
|       101 | java        |
|       102 | python      |
|       103 | pa          |
+-----------+-------------+
3 rows in set (0.00 sec)

mysql> select
    -> students.name,
    -> courses.course_name
    -> from students
    -> inner join courses
    -> on students.course_id=courses.course_id;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | java        |
| Vishal | java        |
| Akash  | python      |
| Yogya  | pa          |
+--------+-------------+
4 rows in set (0.00 sec)

mysql> insert into students
    -> values
    -> (5,'karan',25,104);
Query OK, 1 row affected (0.00 sec)

mysql> select students.name,
    -> courses.course_name
    -> from students
    -> left join courses
    -> on students.course_id=courses.course_id;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | java        |
| Vishal | java        |
| Akash  | python      |
| Yogya  | pa          |
| karan  | NULL        |
+--------+-------------+
5 rows in set (0.00 sec)

mysql> insert into courses
    -> values
    -> (105,'AI');
Query OK, 1 row affected (0.01 sec)

mysql> select 
    -> students.name,
    -> courses.course_name
    -> from students
    -> right join courses
    -> on students.course_id=course.course_id;
ERROR 1054 (42S22): Unknown column 'course.course_id' in 'on clause'
mysql> select students.name, courses.course_name from students right join courses on students.course_id=courses.course_id;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Vishal | java        |
| Rahul  | java        |
| Akash  | python      |
| Yogya  | pa          |
| NULL   | AI          |
+--------+-------------+
5 rows in set (0.00 sec)

mysql> create table employees(
    -> id int primary key,
    -> name varchar(30),
    -> manager_id int
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+--------------------+
| Tables_in_college2 |
+--------------------+
| courses            |
| employees          |
| students           |
+--------------------+
3 rows in set (0.00 sec)

mysql> insert into employees values
    -> (1,'CEO',NULL),
    -> (2,'Manager',1),
    -> (3,'Neeraj',2),
    -> (4,'Rahul',2);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select 8 from employees;
+---+
| 8 |
+---+
| 8 |
| 8 |
| 8 |
| 8 |
+---+
4 rows in set (0.01 sec)

mysql> select * from employees;
+----+---------+------------+
| id | name    | manager_id |
+----+---------+------------+
|  1 | CEO     |       NULL |
|  2 | Manager |          1 |
|  3 | Neeraj  |          2 |
|  4 | Rahul   |          2 |
+----+---------+------------+
4 rows in set (0.00 sec)

mysql> select e.name as Employee,
    -> m.name as Manager
    -> from employees e
    -> left join employees m
    -> on e.manager_id=m.id;
+----------+---------+
| Employee | Manager |
+----------+---------+
| CEO      | NULL    |
| Manager  | CEO     |
| Neeraj   | Manager |
| Rahul    | Manager |
+----------+---------+
4 rows in set (0.00 sec)

mysql>
