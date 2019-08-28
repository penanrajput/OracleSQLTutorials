--The advantages of a view are many. Views hide data complexity—a senior analyst can define
--a view containing the EMPLOYEE, DEPARTMENT, and SALARY tables to make it easier for upper
--management to retrieve information about employee salaries by using a SELECT statement against
--what appears to be a table but is actually a view containing a query that joins the EMPLOYEE,
--DEPARTMENT, and SALARY tables.

create table employee ( emp_name varchar2(30), street varchar2(30), city varchar2(30));
create table part_time ( emp_name varchar2(30), salary number);

insert into employee values('A', 'Ram Nagar', 'Bhusawal');
insert into employee values('B', 'Laxman Nagar', 'Jalgaon');
insert into employee values('C', 'Bharat Nagar', 'Yawal');
insert into employee values('D', 'Krishna Nagar', 'Indore');
insert into employee values('K', 'RamKrishna Nagar', 'Nandurbar');



insert into part_time values('A', 3000);
insert into part_time values('B', 5000);
insert into part_time values('D', 7000);
insert into part_time values('E', 2000);



select * from table_view;

select * from part_time;
select * from employee;
desc employee;
desc part_time;


create view employee_info as
    select employee.emp_name as "EMP_NAME", part_time.emp_name as "PART_TIME EMP_NAME", street, city, salary 
    from employee FULL OUTER JOIN part_time on employee.emp_name = part_time.emp_name;

drop view employee_info;

select * from employee_info;

select employee.emp_name, part_time.emp_name, street, city, salary from employee FULL OUTER JOIN part_time on employee.emp_name = part_time.emp_name;

