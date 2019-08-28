-- https://www.geeksforgeeks.org/sql-ddl-dml-dcl-tcl-commands/
-- DML Commands (select, delete, update, insert) -----------------------------------------------------------------------
-- create table 
drop table persons;
create table persons(p_id number, firstname varchar2(20), phone number); -- ddl commnad
desc persons;

-- create table datatype
drop table persons;
create table persons(
    p_id number, -- numbers
    SGPA number(4, 2), -- float
    name varchar2(30), -- string
    gender char(1), -- single byte character
    pass number(1, 0),
    birthday date);
desc persons;
insert into persons values(041, 9.41, 'PENAN', 'M', 1, '2-Jul-1998');
insert into persons values(042, 4.61, 'ABC', 'F', 0, '1-Jan-2000');
delete from persons where p_id = 042;
select * from persons;

-- create table like already existing table .i.e 
-- 1. create new table with same schema of existing table

-- copy schema
drop table persons1;
create table persons1 as select * from persons where 1=0;
select * from persons1;

-- copy schema and data
CREATE TABLE persons1 AS SELECT * FROM persons; 
select * from persons1;

-- copy some of attributes of persons, but not data
drop table persons1;
create table persons1 as select p_id from persons where 1=0;
desc persons1;

-- insert tuple into table
insert into persons values(101, 'KAMESH', 1011);
insert into persons values (101, 'PENAN', 1011);
insert into persons values (102, 'SANJEEV', 1012);
insert into persons values (103, 'SIDDHESH', 1013);
select * from persons;

-- delete tuple from table
delete from persons where p_id = 103;
select * from persons;

-- update tuple 
update persons set firstname = 'SANJU' where p_id = 102;
select * from persons;

-- select tuples
select p_id, firstname, phone from persons;
select p_id from persons;
select distinct p_id from persons;
select distinct p_id from persons order by p_id;

-- DDL Commands (create, drop, alter, truncate, rename) -----------------------------------------------------------------------
-- create 
create table persons(p_id number, firstname varchar2(20), phone number);

-- drop
create table persons(p_id number, firstname varchar2(20), phone number);
drop table persons;

-- truncate 
drop table persons;
create table persons(p_id number, firstname varchar2(20), phone number);
insert into persons values(101, 'KAMESH', 1011);
insert into persons values (101, 'PENAN', 1011);
insert into persons values (102, 'SANJEEV', 1012);
select * from persons;
truncate table persons;
select * from persons;



-- alter -> add, drop, modify
-- alter add
desc persons;
create table persons(p_id number, firstname varchar2(20), phone number);
alter table persons add (lastname varchar2(30)); -- by default null value 
alter table persons add (lastname varchar2(30) constraint ln_un unique); -- by default null value 
desc persons;
select * from persons;

-- alter drop 
alter table persons add (lastname varchar2(30)); 
desc persons;
alter table persons drop column lastname;
desc persons;

-- alter rename
desc persons;
alter table persons add (lastname varchar2(30)); 
alter table persons rename column lastname to fullname;
desc persons;

-- alter modify
desc persons;
alter table persons modify(fullname number);
desc persons;

-- 
--TCL(transaction Control Language) : TCL commands deals with the transaction within the database.
--Examples of TCL commands:
--
--COMMIT� commits a Transaction.
--ROLLBACK� rollbacks a transaction in case of any error occurs.
--SAVEPOINT�sets a savepoint within a transaction.
--SET TRANSACTION�specify characteristics for the transaction.

drop table persons;
create table persons (id number, name varchar2(20), age number);
desc persons;
select  * from persons; -- Initially empty
insert into persons values(1, 'PENAN', 15);
commit;

select * from persons; -- One row shown
insert into persons values(2, 'SANJEEV', 16);

select * from persons; -- Two row shown

rollback;
select * from persons; -- One Row Shown

-- SAVEPOINT means save the till date to this name 
-- after rollback the savepoint, always commit
drop table persons;
create table persons (id number, name varchar2(20), age number);
desc persons;
insert into persons values(1, 'MANAGER-1', 10);
insert into persons values(2, 'MANAGER-2', 10);
insert into persons values(3, 'MANAGER-3', 10);
insert into persons values(4, 'MANAGER-4', 20);
insert into persons values(5, 'MANAGER-5', 20);
insert into persons values(6, 'MANAGER-6', 20);
insert into persons values(7, 'MANAGER-7', 30);
insert into persons values(8, 'MANAGER-8', 30);
insert into persons values(9, 'MANAGER-9', 30);
insert into persons values(10, 'MANAGER-10',null);

savepoint e_all; -- contains all data age (10, 20, 30)

delete from persons where age = 10;
savepoint e_20_30; -- contains all data age (20, 30)

delete from persons where age = 20;
savepoint e_30; -- contains all data age (30)

delete from persons where age = 30;

savepoint e_0;-- contains all data age ()

select * from persons;

rollback to e_30; 

rollback to e_20_30;

rollback to e_all;

commit;

rollback;




-- like query
select * from emp;

--      EMPNO ENAME  JOB              MGR HIREDATE         SAL       COMM     DEPTNO
-- ---------- ------ --------- ---------- --------- ---------- ---------- ----------
--       7839 king   president          0 17-NOV-81       5000          0         10
--       7698 blake  manager         7839 01-MAY-81       2850          0         30
--       7782 clark  manager         7839 09-JUN-81       2450          0         10
--       7566 jones  manager         7839 02-APR-81       2975          0         20
--       7788 scott  analyst         7566 09-DEC-82       3000          0         20
--       7902 ford   analyst         7566 03-DEC-81       3000          0         20
--       7369 smith  clerk           7902 17-DEC-80        800          0         20
--       7499 allen  salesman        7698 20-FEB-81       1600        300         30
--       7521 ward   salesman        7698 22-FEB-81       1250        500         30
--       7654 martin salesman        7698 28-SEP-81       1250       1400         30
--       7844 turner salesman        7698 08-SEP-81       1500          0         30
--       7876 adams  clerk           7788 12-JAN-83       1100          0         20
--       7900 james  clerk           7698 03-DEC-81        950          0         30
--       7934 miller clerk           7782 23-JAN-82       1300          0         10

select * from emp where ename like '%s%';

--      EMPNO ENAME  JOB              MGR HIREDATE         SAL       COMM     DEPTNO
-- ---------- ------ --------- ---------- --------- ---------- ---------- ----------
--       7566 jones  manager         7839 02-APR-81       2975          0         20
--       7788 scott  analyst         7566 09-DEC-82       3000          0         20
--       7369 smith  clerk           7902 17-DEC-80        800          0         20
--       7876 adams  clerk           7788 12-JAN-83       1100          0         20
--       7900 james  clerk           7698 03-DEC-81        950          0         30

select * from emp where ename like '%s';

--      EMPNO ENAME  JOB              MGR HIREDATE         SAL       COMM     DEPTNO
-- ---------- ------ --------- ---------- --------- ---------- ---------- ----------
--       7566 jones  manager         7839 02-APR-81       2975          0         20
--       7876 adams  clerk           7788 12-JAN-83       1100          0         20
--       7900 james  clerk           7698 03-DEC-81        950          0         30

select * from emp where ename like '%c%t%';

--      EMPNO ENAME  JOB              MGR HIREDATE         SAL       COMM     DEPTNO
-- ---------- ------ --------- ---------- --------- ---------- ---------- ----------
--       7788 scott  analyst         7566 09-DEC-82       3000          0         20
