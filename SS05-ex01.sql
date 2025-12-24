-- 1. Tạo và sử dụng Database
CREATE DATABASE IF NOT EXISTS `SS05-ex01`;
USE `SS05-ex01`;

-- 2. Tạo bảng students
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    birth_year INT,
    gender BIT(1),
    score DECIMAL(4, 2)
);

SELECT * FROM Students;

-- 3. Chèn dữ liệu mẫu (để kiểm tra kết quả)
INSERT INTO students (full_name, birth_year, gender, score) VALUES
('nguyen van a', 2003, 1, 8.567),
('tran thi b', 2005, 0, 7.214),
('le van c', 2002, 1, 9.050),
('pham thi d', 2004, 0, 6.888);

-- Hiển thị mã sinh viên và họ tên viết hoa
SELECT 
    student_id, 
    UPPER(full_name) AS full_name_uppercase 
FROM students;

-- Hiển thị họ tên và số tuổi (dựa trên năm hiện tại)
SELECT 
    full_name, 
    (YEAR(CURDATE()) - birth_year) AS age 
FROM students;

-- Yêu cầu 3: Hiển thị điểm trung bình làm tròn 1 chữ số thập phân
SELECT 
    full_name, 
    ROUND(score, 1) AS rounded_score 
FROM students;

-- Yêu cầu 4: Hiển thị tổng số sinh viên, điểm cao nhất, điểm thấp nhất
SELECT 
    COUNT(*) AS total_students, 
    MAX(score) AS highest_score, 
    MIN(score) AS lowest_score 
FROM students;