-- 1. Khởi tạo cơ sở dữ liệu
CREATE DATABASE IF NOT EXISTS ss05_ex04;
USE ss05_ex04;

-- 2. Tạo các bảng 
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT, 
    order_id INT,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 3. Chèn dữ liệu mẫu 
INSERT INTO Customers (customer_name) VALUES ('Nguyễn Văn A'), ('Trần Thị B');

INSERT INTO Orders (order_date, customer_id) VALUES 
('2023-10-01', 1), 
('2023-10-02', 2);

INSERT INTO Order_items (order_id, product_name, quantity, price) VALUES 
(1, 'iPhone 15', 1, 25000000),      -- Đơn 1: 25.000.000
(1, 'Ốp lưng', 2, 500000),          -- Đơn 1: 1.000.000 (Tổng đơn 1 > 10tr)
(2, 'Chuột máy tính', 1, 200000);   -- Đơn 2: 200.000 (Tổng đơn 2 < 10tr)

-- Hiển thị mã đơn hàng, ngày đặt hàng, tên khách hàng
SELECT 
    o.order_id, 
    o.order_date, 
    c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- Hiển thị danh sách sản phẩm trong mỗi đơn hàng
SELECT 
    o.order_id, 
    oi.product_name, 
    oi.quantity, 
    oi.price
FROM Orders o
JOIN Order_items oi ON o.order_id = oi.order_id;

-- Tính tổng tiền và lọc các đơn hàng > 10.000.000
SELECT 
    o.order_id, 
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.customer_name
HAVING total_amount > 10000000;