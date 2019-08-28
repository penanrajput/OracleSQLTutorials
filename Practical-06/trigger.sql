create or replace trigger display_salary_diff 
before update
on customers
for each row
when (NEW.id > 0)

declare
    salary_diff number;
begin
    salary_diff := :NEW.salary - :OLD.salary;
    dbms_output.put_line('Salary OLD ' || :OLD.salary);
    dbms_output.put_line('Salary NEW ' || :NEW.salary);
    dbms_output.put_line('Salary Diff ' || salary_diff);
end;
/
select * from customers;
/
update customers set salary=10000 where name='Chaitali';
/


    
