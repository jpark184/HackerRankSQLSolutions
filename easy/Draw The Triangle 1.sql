delimiter $$
create procedure triangle()
begin
    declare var int;
    set var = 20;
        while var > 0 do
        select repeat('* ',var);
        set var = var - 1;
    end while;
end $$
delimiter ;

call triangle()
