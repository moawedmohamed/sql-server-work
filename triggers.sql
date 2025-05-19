-- Use the database
USE eStore;
GO

CREATE TRIGGER trg_UpdateTotalAmount_AfterDelete
on order_items
after DELETE
AS BEGIN
    UPDATE o
    SET o.total_amount=t.total
    from orders
    INNER JOIN(
        SELECT oi.order_id,SUM(oi.quantity*oi.price)
        FROM order_items oi 
        INNER JOIN deleted d on oi.order_id=d.order_id
        GROUP BY oi.order_id


    )as t on o.order_id =t.order_id
END;




CREATE TRIGGER trg_update_product_timestamp
on products
after UPDATE
as 
BEGIN 
    UPDATE products
    SET updated_at = GETDATE()
    FROM products
    INNER JOIN inserted i on products.product_id=i.product_id;
END;


CREATE TRIGGER trg_reduce_stock_on_order
on order_items
after INSERT
as BEGIN

UPDATE p
SET  p.stock_quantity=p.stock_quantity-i.quantity
FROM  products p 
INNER JOIN inserted i ON  p.product_id=i.product_id
END;

SELECT * FROM products;



CREATE TRIGGER trg_UpdateTotalAmount_AfterInsert
ON order_items
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE orders
    SET total_amount = (
        SELECT SUM(quantity * price)
        FROM order_items
        WHERE order_items.order_id = orders.order_id
    )
    WHERE order_id IN (SELECT DISTINCT order_id FROM inserted);
END;


-- Trigger to update updated_at column when cart item is updated
CREATE TRIGGER trg_UpdateCartItemTimestamp
ON cart_items
AFTER UPDATE
AS
BEGIN
    UPDATE ci
    SET added_at = GETDATE()
    FROM cart_items ci
    INNER JOIN inserted i ON ci.cart_item_id = i.cart_item_id;
END;
GO

-- Trigger to update updated_at column when wishlist item is updated
CREATE TRIGGER trg_UpdateWishlistItemTimestamp
ON wishlist_items
AFTER UPDATE
AS
BEGIN
    UPDATE wi
    SET added_at = GETDATE()
    FROM wishlist_items wi
    INNER JOIN inserted i ON wi.wishlist_item_id = i.wishlist_item_id;
END;
GO

-- Trigger to update admin updated_at on update
CREATE TRIGGER trg_UpdateAdminTimestamp
ON admin
AFTER UPDATE
AS
BEGIN
    UPDATE a
    SET updated_at = GETDATE()
    FROM admin a
    INNER JOIN inserted i ON a.admin_id = i.admin_id;
END;
GO


-- for cart
CREATE TRIGGER trg_add_to_cart_after_order_item
ON order_items
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO cart_items (customer_id, product_id, quantity, added_at)
    SELECT o.customer_id, i.product_id, i.quantity, GETDATE()
    FROM inserted i
    INNER JOIN orders o ON i.order_id = o.order_id;
END;
