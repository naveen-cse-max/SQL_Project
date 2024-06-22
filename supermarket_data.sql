-- Drop existing schema if it exists
DROP SCHEMA IF EXISTS super_market;
CREATE SCHEMA IF NOT EXISTS super_market;

-- User account table for customers
CREATE TABLE IF NOT EXISTS super_market.customer (
    customer_id TEXT PRIMARY KEY,
    customer_password TEXT,
    first_name TEXT,
    last_name TEXT,
    sign_up_on DATE,
    email_id TEXT
);

-- Product suppliers and distributors
CREATE TABLE IF NOT EXISTS super_market.supplier (
    supplier_id TEXT PRIMARY KEY,
    supplier_name TEXT,
    contact_info TEXT
);

-- Product categories and details
CREATE TABLE IF NOT EXISTS super_market.product (
    product_id TEXT PRIMARY KEY,
    product_code TEXT,
    product_name TEXT,
    category TEXT,
    supplier_id TEXT REFERENCES super_market.supplier (supplier_id),
    price DECIMAL(10, 2),
    stock_quantity INT,
    is_available BOOLEAN
);

-- Store staff information
CREATE TABLE IF NOT EXISTS super_market.staff (
    staff_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    staff_role TEXT,
    start_date DATE,
    last_date DATE,
    is_active BOOLEAN,
    work_shift_start TIME,
    work_shift_end TIME
);

-- Customer transactions and orders
CREATE TABLE IF NOT EXISTS super_market.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id TEXT REFERENCES super_market.customer (customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2),
    payment_status BOOLEAN
);

-- Items purchased in each order
CREATE TABLE IF NOT EXISTS super_market.order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES super_market.orders (order_id),
    product_id TEXT REFERENCES super_market.product (product_id),
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2)
);

-- Settings specific to the super market
CREATE TABLE IF NOT EXISTS super_market.settings (
    return_policy TEXT,
    loyalty_program BOOLEAN,
    store_hours TEXT
);
