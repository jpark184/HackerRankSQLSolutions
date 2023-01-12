delimiter $$
create procedure triangle()
begin
    declare var int;
    set var = 1;
    while var < 21 do
        select repeat('* ',var);
        set var = var + 1;
    end while;
end $$
call triangle()