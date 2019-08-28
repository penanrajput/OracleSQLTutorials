    create or replace function  square 
    return number is
    total number;
    begin
        select count(*)  into total 
        from customers;
        return total;
    end;
    /
declare
    a number;   
begin
    -- a := 10;
    a := square();
    dbms_output.put_line('x = ' ||a);
end;
/



desc all_source;
/
select count(*) from all_source where owner='FLOWER' and type='FUNCTION' order by name;
/
select * from all_source where owner='FLOWER' order by name;
/
clear screen;

/
commit;
/
update customers set salary = 90000 where id = 3;