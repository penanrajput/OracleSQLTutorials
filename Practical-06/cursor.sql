DECLARE 
   c_id customers.id%type; 
   c_name customerS.Name%type; 
   c_addr customers.address%type; 
   CURSOR c_customers is 
      SELECT id, name, address FROM customers; 
BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into c_id, c_name, c_addr; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
   END LOOP; 
   CLOSE c_customers; 
END; 
/

clear screen;
/

desc customers;
/
declare
cust_name customers.name%type;
cust_id customers.id%type;
cust_addr customers.address%type;
cust_salary customers.salary%type;

cursor cust_info is select id, name, address, salary from customers;
begin

    open cust_info;
    loop 
        fetch cust_info into cust_id, cust_name, cust_addr, cust_salary;
        exit when cust_info%notfound;
        dbms_output.put_line('Hello, ' || cust_name);
        dbms_output.put_line('id ' || cust_id || ',  address -> '||cust_addr||',  salary -> '||cust_salary);
        dbms_output.put_line('');
        
    end loop;
    close cust_info;
    
    
end;
/