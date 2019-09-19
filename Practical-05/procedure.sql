set serveroutput on;

--dbms_output is class and put_line is static method of that class

-- A) Creation of Procedure Type I
create or replace procedure demo
as -- or "is"
begin
    dbms_output.put_line('This is my first procedure');
end;
/

--First way
execute demo; -- brackets are optional
execute demo();
-- or you can use
call demo(); -- brackets are must\
/

-- second way
begin
    demo();
end;
/

-- B) Creation of Procedure Type II 
declare
    procedure demo
        as 
        begin
            dbms_output.put_line('This is my first procedure');
        end;
begin
    demo();
end;
/



create or replace procedure demo_2
as
   -- no need of "declare" 
        x number:=60;
    begin
        dbms_output.put_line(x);
    end;
/
call demo_2();






--3 types of parameters
--IN (default if not mentioned)
--OUT 
--IN OUT


-- Single Parameter Procedure
create or replace procedure demo2(x in number)
as
begin
dbms_output.put_line('Passed Arguments '||x);
end;
/

call demo2(5);
call demo2('c'); -- error Specify a valid number
call demo2('String'); -- error Specify a valid number


-- Multiple Parameter Procedure
create or replace procedure demo3(x number, y number, z number)
as
begin
dbms_output.put_line('Passed Arguments '||x||', '||y||' and '||z);
end;
/

call demo3(10, 20, 30); -- three

-- IN, OUT Variable

declare
    x number:=10;
    y number:=15;
    z number:=0;
    procedure findMax(x in number, y in number, z out number)
    as
    begin
        if x > y then
            z:=x;
       else 
            z:=y;
        end if;
    end;
begin
    findMax(x, y, z);
    dbms_output.put_line('the greatest number is: '||z);
end;
/
            

-- using select statement
create table procedure_nums (x number);
insert into procedure_nums values(40);
insert into procedure_nums values(10);
insert into procedure_nums values(140);
insert into procedure_nums values(80);
insert into procedure_nums values(20);
insert into procedure_nums values(60);
select * from procedure_nums
/

drop table nums;
create table nums(num number primary key, name varchar2(30));
insert into nums values (10, 'A');
insert into nums values (40, 'B');
insert into nums values (60, 'D');
insert into nums values (80, 'E');
insert into nums values (20, 'Z');
select * from nums;
/


declare
    n1 nums.name%type;

    procedure aggr (p IN nums.num%type, n OUT nums.name%type )
    as
        begin
            select name into n from nums where num = p;
        end;
        
begin
    aggr(40, n1);
    dbms_output.put_line(n1);
end;
/

create or replace procedure insertRow( num number, str varchar2)
as
begin
    insert into nums values(num, str);
end;
/
call insertRow(12, 'SAMPLE');
select * from nums;

/
create or replace procedure updateRow( num2 number, str varchar2)
as
begin
    update nums set name= str where num = num2;
end;
/
select * from nums;
call updateRow(12, 'Change');
select * from nums;
/

drop table nums2;
create table nums2(num number primary key, name varchar2(30), B number);
insert into nums2 values (10, 'A', 1000);
insert into nums2 values (40, 'B', 2000);
insert into nums2 values (60, 'D', 3000);
insert into nums2 values (80, 'E', 4000);
insert into nums2 values (20, 'Z', 5000);
select * from nums2;

/
create or replace procedure updateRow( num2 number, str varchar2, A number)
as
begin
    update nums2 set name= str where num = num2 and B = A;
end;
/
select * from nums2;
call updateRow(20, 'Change', 5000);
select * from nums2;
/



