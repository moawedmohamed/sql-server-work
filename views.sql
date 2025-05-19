
USE eStore
GO

-- View for customers
CREATE VIEW view_customers AS
SELECT * FROM customers;
GO

-- View for products
CREATE VIEW view_products AS
SELECT * FROM products;
GO


-- View for orders
CREATE VIEW view_orders AS
SELECT * FROM orders;
GO

-- View for order_items
CREATE VIEW view_order_items AS
SELECT * FROM order_items;
GO


-- View for payments
CREATE VIEW view_payments AS
SELECT * FROM payments;
GO

SELECT * FROM view_payments

-- View for admin
CREATE VIEW view_admin AS
SELECT * FROM admin;    
GO

-- View for cart_items
CREATE VIEW view_cart_items AS
SELECT * FROM cart_items;
GO

-- View for wishlist_items
CREATE VIEW view_wishlist_items AS
SELECT * FROM wishlist_items;
GO

select * FROM view_orders

CREATE VIEW VIEW_all_tables AS
SELECT o.order_id,
        c.name AS customer_name,
        p.name AS product_name,
        oi.quantity,
        oi.price,
        (oi.quantity*oi.price) AS totat_price,
        o.status
FROM order_items oi 
JOIN orders o on oi.order_id=o.order_id
JOIN customers c ON o.customer_id=c.customer_id
JOIN products p ON p.product_id=oi.product_id;

SELECT * FROM VIEW_all_tables;


