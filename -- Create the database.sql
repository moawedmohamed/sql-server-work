-- Create the database
CREATE DATABASE eStore;
GO

-- Use the database
USE eStore;
GO

-- Customers Table (combines user and profile data)
CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    [password] NVARCHAR(255) NOT NULL, -- Use square brackets to escape 'password' keyword
    phone NVARCHAR(20) UNIQUE NOT NULL,
    address NVARCHAR(255) NOT NULL,
    role NVARCHAR(20) DEFAULT 'customer' CHECK (role IN ('customer', 'admin')),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);
GO

-- Products Table
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX), -- Use NVARCHAR(MAX) for TEXT equivalent
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);
GO

-- Orders Table
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID
    customer_id INT NOT NULL,
    order_date DATETIME2 DEFAULT GETDATE(),
    total_amount DECIMAL(10, 2) DEFAULT 0.00,
    status NVARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled')),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);
GO

-- Order Items Table (for M:N relationship between Orders and Products)
CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL, -- Price at the time of order
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);
GO

-- Payments Table
CREATE TABLE payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID
    order_id INT NOT NULL,
    payment_date DATETIME2 DEFAULT GETDATE(),
    amount DECIMAL(10, 2) NOT NULL,
    payment_method NVARCHAR(50) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'cash_on_delivery')),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);
GO

SELECT * FROM orders



CREATE TABLE admin (
    admin_id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'admin' CHECK (role IN ('super_admin', 'admin', 'moderator')),
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'suspended')),
    created_at DATETIME2 NOT NULL DEFAULT GETDATE(),
    updated_at DATETIME2 NOT NULL DEFAULT GETDATE()
);
GO
CREATE TABLE cart_items (
    cart_item_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    added_at DATETIME2 NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY ( customer_id) REFERENCES [customers]( customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
GO
CREATE TABLE wishlist_items (
    wishlist_item_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
     product_id INT NOT NULL,
    added_at DATETIME2 NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES [customers](customer_id),
    FOREIGN KEY ( product_id) REFERENCES products( product_id)
);
GO


SELECT name FROM sys.all_objects