select * from
(
select substring_index(t1.var,"_",1) as x,substring_index(t1.var,"_",1) as y from
(
    select count(concat(x,"_",y)),concat(x,"_",y) as var from functions
    group by concat(x,"_",y)
    having count(concat(x,"_",y))>1
    order by count(concat(x,"_",y)) desc
) as t1

union

select f1.x as x,f1.y as y from functions f1
inner join functions f2
on f1.x = f2.y
where f1.x <> f2.x
and f1.y <> f2.y
and f1.x <= f1.y
) as table1
order by convert(table1.x,decimal) asc;