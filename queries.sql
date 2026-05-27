-- Query 1: List all active students
SELECT student_id, full_name, email, batch_id, admission_date
FROM students
WHERE enrollment_status = 'active';
-- Query 2: Find students with missing or invalid email
SELECT student_id, full_name, email
FROM students
WHERE email IS NULL
   OR email = ''
   OR email NOT LIKE '%@%.%';
-- Query 3: List Easy and Medium problems
SELECT problem_id, title, difficulty, max_score
FROM problems
WHERE difficulty IN ('Easy', 'Medium');
-- Query 4: Display latest 20 submissions
SELECT submission_id, student_id, problem_id, submitted_at, status, score
FROM submissions
ORDER BY submitted_at DESC
LIMIT 20;
-- Query 5: Find unsuccessful submissions
SELECT submission_id, student_id, problem_id, status, score
FROM submissions
WHERE status != 'Accepted';
-- Query 6: Display submissions with student and problem details
SELECT s.submission_id,
       st.full_name,
       p.title,
       s.language,
       s.status,
       s.score,
       s.submitted_at
FROM submissions s
JOIN students st ON s.student_id = st.student_id
JOIN problems p ON s.problem_id = p.problem_id;
-- Query 7: Display all students and their enrollments including non-enrolled students
SELECT st.student_id,
       st.full_name,
       e.course_id,
       e.enrollment_status
FROM students st
LEFT JOIN enrollments e
ON st.student_id = e.student_id;
-- Query 8: Display courses with enrolled student count
SELECT c.course_id,
       c.course_title,
       COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY student_count DESC;
-- Query 9: Display test case results with student and problem details
SELECT tr.result_id,
       st.full_name,
       p.title,
       tr.result_status,
       tr.awarded_points
FROM test_results tr
JOIN submissions s ON tr.submission_id = s.submission_id
JOIN students st ON s.student_id = st.student_id
JOIN problems p ON s.problem_id = p.problem_id;
-- Query 10: Students enrolled in a course but never submitted for that course
SELECT DISTINCT st.student_id, st.full_name
FROM students st
JOIN enrollments e ON st.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE NOT EXISTS (
    SELECT 1
    FROM submissions s
    JOIN problems p ON s.problem_id = p.problem_id
    WHERE s.student_id = st.student_id
      AND p.course_id = e.course_id
);
-- Query 11: Count submissions by status
SELECT status, COUNT(*) AS total_submissions
FROM submissions
GROUP BY status
ORDER BY total_submissions DESC;
-- Query 12: Average score per problem
SELECT p.problem_id,
       p.title,
       AVG(CAST(s.score AS INTEGER)) AS avg_score
FROM submissions s
JOIN problems p ON s.problem_id = p.problem_id
GROUP BY p.problem_id, p.title
ORDER BY avg_score DESC;
-- Query 13: Students with more than 10 submissions
SELECT st.student_id,
       st.full_name,
       COUNT(s.submission_id) AS submission_count
FROM students st
JOIN submissions s ON st.student_id = s.student_id
GROUP BY st.student_id, st.full_name
HAVING COUNT(s.submission_id) > 10
ORDER BY submission_count DESC;
-- Query 14: Problems with success rate below 40%
SELECT p.problem_id,
       p.title,
       ROUND(
           100.0 * SUM(CASE WHEN s.status = 'Accepted' THEN 1 ELSE 0 END) / COUNT(*),
           2
       ) AS success_rate
FROM submissions s
JOIN problems p ON s.problem_id = p.problem_id
GROUP BY p.problem_id, p.title
HAVING success_rate < 40
ORDER BY success_rate ASC;
-- Query 15: Top 10 most attempted problems
SELECT p.problem_id,
       p.title,
       COUNT(s.submission_id) AS attempts
FROM submissions s
JOIN problems p ON s.problem_id = p.problem_id
GROUP BY p.problem_id, p.title
ORDER BY attempts DESC
LIMIT 10;
-- Query 16: Students above overall average score
SELECT st.student_id,
       st.full_name,
       AVG(CAST(s.score AS INTEGER)) AS avg_score
FROM students st
JOIN submissions s ON st.student_id = s.student_id
GROUP BY st.student_id, st.full_name
HAVING avg_score > (
    SELECT AVG(CAST(score AS INTEGER))
    FROM submissions
);
-- Query 17: Problems never attempted
SELECT p.problem_id, p.title
FROM problems p
WHERE p.problem_id NOT IN (
    SELECT DISTINCT problem_id
    FROM submissions
);
-- Query 18: Students enrolled but never submitted
SELECT st.student_id, st.full_name
FROM students st
WHERE st.student_id IN (
    SELECT DISTINCT student_id FROM enrollments
)
AND st.student_id NOT IN (
    SELECT DISTINCT student_id FROM submissions
);
-- Query 19: Students who submitted in both Python and Java
SELECT st.student_id, st.full_name
FROM students st
WHERE st.student_id IN (
    SELECT student_id FROM submissions WHERE language = 'Python'
)
AND st.student_id IN (
    SELECT student_id FROM submissions WHERE language = 'Java'
);
-- Query 20: Second highest score for selected problem
SELECT DISTINCT CAST(score AS INTEGER) AS score
FROM submissions
WHERE problem_id = 'P0001'
ORDER BY score DESC
LIMIT 1 OFFSET 1;