1.select p.product_name,(select count (s.product_id) from
sales s where s.product_id = p.product_id)* p.price as total_revenue
 from product p;
2.select p.product_name,(select count (s.product_id) from
sales s where s.product_id = p.product_id)* p.price as total_revenue
 from product p order by desc limit 3;
 3.select count(user_id) from gold_users;
4.select g.user_id as goldusers,count(s.product_id)*
(select p.price from product p where p.product_id = s.product_id) as revenue  from gold_users g inner join 
sales s on g.user_id = s.user_id group by s.product_id,g.user_id;
5. select sum(revenue)from (select g.user_id as goldusers,count(s.product_id),count(s.product_id)*
(select p.price from product p where p.product_id = s.product_id) as revenue  from gold_users g inner join 
sales s on g.user_id = s.user_id group by s.product_id,g.user_id) users  ;
6.select user_id ,current_date - signup_date as  time_duration from gold_users);
7.select g.user_id,s.product_id,count(s.product_id),(select p.product_name from product p )from gold_users
g inner join sales s on g.user_id = s.user_id group byg.user_id, s.product_id order by count(s.product_id)desc limit 1;
8.select extract (year from created_date), p.product_name,(select count (s.product_id)from sales s) 
* p.price as total_revenue from product p inner join sales s  on p.product_id = s.product_id;
10.select avg (g.user_id),avg(u.user_id)from gold_users g inner join sales s on g.user_id = s.user_id 
inner join users u on u.user_id = s.user_id;
11.select count(g.user_id)as gold_user,count(s.user_id)as place_orders from gold_users g inner join sales 
s on g.user_id = s.user_id group by g.user_id;
12.select user_id ,payment_mode,(select count(s.product_id)*p.price as total_amount from sales s inner join product p 
on s.product_id = p.product_id group by p.price ) from sales where payment_mode = 'online payment';
13.select count (user_id),payment_mode from sales group by payment_mode,user_id having
payment_mode = 'online payment';
14.select s.product_id,s.username,sum(p.price)as total_spent from sales s inner join product p on
s.product_id= p.product_id group by s.product_id,username;
15.select s.username,count(s.product_id),(select p.product_name from product p inner join
sales s on s.product_id =p. product_id) from sales s group by s.product_id,s.username
order by s.product_id limit 1;
16.select count( p.product_id ), p.product_name from product p 
 group by p.product_id,p.product_name limit 1;
 17.select g.user_id,(select product_id from sales s inner join gold_users g on s.user_id=g.user_id
 order by (created_date) asc limit 1) from gold_users g limit 1;
18.select u.user_id,(select s.product_id from sales s inner join user_name u  on s.user_id = u.user_id
order by (created_date) asc limit 1 )from user_name u limit 1;
 19.select  users.user_id,sum (orders) as total_orders,sum (amount)as total_amount from
(select u.user_id,count(s.product_id) as orders,count(s.product_id) * (select p.price from product p where p.product_id =
s.product_id ) as amount from 
user_name   u inner join sales s on u.user_id = s.user_id  
 group by u.user_id,s.product_id)users group by users.user_id ;
20. select *, rank ()over(order by user_id ) from sales 
alter table sales add column payment_mode varchar;
update sales set payment_mode ='cash payment' where user_id % 2 = 0; 



