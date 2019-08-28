-- Print out of Practical 4
drop table worker;
create table worker(eid number, ename varchar2(10), city varchar2(10), state varchar2(20), salary number(5));

insert into  worker values(101, 'ROHIT', 'PATNA', 'BIHAR', 30000);
insert into  worker values(102, 'SHIVAM', 'JALANDHAR', 'PUNJAB', 20000);
insert into  worker values(103, 'KARAN', 'ALLAHABAD', 'UP', 40000);
insert into  worker values(104, 'SURAJ', 'KOLKATA', 'BENGAL', 60000);
insert into  worker values(105, 'AAKASH', 'MUMBAI', 'MAHARASHTRA', 70000);

select * from worker;

-- use for types of join
drop table customer;
create table customer (id number, name varchar2(10), age number(2), city varchar2(20));
insert into customer values(1, 'RAHUL', 28, 'JALGAON');
insert into customer values(2, 'SHIVAM', 26, 'JALANDHAR');
insert into customer values(3, 'ABHI', 25, 'BHUSAWAL');
insert into customer values(4, 'NEHA', 19, 'PUNE');
insert into customer values(5, 'SNEHAL', 53, 'MUMBAI');
select * from customer;

drop table purchase;
create table purchase (pid number(3), cid number(1), city varchar2(20), amount varchar2(4));
insert into purchase values(501, 1, 'JALGAON', 3000);
insert into purchase values(502, 3, 'BHUSAWAL', 4000);
insert into purchase values(503, 5, 'MUMBAI', 1000);
insert into purchase values(504, 1, 'JALGAON', 500);
insert into purchase values(505, 7, 'BHOPAL', 2500);

select * from emp order by empno;
alter table emp drop primary key;
truncate table emp;
alter table emp add constraint empno_pk primary key (empno);
insert into emp values(7839, 'king', 'president', 0, '17-nov-81', 5000, 0, 10);
insert into emp values(7698, 'blake', 'manager', 7839, '01-may-81', 2850, 0, 30);
insert into emp values(7782, 'clark', 'manager', 7839, '09-jun-81', 2450, 0, 10);
insert into emp values(7566, 'jones', 'manager', 7839, '02-apr-81', 2975, 0, 20);
insert into emp values(7788, 'scott', 'analyst', 7566, '09-dec-82', 3000, 0, 20);
insert into emp values(7902, 'ford', 'analyst', 7566, '03-dec-81', 3000, 0, 20);
insert into emp values(7369, 'smith', 'clerk', 7902, '17-dec-80', 800, 0, 20);
insert into emp values(7499, 'allen', 'salesman', 7698, '20-feb-81', 1600, 300, 30);
insert into emp values(7521, 'ward', 'salesman', 7698, '22-feb-81', 1250, 500, 30);
insert into emp values(7654, 'martin', 'salesman', 7698, '28-sep-81', 1250, 1400, 30);
insert into emp values(7844, 'turner', 'salesman', 7698, '08-sep-81', 1500, 0, 30);
insert into emp values(7876, 'adams', 'clerk', 7788, '12-jan-83', 1100, 0, 20);
insert into emp values(7900, 'james', 'clerk', 7698, '03-dec-81', 950, 0, 30);
insert into emp values(7934, 'miller', 'clerk', 7782, '23-jan-82', 1300, 0, 10);

drop table dept;
select * from dept;
CREATE TABLE dept(
  deptno NUMBER(2,0),
  dname  VARCHAR2(14),
  loc    VARCHAR2(13),
  CONSTRAINT pk_dept PRIMARY KEY (deptno));
insert into dept values(10, 'accounting', 'new_york');
insert into dept values(20, 'research', 'dallas');
insert into dept values(30, 'sales', 'chicago');
insert into dept values(40, 'operations', 'boston');

--https://oracle-base.com/articles/misc/sql-for-beginners-the-insert-statement

/
select * from emp;
commit;
/
CREATE TABLE salgrade(
  grade NUMBER,
  losal NUMBER,
  hisal NUMBER
);

INSERT INTO salgrade VALUES (1, 700, 1200);
INSERT INTO salgrade VALUES (2, 1201, 1400);
INSERT INTO salgrade VALUES (3, 1401, 2000);
INSERT INTO salgrade VALUES (4, 2001, 3000);
INSERT INTO salgrade VALUES (5, 3001, 9999);

COMMIT;

-- 
CREATE TABLE exercise_logs(
    id NUMBER PRIMARY KEY ,
    type VARCHAR2(20),
    minutes NUMBER, 
    calories NUMBER,
    heart_rate NUMBER);


INSERT INTO exercise_logs(id, type, minutes, calories, heart_rate) VALUES (1, 'biking', 30, 100, 110);
INSERT INTO exercise_logs(id, type, minutes, calories, heart_rate) VALUES (2, 'biking', 10, 30, 105);
INSERT INTO exercise_logs(id, type, minutes, calories, heart_rate) VALUES (3, 'dancing', 15, 200, 120);

SELECT * FROM exercise_logs;
commit;

--

drop table if exists student;
create table student (
  id int(2) not null primary key,
  name varchar(30) not null,
  age varchar(2) not null,
  address varchar(400),
  salary decimal(10, 2),
  
);

desc student;

insert into student values(6, "PENAN", 20, "CHOPDA", 42000);
insert into student values(2, "RAJ", 25, "LA", 1200);
insert into student values(3, "JOHN", 30, NULL, 20000);
insert into student values(4, "KAPOOR", 35, NULL, NULL);
insert into student values(5, "ABC", 40, "USA", null );
select * from student;

