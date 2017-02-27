--Query 1
select c.name, c.city
from customers c
where city in (select city
               from products p
               group by p.city
               order by count(p.city) DESC
               limit 1)
order by c.name ASC;

--Query 2
select p.name
from products p
where p.priceUSD > (select avg(p.priceUSD)
                    from products p)
order by p.name DESC;

--Query 3
select c.name, o.pid, o.totalUSD
from orders o inner join customers c on o.cid = c.cid
order by o.totalUSD ASC;

--Query 4
select c.name, coalesce(sum(o.totalUSD), 0) as "order total"
from orders o right outer join customers c on o.cid = c.cid
group by c.name
order by c.name ASC;

--Query 5
select c.name as "Customer",
       p.name as "Product",
       a.name as "Agent"
from orders o inner join customers c on o.cid = c.cid
	 		  inner join products p on o.pid = p.pid
     		  inner join agents a on o.aid = a.aid
where a.city = 'Newark'
order by c.name ASC;

--Query 6
select *
from (select o.*,
      o.qty*p.priceUSD*(1-(c.discount/100)) as actualPriceUSD
      from orders o inner join products p on o.pid = p.pid
      				inner join customers c on o.cid = c.cid) as priceCheck
where totalUSD != actualPriceUSD
order by totalUSD DESC;

--Question 7
/* The order of the two joined tables determines what information gets displayed
by the join. For example, this first query block joins orders and agents, producing
14 rows. This is because the orders table only has 14 cases where an aid is used */
select *
from orders o left outer join agents a on o.aid = a.aid
order by o.ordNumber ASC;
/* However, if you were to make this a right outer join (or flip the order of the 
tables), 15 columns are produced. This is because 1 agent, Bond, has no orders. 
But because agents is the dominant table, it needs to display all of its data. 
This results in a column with no order information, and only the information for 
agent 007. These 15 tables seen in the SQL below are the result the dominant table,
the one the join points to, being the one with all of its information displayed. */
select *
from orders o right outer join agents a on o.aid = a.aid
order by o.ordNumber ASC;
/* If their was order information with no agent, that would only be displayed 
when the join points to the order table. This is why the order of the join, as well as
which way the join points, is vital to creating these outer joins. If you simply want 
all data, full outer join will do that for you. */