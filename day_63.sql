
01. Understand order status distribution
Question: How many orders belong to each order status?
use sql7challenge ;
select 
      status,
      count(order_id)
      from orders
      group by status;
      

02. Analyze delivery status & performance
Question: How many deliveries belong to each delivery status?
select
     delivery_status,
     count(delivery_id)
     from deliveries
     group by delivery_status;
     

03. Average delivery time & long deliveries
Question: On average, how many days does a completed delivery take?
(Assumption: Delivery time is calculated as the difference 
between the order date/ship date and the actual delivery date for completed status)
select 
      avg(datediff(delivery_date,dispatch_date)) as date_diff
      from deliveries 
      where delivery_status = 'delivered';
      

04. Top 10 Longest Deliveries
Question: Which 10 delivered orders took the longest to arrive?

select 
      *,
      datediff(delivery_date,dispatch_date) as date_diff
      from deliveries
      where delivery_status = 'delivered'
      order by date_diff desc 
      limit 10 ;
      

05. Track monthly order volumes
Question: How does order volume change month by month?
 select 
	  monthname(orders.order_date ) as date_month,
      sum( order_items.quantity * order_items.unit_price) 
      from order_items  
      join orders
      on order_items.order_id = orders.order_id  
      group by   monthname(order_date ) ;
      

06. Analyze payment status distribution
Question: How are payment records distributed across statuses?
select 
      payment_status,
      count(order_id)
      from payments
      group by payment_status ;


07. Identify delayed deliveries (> 5 days)
Question: Which completed deliveries took longer than five days?
select 
      *,
      datediff(delivery_date,dispatch_date) as date_diff
      from deliveries
      where delivery_status = 'delivered'and
		datediff(delivery_date,dispatch_date) >5 
        order by date_diff desc  ;
        

08. Compare delivery performance by city
Question: Which customer cities have the longest average delivery times?
select
       customers.city ,
	    avg(datediff(deliveries.delivery_date, deliveries.dispatch_date)) as date_iff
       from deliveries
       join orders 
       on deliveries.order_id = orders.order_id
       join customers
       on customers.customer_id = orders.customer_id
       where delivery_status ='delivered'
       group by customers.city
       order by date_iff  ;
        
    
       
       
            
      

    