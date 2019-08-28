----------------------------------------------------------------------------
--SUB QUERIES
drop table stud1;
drop table stud2;

create table stud_info (id number constraint id_pk_si primary key, name varchar2(30), gender char(1));
create table stud_marks (id number references stud_info(id), marks number);

insert into stud_info values(101, 'PENAN', 'M');
insert into stud_info values(102, 'SANJEEV', 'M');
insert into stud_info values(103, 'ABC', 'F');

insert into stud_marks values(101, 86);
insert into stud_marks values(102, 85);
insert into stud_marks values(103, 96);

select * from stud_info;
select * from stud_marks;

-- nested query 
select * from stud_info where id in (select id from stud_marks where marks<90);
select * from stud_info where id = (select id from stud_marks where marks=96);


-----------------------------------------------------------------------------
-- NEW TOPIC
-- SET OPERATIONS on table
create table stud1 (name  varchar2(10), marks number);
create table stud2 (name  varchar2(10), marks number);

insert into stud1 values('A', 600); --same
insert into stud1 values('B', 800);
insert into stud1 values('C', 200);
insert into stud1 values('D', 400); --same

insert into stud2 values('A', 600); --same
insert into stud2 values('B', 600);
insert into stud2 values('D', 400); -- same
insert into stud2 values('E', 900);

select * from stud1;
select * from stud2;

select * from stud1 union select * from stud2;
select * from stud1 union all select * from stud2;

select * from stud1 intersect select * from stud2;

select * from stud1 minus select * from stud2;
select * from stud2 minus select * from stud1;

-----------------------------------------------------------------------------
-- NEW TOPIC
-- TYPES OF JOINS
-- inner join, left outer join, right outer join, full outer join, self join, (CROSS JOIN or CARTESIAN JOIN)
drop table employee;
drop table part_time;

create table employee ( emp_name varchar2(30), street varchar2(30), city varchar2(30));
create table part_time ( emp_name varchar2(30), salary number);

insert into employee values('A', 'Ram Nagar', 'Bhusawal');
insert into employee values('B', 'Laxman Nagar', 'Jalgaon');
insert into employee values('C', 'Bharat Nagar', 'Yawal');
insert into employee values('D', 'Krishna Nagar', 'Indore');


insert into part_time values('A', 3000);
insert into part_time values('B', 5000);
insert into part_time values('D', 7000);
insert into part_time values('E', 2000);

select * from employee;
select * from part_time;

select * from e;
select part_time.emp_name, employee.emp_name, street, city, salary from employee inner join part_time on part_time.emp_name = employee.emp_name;

select part_time.emp_name, employee.emp_name, street, city, salary from employee left outer join part_time on part_time.emp_name = employee.emp_name;

select part_time.emp_name, employee.emp_name, street, city, salary from employee right outer join part_time on part_time.emp_name = employee.emp_name;

select part_time.emp_name, employee.emp_name, street, city, salary from employee full outer join part_time on part_time.emp_name = employee.emp_name;

select e.emp_name, p.emp_name from employee e, part_time p; -- cross join
-- cross join is same as
select e.emp_name, p.emp_name from employee e cross join part_time p;

-- CROSS JOIN or CARTESIAN JOIN
-- The CROSS JOIN clause returns the Cartesian product of rows from the joined tables.
-- The danger thing is that if each table has 1,000 rows, you will get 1,000 x 1,000 = 1,000,000 rows in the result set, which is huge.

-- Self Join : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement
--select a.column_name, b.column_name from table1 a, table1 b where a.common_field = b.common_field;

drop table employee;
create table employee(emp_id number, name varchar2(30), manager_id number);
insert into employee values(1, 'Rajesh', 21);
insert into employee values(21, 'Ketan', 35);
insert into employee values(35, 'Kaushal', null);
select * from employee;

-- every employee has manager, and manager has manager too
-- only person who has no manager is CEO itself
-- print employee (id, name ) -> manager(id, name)
select  a.emp_id, a.name, b.emp_id, b.name from employee a, employee b where a.manager_id = b.emp_id;
/
select a.empno, a.ename, b.deptno, b.dname, b.loc from emp a JOIN dept b ON a.deptno = b.deptno;
--
--     EMPNO ENAME      DEPTNO DNAME          LOC
------------ ------ ---------- -------------- -------------
--      7839 king           10 accounting     new_york
--      7698 blake          30 sales          chicago
--      7782 clark          10 accounting     new_york
--      7566 jones          20 research       dallas
--      7788 scott          20 research       dallas
--      7902 ford           20 research       dallas
--      7369 smith          20 research       dallas
--      7499 allen          30 sales          chicago
--      7521 ward           30 sales          chicago
--      7654 martin         30 sales          chicago
--      7844 turner         30 sales          chicago
--      7876 adams          20 research       dallas
--      7900 james          30 sales          chicago
--      7934 miller         10 accounting     new_york
--
--14 rows selected.

-- how many employees working in all deptartments (SELF JOIN Clause)
select count(dname), b.dname from emp a JOIN dept b ON a.deptno = b.deptno group by b.dname;


--COUNT(DNAME) DNAME
-------------- --------------
--           3 accounting
--           6 sales
--           5 research


commit;
/
