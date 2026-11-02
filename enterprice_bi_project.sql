CREATE DATABASE enterprise_db;
use enterprise_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    country VARCHAR(50)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    product_status VARCHAR(20)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers
(customer_id, customer_name, email, gender, city, country)
VALUES
(1, 'Arun', 'arun@gmail.com', 'Male', 'Chennai', 'India'),
(2, 'Priya', 'priya@gmail.com', 'Female', 'Coimbatore', 'India'),
(3, 'Karthik', 'karthik@gmail.com', 'Male', 'Bangalore', 'India'),
(4, 'Divya', 'divya@gmail.com', 'Female', 'Madurai', 'India'),
(5, 'Rahul', 'rahul@gmail.com', 'Male', 'Salem', 'India'),
(6, 'Sneha', 'sneha@gmail.com', 'Female', 'Trichy', 'India'),
(7, 'Vijay', 'vijay@gmail.com', 'Male', 'Chennai', 'India'),
(8, 'Kavya', 'kavya@gmail.com', 'Female', 'Erode', 'India'),
(9, 'Ajay', 'ajay@gmail.com', 'Male', 'Vellore', 'India'),
(10, 'Meena', 'meena@gmail.com', 'Female', 'Tirunelveli', 'India');

INSERT INTO products
(product_id, product_name, category, price, stock_quantity, product_status)
VALUES
(1, 'Laptop', 'Electronics', 45000, 10, 'Available'),
(2, 'Mobile', 'Electronics', 15000, 20, 'Available'),
(3, 'Headphones', 'Accessories', 1500, 30, 'Available'),
(4, 'Keyboard', 'Accessories', 800, 25, 'Available'),
(5, 'Mouse', 'Accessories', 500, 40, 'Available'),
(6, 'Monitor', 'Electronics', 12000, 15, 'Available'),
(7, 'Printer', 'Electronics', 8500, 8, 'Available'),
(8, 'Tablet', 'Electronics', 20000, 12, 'Available'),
(9, 'Smart Watch', 'Accessories', 3000, 18, 'Available'),
(10, 'USB Drive', 'Storage', 600, 50, 'Available');

INSERT INTO orders
(order_id, customer_id, order_date, total_amount, payment_status, order_status)
VALUES
(1, 1, '2026-01-05', 45000, 'Paid', 'Delivered'),
(2, 2, '2026-01-08', 15000, 'Paid', 'Delivered'),
(3, 3, '2026-01-10', 2300, 'Paid', 'Delivered'),
(4, 4, '2026-01-12', 800, 'Pending', 'Processing'),
(5, 5, '2026-02-02', 500, 'Paid', 'Delivered'),
(6, 6, '2026-02-05', 12000, 'Paid', 'Shipped'),
(7, 7, '2026-02-10', 8500, 'Pending', 'Processing'),
(8, 8, '2026-02-15', 20000, 'Paid', 'Delivered'),
(9, 9, '2026-03-01', 3000, 'Paid', 'Shipped'),
(10, 10, '2026-03-05', 600, 'Pending', 'Processing');

INSERT INTO order_details
(order_detail_id, order_id, product_id, quantity, unit_price, subtotal)
VALUES
(1, 1, 1, 1, 45000, 45000),
(2, 2, 2, 1, 15000, 15000),
(3, 3, 3, 1, 1500, 1500),
(4, 4, 4, 1, 800, 800),
(5, 5, 5, 1, 500, 500),
(6, 6, 6, 1, 12000, 12000),
(7, 7, 7, 1, 8500, 8500),
(8, 8, 8, 1, 20000, 20000),
(9, 9, 9, 1, 3000, 3000),
(10, 10, 10, 1, 600, 600);

INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, amount, payment_status)
VALUES
(1, 1, '2026-01-05', 'UPI', 45000, 'Paid'),
(2, 2, '2026-01-08', 'Card', 15000, 'Paid'),
(3, 3, '2026-01-10', 'Cash', 1500, 'Paid'),
(4, 4, '2026-01-12', 'UPI', 800, 'Pending'),
(5, 5, '2026-02-02', 'Card', 500, 'Paid'),
(6, 6, '2026-02-05', 'UPI', 12000, 'Paid'),
(7, 7, '2026-02-10', 'Cash', 8500, 'Pending'),
(8, 8, '2026-02-15', 'Card', 20000, 'Paid'),
(9, 9, '2026-03-01', 'UPI', 3000, 'Paid'),
(10, 10, '2026-03-05', 'Cash', 600, 'Pending');

SELECT
    customers.customer_id,
    customers.customer_name,
    products.product_name,
    orders.order_date,
    order_details.quantity,
    order_details.subtotal
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
INNER JOIN order_details
    ON orders.order_id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.product_id;
    
  SELECT
    products.category,
    COUNT(order_details.order_detail_id) AS total_orders,
    SUM(order_details.quantity) AS total_quantity,
    SUM(order_details.subtotal) AS total_sales
FROM products
INNER JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY products.category
ORDER BY total_sales DESC;  

SELECT
    MONTH(order_date) AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY sales_month;

SELECT
    customers.customer_id,
    customers.customer_name,
    customers.city,
    COUNT(orders.order_id) AS total_orders,
    SUM(orders.total_amount) AS total_purchase
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY
    customers.customer_id,
    customers.customer_name,
    customers.city
ORDER BY total_purchase DESC;

SELECT
    customers.customer_id,
    customers.customer_name,
    SUM(orders.total_amount) AS total_purchase
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY
    customers.customer_id,
    customers.customer_name
HAVING SUM(orders.total_amount) > 10000
ORDER BY total_purchase DESC;

SELECT
    product_id,
    product_name,
    category,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
CREATE INDEX idx_product_name
ON products(product_name);
show index from products;

DELIMITER //

CREATE PROCEDURE GetSalesReport()
BEGIN
    SELECT
        order_id,
        order_date,
        total_amount,
        payment_status
    FROM orders;
END //

DELIMITER ;

CALL GetSalesReport();

DELIMITER //

CREATE TRIGGER update_stock
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

show triggers;

SELECT
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value,
    MAX(total_amount) AS highest_order,
    MIN(total_amount) AS lowest_order
FROM orders;

SELECT
    payment_method,
    COUNT(payment_id) AS total_payments,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

SELECT
    order_status,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


