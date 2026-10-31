use sql7challenge ;
--  1 total sales values
--calculate the total value off all order items
select 
      sum( order_items.quantity * order_items.unit_price) as total_sales
      from order_items 
      join orders 
      on order_items.order_id = orders.order_id 
      where orders.status != 'cancelled' ;
      
-- 2 revenue by product categary 
--identify which product categories generate the most sales

 select 
	products.category,
      sum( order_items.quantity * order_items.unit_price) as total_revenue
      from order_items 
      join orders 
      on order_items.order_id = orders.order_id 
      join products
      on order_items.product_id = products.product_id
      where orders.status != 'cancelled'
      group by products.category
      order by total_revenue desc ;

      
-- 3 Top 10 products by revenue 
--find the ten products generetaing highrest revenue 
 select 
	products.product_name,
      sum( order_items.quantity * order_items.unit_price) as total_revenue
      from order_items 
      join orders 
      on order_items.order_id = orders.order_id 
      join products
      on order_items.product_id = products.product_id
      where orders.status != 'cancelled'
      group by products.product_name
      order by total_revenue desc 
      limit 10;

-- 4 Monthly revenue trend 
--calculate revenue month by month 
 select 
	  monthname(orders.order_date ) as date_month,
      sum( order_items.quantity * order_items.unit_price) as total_revenue
      from order_items  
      join orders
      on order_items.order_id = orders.order_id  
      group by   monthname(order_date );

-- 5 revenue by sales channel 
--identify which sales channel generate the highest revenue
select 
      orders.channel,
      sum( order_items.quantity * order_items.unit_price) as total_sales
      from order_items 
      join orders 
      on order_items.order_id = orders.order_id 
      where orders.status != 'cancelled' 
      group by  orders.channel
      order by total_sales desc ;
      
-- 6 Total quantity sold by product categary 
--calculate the total quantity of products sold in each category 
select 
      products.category,
      count(order_items.quantity) 
      from order_items
      join products
       on order_items.product_id = products.product_id
      group by products.category ;
      
-- 7 payment method analysis
--count how many payments were made using each payments method 
select
      payments.payment_method as pay_me ,
      count(order_items.order_id )
      from order_items
      join payments
      on order_items.order_id = payments.order_id
      group by pay_me ;
      
-- 8 payment status analysis
--count payments by their status 
select    
        orders.status as status_pay ,
        count(orders.order_id ) as order_num
        from orders
        join payments
        on orders.order_id = payments.order_id 
        group by status_pay;
        
-- 9 average payments amount 
--calculate the average recorded payment amount 
select 
      avg(amount )
      from payments
      where payment_status = 'paid' ;
     
-- 10 payment amount by payment method
--calculate the total recorded payment amount for each payment method 
select 
      payment_method ,
      sum(amount )
      from payments 
      group by payment_method ;
      
      


      