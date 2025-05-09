CREATE TABLE student (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    enrollment_date DATE,
    is_active BIT
);
-- Insert sample data
INSERT INTO student (name, age, email, enrollment_date, is_active)
VALUES 
('Alice', 20, 'alice@example.com', '2024-09-01', 1),
('Bob', 22, 'bob@example.com', '2023-09-01', 1),
('Charlie', 19, 'charlie@example.com', '2025-01-15', 0),
('Aharlie', 15, 'aharlie@example.com', '2025-01-16', 0),
('Aharlie2', 5, 'aharlie2@example.com', '2025-01-10', 1);

INSERT into student  VALUEs ('Aharlie2', 5, 'aharlie2@example.com', '2025-01-10', 1);
CREATE TABLE courses
(
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100),
    credit_hours INT,
    instructor_name VARCHAR(100),
    student_id INT,
    -- المفتاح الأجنبي
    FOREIGN key (student_id) REFERENCES student (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
INSERT INTO courses
VALUES 
('Database Systems', 3, 'Dr. Mahmoud Youssef', 1),
('Web Development', 4, 'Eng. Salma Adel', 1),
('Data Analysis', 3, 'Dr. Hany Fouad', 2),
('Networks Basics', 2, 'Eng. Ayman Farid', 3),
('Software Engineering', 3, 'Dr. MonaIbrahim',2);
SELECT * from courses;
UPDATE courses SET student_id=5 WHERE course_name ='Software Engineering'
SELECT * FROM student ORDER BY name DESC , id  DESC;

UPDATE student
SET name ='moawed'
WHERE id=1;

UPDATE student
SET name ='omar',email ='omar@gmail.com'
WHERE is_active=1



UPDATE student SET name ='omar'
WHERE id IN (1, 2, 3);

DELETE from student  WHERE id =17 and name ='omar'
SELECT * FROM student

-- for make the backup for the database 
BACKUP DATABASE [hello]
TO DISK = N'/var/opt/mssql/backups/backUp.bak'
WITH FORMAT, INIT;

-- make the restore this database trhat you make backup for it 

USE master;
ALTER DATABASE [hello]
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE [hello]
FROM DISK = N'/var/opt/mssql/backups/backUp.bak'
WITH REPLACE;

ALTER DATABASE [hello]
SET MULTI_USER;

SELECT * FROM student WHERE name <> 'A%'
SELECT * FROM student WHERE email not like 'omar@gmail.%'
 
SELECT name FROM sys.databases;

SELECT name, id  FROM student ;

