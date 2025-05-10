SELECT student ,courses,instructors,departments,enrollments
FROM student JOIN courses
ON student.id = courses.student_id
JOIN instructors 
ON student.id=instructors.instructor_id