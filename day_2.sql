use sql7challenge;
--1 Count the total no of orders
select count(*) as total_orders
from orders;
--2 orders status counts 
count how many orders exits for each status 
( e. g. pending , completed, cancelled ) 

select 
       status,
       count( *) 
       from orders 
       group by status; 
     
     --3 10 most recent orders retrieve the 10 latest orders by order date 
     select 
           order_date,
           status,
           order_id,
           customer_id,
           channel
           from orders 
           order by order_date desc
           limit 10 ; 
           
           
--4 10 highest-value orders 
find the 10 orders with the highest total amount 

select   
      order_id,
      sum(quantity * unit_price ) as total_sum
      from order_items 
      group by   order_id
      order by  total_sum desc 
      limit 10 ;
--5 daily order volume
count orders placed per day in chronological order 
select 
      order_date,
      count(order_id)
      from orders 
      group by order_date
      order  by order_date;
--6 monthly  order trend 
group orders by month  using date functions 
identify peak and low volume months 
select 
      date_format(order_date, '%b') as months,
      count(order_id) as total_orders
      from orders
      group by   date_format(order_date, '%b') 
      order by total_orders ; 

--LOWEST VOLUME OF ORDERS IN NOEMBER MONTHS AND PEAK ORDERS IN AUGUST MONTHS 

--7 Average order value ( rounded)
calcualte the average order amount across all orders 
round result for clean reporting 

select 
      round(avg(quantity * unit_price ), 0) as average_orders 
      from order_items; 
      
--8 Top 10 customer by order count 
rank customers based on number of orders placed 
identify most loyal and active customers
select 
      customer_id,
      customer_order,
      dense_RANK() OVER ( ORDER BY customer_order DESC ) 
      FROM (
select 
      customer_id,
      count( order_id)  as customer_order
      from orders 
      group  by  customer_id
      order by customer_order desc  ) AS P
      LIMIT 10 ;
   
      
      

           
       



