1)
select city
from agents
where aid in (select aid
              from orders
              where cid = 'c006'
              )
order by city ASC;

select distinct pid
from orders
where aid in (select aid
              from orders
              where cid in (select cid
                            from customers
                            where city = 'Kyoto'
                            )
              )
order by pid DESC;

select cid, name
from customers
where cid not in (select distinct cid
                  from orders
                  where aid = 'a01'
                 )
order by cid ASC;

select distinct cid
from orders
where cid in(select cid
             from orders
             where pid in ('po1', 'p07')
             )
order by cid ASC;

select distinct pid
from orders
where cid not in(select cid
                 from orders
                 where aid = 'a08'
                 )
order by pid DESC;
               
select name, discount, city
from customers
where cid in(select cid
             from orders
             where aid in(select aid
                          from agents
                          where city in('Tokyo', 'New York')
                          )
             )
order by name ASC;

select *
from customers
where discount in(select discount
                  from customers
                  where city in('Duluth', 'London')
                  )
order by cid ASC;

/* Check constraints enforce rules you establish on a database level.
This means they're nearly impossible to break, so your database will
be created using these rules and nothing can be added that breaks these rules.
The easiest example of a constraint is NOT NULL, which is useful to put in
a primary key collumn, or another collumn where data is completely necessary.
Most other constraints are established after the code. For example, in a clients
tables, the code "age	int check(age>=18)" would allow you to be sure no clients
under the age of 18 utilizes your business. This would be appropriate, as that
restriction will mostly likely never update. However, something like "ordertype
char(20) check(ordertype = 'clothing' or ordertype = 'footwear')" would be 
inappropriate use of constraints, becuase it is very likely that the business
could increase it's product line to include new things. This demonstrates the power
of check constraints. When something is static, or mostly likely not going to change,
establishing the constraint will make sure the database is always set up uniformly
with the proper data. However, these constraints can limit more fluid or diverse data
fields, so they must be used appropriately, or the database will become obsolete. */