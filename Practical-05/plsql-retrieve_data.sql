declare 
    c_id customers.id%type := 1;
    c_name customers.name%type ;
    c_addr customers.address%type ;
    c_salary customers.salary%type;
begin
    
    select name, address, salary into c_name, c_addr, c_salary from customers where id = c_id;
    dbms_output.put_line(c_name || ' leaves ' || c_addr|| ' earns ' ||c_salary);
end;
/

desc customers;
    