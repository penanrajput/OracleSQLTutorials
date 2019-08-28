use college;
drop table if exists exp;
create table exp (
	name varchar(10),
	age int(2),
    
    birthdate date, -- use quotes
	salary float(4, 2),
    gender char(1),
    gpa enum('7', '8', '9') -- arguments must be strings of enum
);

desc exp;
      
-- data format YYYY-MM-DD
insert into exp values('PENAN', 20, '1999-07-02', 42.5, 'M', '7');
insert into exp values('Julia', 21, '2000-06-23', 45.5, 'F', '8');

select * from exp;
