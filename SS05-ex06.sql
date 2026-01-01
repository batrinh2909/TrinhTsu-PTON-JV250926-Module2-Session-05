CREATE DATABASE ss05_ex06;
USE ss05_ex06;

-- 1. Bảng Khách hàng
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100)
);

-- 2. Bảng Đơn hàng
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 3. Bảng Chi tiết đơn hàng
CREATE TABLE Order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Chèn dữ liệu mẫu
INSERT INTO Customers (customer_name) VALUES ('Anh Tuấn'), ('Bảo Ngọc'), ('Minh Hoàng');

INSERT INTO Orders (order_date, customer_id) VALUES 
('2023-10-01', 1), ('2023-10-02', 1), 
('2023-10-03', 2), ('2023-10-04', 3);

INSERT INTO Order_items (order_id, product_name, quantity, price) VALUES 
(1, 'iPhone 17', 1, 1000), (1, 'Ốp lưng', 2, 20),
(2, 'MOuse', 1, 50),
(3, 'Macbook Air', 1, 1200),
(4, 'Keyboard', 1, 150), (4, 'MOusepad', 5, 10);

SELECT 
    c.customer_name, 
    o.order_id, 
    oi.product_name, 
    (oi.quantity * oi.price) AS total_item_price
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id;

SELECT 
    c.customer_name, 
    SUM(oi.quantity * oi.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;