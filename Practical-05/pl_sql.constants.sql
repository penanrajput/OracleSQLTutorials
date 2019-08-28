declare 
    -- constant declaration
     c_name constant number :=10;
    -- normal declaration
    c_name  number :=10;
begin
    dbms_output.put_line(c_name);
--    c_name := 20;
--    dbms_output.put_line(c_name);
end;
/