create or replace trigger "ONCREATENEWTUPLE"
before insert or update or delete 
on customers
for each row
--when (NEW.id>0)
declare
    c_id    customers.id%type;
    c_name  customers.name%type;
    c_age   customers.age%type;
begin
    dbms_output.put_line('NEW TUPLE is gonna be INSERTED');
--    dbms_output.put_line(' id -> ' ||:NEW.id);
--    dbms_output.put_line(' age -> '||:NEW.age);
end;
/
desc customers;
/
select * from customers;
/

insert into customers values(7, 'Penan', 23, 'Maharashtra', 6000);
/
delete from customers where id = 7;
/
desc all_source;
select * from all_source where type='TRIGGER' and owner ='FLOWER' order by name;
/
alter trigger "ONCREATENEWTUPLE" enable;
alter trigger DISPLAY_SALARY_DIFF disable;
/
commit;
//




CREATE TABLE  "SUPPLIERS"   
   (    "SUPPLIER_ID" NUMBER,   
    "SUPPLIER_NAME" VARCHAR2(4000),   
    "SUPPLIER_ADDRESS" VARCHAR2(4000)  
   )  
/  
CREATE OR REPLACE TRIGGER  "SUPPLIERS_T2"   
AFTER  
insert or update or delete on "SUPPLIERS"  
for each row  
begin  
    dbms_output.put_line('NEW TUPLE is gonna be INSERTED');
end;  
/  
ALTER TRIGGER  "SUPPLIERS_T2" ENABLE  
/  
insert into SUPPLIERS values( 26, 'PENAN', 'PENAN');
/
commit;
/
select * from suppliers;
/