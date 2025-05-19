use eStore
go

-- حذف عنصر من order_items (يفترض أن order_item_id = 1)
DELETE FROM order_items
WHERE order_item_id = 1;

-- تحقق من تحديث total_amount في orders
SELECT * FROM orders
WHERE order_id IN (SELECT order_id FROM order_items WHERE order_item_id = 2);
SELECT * FROM order_items;

-- تحديث منتج معين (مثلاً المنتج رقم 5)
UPDATE products
SET price = price + 100
WHERE product_id = 5;

-- تحقق من عمود updated_at
SELECT product_id, updated_at FROM products WHERE product_id = 5;

-- to add order to order table
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, GETDATE(), 'processing');

INSERT INTO orders (customer_id, order_date, status)
VALUES (3, GETDATE(), 'pending');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES ( 4,10, 2, 1500.00); 


INSERT INTO admin (email, password, role, status)
VALUES ('moawedmohamed', '12323344543', 'admin', 'active');