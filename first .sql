CREATE TABLE student(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    enrollment_date DATE,
    is_active BIT
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

ALTER TABLE courses
ADD instructor_id INT,
    department_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Insert sample data
INSERT INTO student (name, age, email, enrollment_date, is_active)
VALUES 
('Alice', 20, 'alice@example.com', '2024-09-01', 1),
('Bob', 22, 'bob@example.com', '2023-09-01', 1),
('Charlie', 19, 'charlie@example.com', '2025-01-15', 0),
('Aharlie', 15, 'aharlie@example.com', '2025-01-16', 0),
('Aharlie2', 5, 'aharlie2@example.com', '2025-01-10', 1);
SELECT name
FROM sys.tables;
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
SELECT * FROM courses;
INSERT INTO courses
VALUES 
('Database Systems', 3, 'Dr. Mahmoud Youssef', 1),
('Web Development', 4, 'Eng. Salma Adel', 1),
('Data Analysis', 3, 'Dr. Hany Fouad', 2),
('Networks Basics', 2, 'Eng. Ayman Farid', 3),
('Software Engineering', 3, 'Dr. MonaIbrahim',2);

-- enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-05-09'),
(2, 2, '2025-05-09'),
(3, 3, '2025-05-09'),
(4, 4, '2025-05-09'),
(5, 5, '2025-05-09');


--departments

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Business'),
(5, 'Engineering');

--instructors
INSERT INTO instructors (instructor_id, name, email)
VALUES
(1, 'Dr. Ahmed', 'ahmed@university.edu'),
(2, 'Prof. Sara', 'sara@university.edu'),
(3, 'Dr. Omar', 'omar@university.edu'),
(4, 'Prof. Layla', 'layla@university.edu'),
(5, 'Dr. Youssef', 'youssef@university.edu');




SELECT * FROM student;
SELECT * FROM courses;
SELECT * FROM instructors;
SELECT * FROM departments;
SELECT * FROM enrollments;


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
SELECT * FROM student;

SELECT * FROM student WHERE name <> 'A%'
SELECT * FROM student WHERE email not like 'omar@gmail.%'
 
SELECT name FROM sys.databases;

SELECT name,course_name  FROM student as s,courses as c WHERE s.id=c.course_id  ;

