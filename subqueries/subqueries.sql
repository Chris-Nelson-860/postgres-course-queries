-- Using subqueries only write a statement that returns the names of those students that are taking the courses 'Physics' and 'US History'

SELECT student_name
FROM students
WHERE student_no IN(
    SELECT student_no
    FROM student_enrollment
    WHERE course_no IN(
        SELECT course_no
        FROM courses
        WHERE course_title IN('US History','Physics')
    )
);

-- Using subqueries only, write a query that returns the name of the student that is taking the highest number of courses

SELECT student_name
FROM students
WHERE student_no = (
    SELECT student_no
    FROM student_enrollment
    GROUP BY student_no
    ORDER BY count(student_no) desc
    LIMIT 1
);

-- Write a query to find the student that is the oldest.  You are NOT allowed to use LIMIT or ORDER BY to solve this problem.
SELECT student_name 
FROM students
WHERE age = (SELECT max(age) FROM students);