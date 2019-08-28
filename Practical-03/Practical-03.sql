-----------------------------------------------------------------------------
-- NEW TOPIC
-- group by clause
select  * from employee;
select * from part_time;

drop table employees;

create table employees(
    id number,
    branch varchar2(30),
    salary number
);

desc employees;
truncate table employees;

insert into employees values(1, 'PUNE', 6500);
insert into employees values(2, 'PUNE', 2500);
insert into employees values(3, 'PUNE', 1500);
insert into employees values(4, 'PUNE', 7500);

insert into employees values(5, 'JALGAON', 1000);
insert into employees values(6, 'JALGAON', 2000);
insert into employees values(7, 'JALGAON', 3000);
insert into employees values(8, 'JALGAON', 4000);

insert into employees values(9, 'BHUSAWAL', 200);
insert into employees values(10, 'BHUSAWAL', 500);
insert into employees values(11, 'BHUSAWAL', 1000);
insert into employees values(12, 'BHUSAWAL', 2000);

select * from employees;

select branch, sum(salary), 
avg(salary), count(salary), 
min(salary), max(salary) 
from employees group by branch;

-- error 
select branch, sum(salary) from employees;

-- solution use group by clause
select branch, sum(salary) from employees group by branch;

-- also sort by branch name
select branch, sum(salary) from employees group by branch order by branch;

-- also sort by salary
select branch, sum(salary) from employees group by branch order by sum(salary);


-- order by clause
drop table student
create table sampel 

----------------------------------------------------------------------------------------
-- NEW TOPIC
-- Aggregate Function 
drop table employees;
create table employees(
    id number,
    branch varchar2(30),
    salary number
);
insert into employees values(1, 'PUNE', 6500);
insert into employees values(2, 'PUNE', 2500);
insert into employees values(3, 'PUNE', 1500);
insert into employees values(4, 'PUNE', 7500);

insert into employees values(5, 'JALGAON', 1000);
insert into employees values(6, 'JALGAON', 2000);
insert into employees values(7, 'JALGAON', 3000);
insert into employees values(8, 'JALGAON', 4000);

insert into employees values(9, 'BHUSAWAL', 200);
insert into employees values(10, 'BHUSAWAL', 500);
insert into employees values(11, 'BHUSAWAL', 1000);
insert into employees values(12, 'BHUSAWAL', 2000);


select * from employees;

-- one by one query
select sum(salary) from employees;
select avg(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;
select count(salary) from employees;

-- count can work on all datatype 
-- sum, avg, min, max, count work on number (int, float)



-- all aggregate function in one query
select sum(salary), count(salary), min(salary), max(salary), avg(salary) from employees;

-- TABLE 
create table sal (id number, lowsal number, highsal number);
truncate table sal;

insert into sal values(1000, 7000, 1000);
insert into sal values(1001, 3000, 600);
insert into sal values(1002, 1000, 8500);
insert into sal values(1003, 1500, 8000);
insert into sal values(1004, 700, 600);

select * from sal;


select avg(lowsal), avg(highsal) from sal;

-- print the salry of people who's avg(min) is greater than max salary (important query)

select highsal from sal where highsal > (select avg(lowsal) from sal); -- using nested query


select highsal from sal where highsal > avg(lowsal);

