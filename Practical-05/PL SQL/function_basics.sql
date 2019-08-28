 -- parameterized function
create or replace function add_three_numbers
(a NUMBER := 0, b NUMBER := 0, c NUMBER :=0)
RETURN NUMBER is 

begin
    dbms_output.put_line('a:'||a||' b:'||b||' c:'||c);
    return a+b+c;
end;
/
begin
dbms_output.put_line('Sum is -> '|| add_three_numbers(10, 15, 20));
dbms_output.put_line('Sum is -> '|| add_three_numbers(a => 10, b=> 15, c=>20));

dbms_output.put_line('Sum is -> '|| add_three_numbers(a =>10, c=> 15, b => 20));

dbms_output.put_line('Sum is -> '|| add_three_numbers(a =>10, c=> 15));
dbms_output.put_line('Sum is -> '|| add_three_numbers(10, c=> 15));
end;
/
set serveroutput ON;
clear screen;

/

select add_three_numbers(10, 20, 30) from dual; 
/
-- explicite declaration of variable
-- run on SQL Plus UI 
variable result number; 
-- using function to store output into variable
call add_three_numbers(10, 30, 40) into :result; 
select :result from dual;
select :result as money_ladder from dual;


/

commit;
/
variable result number; 