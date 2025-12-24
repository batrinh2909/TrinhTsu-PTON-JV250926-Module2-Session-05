-- 1. Tạo và sử dụng Database
CREATE DATABASE IF NOT EXISTS ss05_ex02;
USE ss05_ex02;

-- 2. Tạo bảng employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(15, 2)
);

-- 3. Chèn dữ liệu mẫu 
INSERT INTO employees (full_name, department, salary) VALUES
('Nguyen Van A', 'IT', 15000000),
('Le Thi B', 'IT', 13000000),
('Tran Van C', 'IT', 14000000),
('Pham Van D', 'IT', 11000000), 
('Hoang Thi E', 'HR', 10000000),
('Do Van F', 'HR', 9000000),    
('Bui Van G', 'Sales', 18000000),
('Ngo Thi H', 'Sales', 15000000),
('Ly Van I', 'Sales', 17000000); 

SELECT 
    department, 
    COUNT(emp_id) AS total_employees, 
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 3 AND AVG(salary) > 12000000;