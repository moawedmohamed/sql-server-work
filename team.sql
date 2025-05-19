-- Create the database
CREATE DATABASE eStore;
GO

-- Use the database
USE eStore;
GO

-- Customers Table (combines user and profile data)

-- insertions 

-- customer 
INSERT INTO customers (name, email, [password], phone, address)
VALUES 
('Ahmed Ali', 'ahmed@example.com', 'hashed_password_123', '01012345678', 'Cairo, Egypt');

INSERT into customers  (name, email, [password], phone, address)
  VALUES('omer ahmed','omer@gmail.com','aliahmed12345','01200869864','paris , france')


INSERT into customers  (name, email, [password], phone, address)
  VALUES(' ahmed','ahmed@gmail.com','med12345','01200869833','paris , france')
--products info

INSERT INTO products (name, description, price, stock_quantity)
VALUES
('Samsung Phone', 'Smartphone with 6.5-inch display and 64MP camera', 5999.99, 20),
('Dell Laptop', 'Business laptop with Intel i5 and 8GB RAM', 10999.50, 10),
('Bluetooth Earbuds', 'Wireless earbuds with high sound quality', 499.99, 50);



--orders info

INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (1, GETDATE(), 499.99, 'processing');

INSERT into orders(customer_id,order_date,total_amount,[status])
VALUES (1,GETDATE(),5000,'processing')

INSERT into orders(customer_id,order_date,[status])
VALUES (2,GETDATE(),'processing')


INSERT into orders(customer_id,order_date,total_amount,[status])
VALUES (3,GETDATE(),5000,'processing')

delete from orders WHERE order_id=8;
SELECT * FROM orders

ALTER TABLE orders
DROP COLUMN total_amount;

ALTER TABLE orders
ADD total_amount DECIMAL(10,2) DEFAULT 0.00;


-- orders items info

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 5999.99),      -- 1 Samsung Phone
(1, 3, 2, 499.99);       -- 2 Bluetooth Earbuds


INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 5999.99),      -- 1 Samsung Phone
(4, 3, 2, 499.99);       -- 2 Bluetooth Earbuds

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 5999.99),      -- 1 Samsung Phone
(4, 3, 2, 499.99),       -- 2 Bluetooth Earbuds
(4, 3, 2, 499.99);  




INSERT into order_items(order_id,product_id,quantity,price)
VALUEs
(1,2,2, 10999.50+ 10999.50),
(1,1,1,99);

SELECT total_amount FROM orders;

-- payments info
INSERT INTO payments (order_id, amount, payment_method)
VALUES (1, 11599.48, 'credit_card');


-- insert into admin


--insert into wishlist_items

INSERT INTO wishlist_items (customer_id, product_id)
VALUES (2, 3); 

SELECT *
FROM sys.tables;



,

SELECT * FROM orders




-- CREATE TRIGGER mo 
-- on order_items 
-- after insert
-- AS BEGIN
-- update o 
-- SET o.total_amount=totals.total
-- FROM orders o 
-- INNER JOIN(
--   select oi.order_id ,SUM(oi.quantity*oi.price) AS total
--   FROM order_items as oi
--   INNER join inserted i on oi.order_id=i.order_id
--   GROUP BY oi.order_id
-- )as totals
-- ON o.order_id=totals.order_id
--  END;

