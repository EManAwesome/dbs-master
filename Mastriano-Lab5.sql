--Query 1
select city
from orders o inner join agents a on o.aid = a.aid
where o.cid = 'c006'
order by city ASC;

--Query 2
select distinct o1.pid
from orders o inner join customers c on o.cid = c.cid
 		      and c.city = 'Kyoto'
              full join orders o1 on o1.aid = o.aid
where o.ordNumber is not null
order by pid DESC;

--Query 3
select name
from customers
where cid not in(select cid
                 from orders
                 )
order by name ASC;

--Query 4
select name
from customers c left outer join orders o on c.cid = o.cid
where o.cid is null
order by name ASC;

--Query 5
select distinct c.name,
                a.name
from customers c,
	 agents a,
     orders o
where c.city = a.city
  and o.aid = a.aid
  and o.cid = c.cid
order by c.name, a.name ASC;

--Query 6
select distinct c.name,
                a.name,
                a.city
from customers c,
	 agents a,
     orders o
where c.city = a.city
order by c.name, a.name ASC;

--Query 7
select distinct c.name, c.city
from customers c
where c.city in (select p.city
                 from products p
                 group by p.city
                 order by count(quantity) ASC
                 limit 1)
order by name ASC;