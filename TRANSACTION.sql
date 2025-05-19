USE estore;
GO

BEGIN TRANSACTION;

BEGIN TRY
    -- إضافة طلب
    INSERT INTO orders (customer_id, order_date, status)
    VALUES (2, GETDATE(), 'processing');

    DECLARE @order_id INT = SCOPE_IDENTITY();

    -- إضافة عناصر الطلب
    INSERT INTO order_items (order_id, product_id, quantity, price)
    VALUES (@order_id, 5, 2, 999.99);

    INSERT INTO order_items (order_id, product_id, quantity, price)
    VALUES (@order_id, 6, 1, 4999.00);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;


-- فهرس على الأعمدة المستخدمة كثيرًا في WHERE أو JOIN
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

CREATE INDEX idx_order_items_order_product ON order_items(order_id, product_id);

CREATE INDEX idx_cart_items_customer_product ON cart_items(customer_id, product_id);

CREATE INDEX idx_products_name ON products(name);

CREATE INDEX idx_wishlist_customer_product ON wishlist_items(customer_id, product_id);


SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * FROM orders WHERE customer_id = 1;


DROP INDEX idx_orders_customer_id ON orders;
SELECT * FROM orders WHERE customer_id=1;