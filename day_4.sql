use sql7challenge ;

--Total Customers
--Count the total number of customers registered in the database.
select 
       count(customer_id )
       from customers ;
       

Q2: Customers by City
--Count the number of customers in each city and identify 
--the city with the highest customer count.
select
       city,
       count(customer_id ) 
       from customers 
       group by city 
       order by  count(customer_id ) desc 
       limit 10 ;
       

Q3: Top 10 Customers by Order Count

--Identify the top 10 customers who placed 
--the highest number of non-cancelled orders.
select 
      customer_id,
      count(order_id ) as total_order 
      from orders 
      where status != 'cancelled'
      group by customer_id 
      order by   customer_id desc 
      limit 10 ;
      

Q4: Customer Spending

--Calculate the total spending of 
--each customer based on order item values, excluding cancelled orders.
 select
       orders.customer_id,
       sum(order_items.quantity * order_items.unit_price )  as total_amount 
       from orders
       join order_items
       on orders.order_id = order_items.order_id
       where status != ' cancelled '
       group by customer_id 
       order by sum(order_items.quantity * order_items.unit_price ) desc;


Q5: Average Spending per Customer
Calculate the average spending per customer 
among customers who have placed at least one non-cancelled order.

 select
       orders.customer_id,
       count(order_items.order_id),
       avg(order_items.quantity * order_items.unit_price )  as average_cus_per_order
       from orders
       join order_items
       on orders.order_id = order_items.order_id
       where status != 'cancelled'
       group by customer_id 
       order by avg(order_items.quantity * order_items.unit_price ) desc;
  
  
Q6: Customers with More Than 5 Orders
Find customers who have placed more than five non-cancelled orders.
select 
      orders.customer_id,
      count(order_items.order_item_id) as customer_per_order
      from order_items
      join orders 
      on order_items.order_id = orders.order_id
      where orders.status != 'cancelled'
      group by orders.customer_id
      having  count(order_items.order_item_id) >5
      order by   count(order_items.order_item_id)  desc ;
      

Q7: Customer Segment Analysis
Count the number of customers in each customer segment.
select 
      segment,
      count(customer_id) 
      from customers
      group by segment;
      use sql7challenge;

Q8: Average Orders per Customer
--Calculate the average number of non-cancelled orders per customer, 
--including customers with zero qualifying orders.
select 
     customer_id,
     round(avg(customer_order),0) average_order_by_customer
from (
select 
      orders.customer_id ,
	count(order_items.order_item_id) as customer_order
    from order_items
    left join orders
    on orders.order_id = order_items.order_id
    where orders.status != 'cancelled'
    group by customer_id) t 
    group by customer_id 
    order by  customer_order desc ;
    

Q9: Top 10 Customers by Spending
Identify the top 10 customers who generated the highest item sales 
value from non-cancelled orders.
 select 
      orders.customer_id ,
	sum(order_items.quantity * order_items.unit_price) as total_sales
    from order_items
   join orders
    on orders.order_id = order_items.order_id
    where orders.status != 'cancelled'
    group by orders.customer_id 
    order by  sum(order_items.quantity * order_items.unit_price)  desc
    limit  10 ;
    

Q10: Customer Signups by Month
Count the number of new customer registrations per month and display 
the results chronologically.
select 
      monthname(signup_date) ,
      count(customer_id) as customer_signup
      from customers
      group by  monthname(signup_date) 
      order by count(customer_id)  desc ;



      