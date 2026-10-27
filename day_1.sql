CREATE database SQL7CHALLENGE ;
USE  SQL7CHALLENGE ;
CREATE TABLE customers
(customer_id int primary key ,
full_name varchar(100) not null,
email varchar(100) not null,
city varchar(50) not null,
signup_date date not null ,
segment varchar(20) not null );

create table products (
product_id int primary key ,
product_name varchar(40),
category varchar(40),
price decimal(10,2),
cost decimal(10,2) );

create table orders  (
order_id int primary key ,
customer_id int not null,
order_date date not null,
status varchar(20),
channel varchar( 20) ,
foreign key (customer_id ) references customers(customer_id) ); 

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    dispatch_date DATE NOT NULL,
    delivery_date DATE,
    delivery_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

select * from customers;
select * from orders;
select * from order_items;
select * from payments;
select * from products;
select * from deliveries;





