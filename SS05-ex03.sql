-- 1. Tạo và sử dụng Database
CREATE DATABASE IF NOT EXISTS ss05_ex03;
USE ss05_ex03;

-- 2. Tạo bảng products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(15, 2)
);

-- 3. Chèn dữ liệu mẫu
INSERT INTO products (product_name, category, price) VALUES
('iPhone 6 pro max', 'Phone', 22000000),
('Samsung S26', 'Phone', 19000000),
('MacBook M100', 'Laptop', 35000000),
('Dell XPS', 'Laptop', 28000000),
('AirPods Min', 'Accessories', 5000000),
('Chuột Logitech', 'Accessories', 1200000);


-- Sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm
SELECT * FROM products 
WHERE price > (SELECT AVG(price) FROM products);

-- Sản phẩm có giá cao nhất trong từng loại sản phẩm
SELECT * FROM products AS p1
WHERE price = (
    SELECT MAX(price) 
    FROM products AS p2 
    WHERE p2.category = p1.category
);

-- Các sản phẩm thuộc loại có ít nhất một sản phẩm giá trên 20.000.000
SELECT * FROM products 
WHERE category IN (
    SELECT DISTINCT category 
    FROM products 
    WHERE price > 20000000
);