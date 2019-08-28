
-- 
-- Theory 
-- there are three  type to declare constraints
--1. constraints with name
--2. constraints without name
--3. constraints with name, and without name
--
--Types of constraints
--1. Primary key
--2. foreign key
--3. check
--4. not null
--5. unique
--6. default
--
-- single constraint attribute
-- multiple constraint attribute
--
--then we will 
--insert wrong values
--insert right values
--add constraints
--drop constraints
--
---- new type 
--user_cons_columns - owned by the current user
--user_constraints - owned by the current user
--
--
--Using Foreign key
--1. Creating Relation ( Parent - Child )
--2. Deleting value from Parent Table
--3. Deleting value from child table
--

-- table with not name to constraint
create table persons(p_id number not null, firstname varchar2(20) not null, lastname varchar2(20) not null, address varchar2(25), city varchar2(15));
desc persons;
insert into persons values(1, 'Iron', 'Man', 'Washington DC', 'USA'); -- success
insert into persons values(null, 'Peter', 'Parker', 'LA', 'USA'); -- can't insert because of 'not null' constraint
select * from persons;

--drop constraints
drop constraint p_id; -- wrong syntax
alter table persons drop constraint p_id_nn;

-- rename constraint f_n_nn to fn_n_nn
alter table persons rename constraint f_n_nn to fn_n_nn;
select constraint_name, table_name from user_cons_columns where owner='FLOWER' and table_name = 'PERSONS'; -- use tablename ,owner in CAPITAL LETTERS

-- add constraint p_id_nn to attribute p_id_nn
desc persons;
alter table persons add constraint p_id_nn unique (p_id);

-- warning to add not null we use modify
desc persons;
alter table persons drop constraint p_id_nn;
alter table persons modify (p_id  not null);  -- named not null not possible -- to add constraint not null without name
alter table persons modify (p_id  null);    -- to add constraint null without name
desc persons;
alter table persons add constraint p_id_nn check(p_id is not null); -- only way possible to add constaint name for check to restrict null values
insert into persons values(null, 'Akshay', 'Roy', 'LA', 'USA'); -- not possible


-- Types of Constraints
-- 1. UNIQUE - null accepted, repeat not accepted
drop table persons;
create table persons(p_id number constraint p_id_u unique, firstname varchar2(20) , lastname varchar2(20) , address varchar2(25), city varchar2(15));
desc persons;
insert into persons values(null, 'Akshay', 'Roy', 'LA', 'USA'); -- not possible
insert into persons values(1, 'Raj', 'Malhotra', 'USA', 'USA');
insert into persons values(1, 'Ram', 'Kapoor', 'Washington DC', 'USA'); -- unique constraint violated

-- 2. NOT NULL - repeat accepted 
drop table persons;
create table persons(p_id number, firstname varchar2(20) not null , lastname varchar2(20) , address varchar2(25), city varchar2(15));
desc persons;
insert into persons values(1, 'Raj', 'Malhotra', 'USA', 'USA'); -- accepted
insert into persons values(1, 'Raj', 'Kapoor', 'Washington DC', 'USA'); -- accepted
insert into persons values(1, null, 'Malhotra', 'Melbourne', 'USA');  -- not accepted because null not accepted

-- 3. Check -- checks for particular condition
-- you can disable it on time of creation and later on  enable it
-- it doesn't seen in 'select * from table_name' 
-- can have constraint name

-- check(city = 'USA')
drop table persons;
create table persons(p_id number, firstname varchar2(20) , lastname varchar2(20) , address varchar2(25), city varchar2(15), constraint city_USA check(city = 'USA'));
insert into persons values(1, 'Raj', 'Malhotra', 'USA', 'USA');
insert into persons values(1, 'Raj', 'Kapoor', 'Washington DC', 'UAE'); -- not accepted -> city is not USA


-- check(p_id between 1 and 10)
drop table persons;
create table persons(p_id number, firstname varchar2(20) , lastname varchar2(20) , address varchar2(25), city varchar2(15), constraint id_check check(p_id between 1 and 10));
insert into persons values(1, 'Raj', 'Malhotra', 'USA', 'USA');
insert into persons values(9, 'Raj', 'Kapoor', 'Washington DC', 'UAE');
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA'); -- not accepted  -> id is not between 1 and 10

-- check(city in ('Bhusawal', 'Jalgaon', 'Pune')
drop table persons;
create table persons(p_id number, firstname varchar2(20) , lastname varchar2(20) , address varchar2(25), city varchar2(15), constraint city_check check(city in ('Bhusawal', 'Jalgaon', 'Pune')));
desc persons;
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA'); -- error
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'Jalgaon'); -- accepted

--CHECK (Age>=18)
drop table persons;
create table persons(p_id number, firstname varchar2(20) , lastname varchar2(20) , address varchar2(25), city varchar2(15), constraint id_check check(p_id >= 30));
desc persons;
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA'); -- error 11 is not greater or equal to 30
insert into persons values(31, 'Ram', 'Malhotra', 'Melbourne', 'Jalgaon'); -- accepted 31 is greater than or equal to 30

-- CHECK (Age>=18 AND City='JALGAON')
drop table persons;
create table persons(p_id number, firstname varchar2(20) , lastname varchar2(20) , address varchar2(25), city varchar2(15), constraint id_check check(p_id >= 30 AND city='JALGAON'));
desc persons;
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA'); -- error 11 is not greater or equal to 30
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA'); -- error 11 is not greater or equal to 30

-- DISABLE check constraint
-- ALTER TABLE table_name
-- ENABLE CONSTRAINT constraint_name;
alter table persons disable constraint id_check;
desc persons;
alter table persons enable constraint id_check;

-- what if we tried to violate the check constraint by disabling it and insertinng new tuple 
alter table persons disable constraint id_check;
desc persons;
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA'); -- now you can insert
alter table persons enable constraint id_check; -- you can't apply because it is already violated
insert into persons values(12, 'Bharat', 'Malhotra', 'Melbourne', 'USA'); 

--default -> set default value for attribute
drop table persons;
create table persons (p_id number, firstname varchar2(30), lastname varchar2(30), address varchar2(30), city varchar2(30) default 'Bhusawal' );
desc persons;
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA');
insert into persons values(12, 'Bharat', 'Malhotra', 'Melbourne', default); -- default = 'Bhusawal'
select * from persons;

-- primary key 
-- uniquely identifies each column in table
-- unique + not null
drop table persons;
create table persons (p_id number constraint p_id_pk2 primary key, firstname varchar2(30), lastname varchar2(30), address varchar2(30), city varchar2(30));
desc persons;
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA');
insert into persons values(11, 'Bharat', 'Malhotra', 'Melbourne', 'SURAT');  -- not accepted 
insert into persons values(null, 'Bharat', 'Malhotra', 'Melbourne', 'SURAT');  -- not accepted 
select * from persons;
alter table persons drop primary key; -- we can directly drop the primary key without using its name
desc persons;

-------------------------------------------------------------------------------------------------------------
-- foreign key
drop table empl;
create table empl (e_id number constraint e_id_fk references persons(p_id), e_firstname varchar2(30));
desc empl;
select * from empl;
select * from persons;

insert into empl values(11, 'Ram'); -- can't insert in child table, because not in parent table
insert into persons values(11, 'Ram', 'Malhotra', 'Melbourne', 'USA');
insert into empl values(11, 'Ram'); -- it only inserts if it exists in parent table

delete from persons where p_id = 11; -- error
delete from empl where e_id = 11;   -- first delete from child table
delete from persons where p_id = 11; -- done

--parent table      ->          child table
--(primary key)     ->          (foregin key)
--if tuple is in parent table, then you can insert into child table
--if tuple is not parent table, then you can not insert into child table

--if tuple in parent table and in child table, then you can not delete from parent table, but can delete from child table
--but once you delete from child table, you can't delete from child table
--------------------------------------------------------------------------------------------
drop table persons;
create table persons (
    id number constraint id_pk_2 primary key, 
    name varchar2(30) constraint name_nn_2 not null, 
    phone number(10) constraint phone_uniq_2 unique, 
    gender char(1) constraint gender_nn_2 not null, 
    age number constraint age_check_2 check (age > 18), 
    city varchar2(30) default 'Jalgaon'
);
desc persons;
select * from persons;
insert into persons values(1, 'PENAN', 7020140334, 'M', 19, default);


-- know the constraints
desc user_cons_columns;
desc user_constraints;
select constraint_name, table_name 
from user_cons_columns 
where owner='FLOWER' and table_name = 'PERSONS'; -- caution -> use tablename ,owner in CAPITAL LETTERS



TABLE WITH MULTIPLE CONSTRAINTS
-- above

TABLE WITH MULTIPLE CONSTRAINTS and multiple at a time for one attribute
drop table persons;
create table persons (
    id number constraint id_pk_2 primary key, 
    name varchar2(30) constraint name_nn_2 unique not null, 
    phone number(10) constraint phone_uniq_2 unique not null, 
    gender char(1) constraint gender_nn_2 not null check(gender in ('F', 'M')), 
    age number constraint age_check_2 check (age > 18), 
    city varchar2(30) default 'Jalgaon',
    state varchar2(30) constraint state_nn_2 unique not null check(state in ('Maharashtra', 'Gujrat', 'Pune'))
);
desc persons;