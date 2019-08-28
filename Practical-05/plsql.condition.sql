declare 
    a number;
    b number;
    c number;
procedure findmax(fno in number, sno in number, tno out number) is
begin
    if fno < sno then
        tno := fno;
    else
        tno := sno;
    end if;
end;
    
begin
    a := 23;
    b := 45;
    findmax(a,b,c);
    dbms_output.put_line('Min of (23, 45) is '||c);
end;
/
