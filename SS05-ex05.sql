-- Tạo database
CREATE DATABASE ss05_ex05;
USE ss05_ex05;

-- Tạo bảng điểm
CREATE TABLE scores (
    student_id INT,
    subject VARCHAR(50),
    score DECIMAL(4, 2)
);

-- Chèn dữ liệu
INSERT INTO scores (student_id, subject, score) VALUES
(1, 'Toán', 8.5), (1, 'Lý', 7.0), (1, 'Hóa', 9.0),
(2, 'Toán', 5.0), (2, 'Lý', 4.0), (2, 'Hóa', 6.0),
(3, 'Toán', 9.0), (3, 'Lý', 9.5), (3, 'Hóa', 10.0),
(4, 'Toán', 7.5), (4, 'Lý', 8.0), (4, 'Hóa', 7.0),
(5, 'Toán', 6.0), (5, 'Lý', 5.5), (5, 'Hóa', 6.5);

SELECT student_id, AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING average_score > 8.0;

SELECT student_id, score
FROM scores
WHERE subject = 'Toán' 
  AND score > (SELECT AVG(score) FROM scores WHERE subject = 'Toán');
  
SELECT student_id, AVG(score) AS avg_score
FROM scores
GROUP BY student_id
ORDER BY avg_score DESC
LIMIT 1;