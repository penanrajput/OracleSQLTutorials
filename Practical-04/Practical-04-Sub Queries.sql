drop table stud;
drop table addr;

create table stud(
        enroll number,
        name varchar2(30));
create table addr(
        name varchar2(30),
        city varchar2(20),
        street varchar2(50));
        
insert into stud values(5, 'PENAN');
insert into stud values(10, 'SANJEEV');
insert into stud values(15, 'AKSHAY');

insert into addr values('PENAN', 'LA', 'USA');
insert into addr values('SANJEEV', 'BOSTON', 'USA');
insert into addr values('AKSHAY', 'MELBOURNE', 'USA');

--Q.1. print the name, city, street of student whose enroll number is 5
select * from addr where name = (select name from stud where enroll=5); -- correct way (prints (name, city, street)

--select * from stud, addr;
select * from stud, addr where enroll = 5; -- produces wrong results;

select * from stud, addr where enroll = 5 and stud.name= addr.name; -- right but prints (enroll, name, .name_2, city, street)

--------------------------------------------------------------------------------------------------------------
drop table loan;
drop table depositor;
drop table borrower;
drop table branch;
drop table part_time;
drop table customer;
drop table account;

create table loan(rollno number, branch varchar2(20), amount number);
create table depositor(cust_name varchar2(30), account_no number(10));
create table borrower(cust_name varchar2(30), loan_no number(10));
create table branch (city varchar2(20), branch_name varchar2(20), asset number(5, 2));
create table part_time(e_name varchar2(30), branch varchar2(30), salary number);
create table customer(c_name varchar2(30), street varchar2(30), city varchar2(30));
create table account(account_no number(10), branch varchar2(30), balance varchar2(20));

desc loan;
desc depositor;
desc borrower;
desc branch;
desc part_time;
desc customer;
desc account; 


select * from loan;
select * from depositor;
select * from borrower;
select * from branch;
select * from part_time;
select * from customer;
select * from account;

insert into loan values(101, 'Pune', 30000);
insert into loan values(102, 'Pune', 20000);
insert into loan values(103, 'Pune', 35000);
insert into loan values(104, 'Pune', 36000);
insert into loan values(105, 'Jalgaon', 36000);
insert into loan values(106, 'Jalgaon', 56000);
insert into loan values(107, 'Jalgaon', 66000);

truncate table customer;
insert into customer values('Aadesh', 'LA', 'Bhusawal');
insert into customer values('Akash', 'Boston', 'Bhusawal');
insert into customer values('Akshay', 'Melbourne', 'Jalgaon');
insert into customer values('Aadarsh', 'Oxford', 'Bhusawal');


-- Q1. select those tupes of loan realation table where branch is 'Pune'
select * from loan where branch = 'Pune';

-- Q2. Find the customers who lived in Bhusawal
select * from customer where city='Bhusawal';

-- Q3. find known rollno, amount for each customer who took loan;
select rollno, amount from loan;

-----------------------------------------------------
--SUBQUERIES
--1. NESTED QUERIES
drop table emp;
CREATE TABLE emp(
EMPNO number PRIMARY KEY,
ENAME VARCHAR2(6) NOT NULL,
JOB VARCHAR2(9) NOT NULL,
MGR number,
HIREDATE DATE NOT NULL,
SAL number NOT NULL, 
COMM number, 
DEPTNO number NOT NULL);
desc emp;
select * from emp;
truncate table emp;
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81','5000',NULL,10);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7698,'BLAKE','MANAGER','7839','01-MAY-81','2850',NULL,30);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7782,'CLARK','MANAGER','7839','09-JUN-81','2450',NULL,10);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7566,'JONES','MANAGER','7839','02-APR-81','2975',NULL,20);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7654,'MARTIN','SALESMAN','7698','28-SEP-81','1250',1400,30);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7499,'ALLEN','SALESMAN','7698','20-FEB-81','1600',300,30);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7844,'TURNER','SALESMAN','7698','08-SEP-81','1500',0,30);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7900,'JAMES','CLERK','7698','03-DEC-81','950',NULL,30);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7521,'WARD','SALESMAN','7698','22-FEB-81','1250',500,30);
INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES (7902,'FORD','ANALYST','7566','03-DEC-81','3000',NULL,20);

select * from emp;

select * from emp where ename in ('KING', 'BLAKE', 'JONES'); -- importance of in operator

-- print employee and its manager (id, name)
select a.empno, a.ename, b.empno, b.ename from emp a, emp b where a.mgr = b.empno;
select a.empno, a.ename, b.empno, b.ename from emp a JOIN emp b ON a.mgr = b.empno;
