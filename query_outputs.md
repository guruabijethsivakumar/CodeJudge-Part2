## Query 1 - Active Students

Purpose:
List all active students with student ID, name, email, batch, and admission date.

Result Summary:
Returned 232 active students.

Sample Output:
S0001 | Vivaan Gupta | vivaan.gupta001@codejudge.edu | B002 | 2025-02-13
S0002 | Harsh Das | harsh.das002@codejudge.edu | B006 | 2025-04-08
S0004 | Ananya Bose | ananya.bose004@codejudge.edu | B003 | 2025-02-19
Total rows: 232
[('S0001', 'Vivaan Gupta', 'vivaan.gupta001@codejudge.edu', 'B002', '2025-02-13'), ('S0002', 'Harsh Das', 'harsh.das002@codejudge.edu', 'B006', '2025-04-08'), ('S0004', 'Ananya Bose', 'ananya.bose004@codejudge.edu', 'B003', '2025-02-19'), ('S0005', 'Ayaan Gupta', '', 'B004', '2025-01-27'), ('S0006', 'Isha Mehta', 'isha.mehta006@codejudge.edu', 'B001', '2025-03-14')]

Validation:
The students table contains 320 total students, so 232 active students is reasonable.
## Query 2 - Missing or Invalid Emails

Purpose:
Find students whose email is missing or incorrectly formatted.

Result Summary:
Returned 2 records.

Sample Output:
S0005 | Ayaan Gupta | (empty)
S0018 | Anika Patel | ravi.no-at-symbol.codejudge.edu
[('S0005', 'Ayaan Gupta', ''), ('S0018', 'Anika Patel', 'ravi.no-at-symbol.codejudge.edu')]

Validation:
This makes sense because datasets can contain missing or incorrect contact details.

## Query 3 - Easy and Medium Problems

Purpose:
List all coding problems with difficulty level Easy or Medium.

Result Summary:
Returned 60 problems.

Sample Output:

Total rows: 60
[('P0001', 'Shortest Path 1', 'Medium', '75'), ('P0002', 'Dynamic Programming Basics 2', 'Easy', '50'), ('P0003', 'Dynamic Programming Basics 3', 'Easy', '50'), ('P0004', 'Normalization Check 4', 'Easy', '50'), ('P0005', 'Queue using Stacks 5', 'Easy', '50'), ('P0007', 'Graph Traversal 7', 'Medium', '75'), ('P0009', 'Two Sum 9', 'Medium', '75'), ('P0011', 'Database Indexing 11', 'Medium', '75'), ('P0012', 'Queue using Stacks 12', 'Easy', '50'), ('P0013', 'Dynamic Programming Basics 13', 'Medium', '75')]


Validation:
The problems table has 67 total records, so 60 Easy/Medium problems is believable, meaning only a smaller number are Hard.

## Query 4 - Latest 20 Submissions

Purpose:
Display the latest 20 submissions based on submission timestamp.

Result Summary:
Returned 20 records.

Sample Output:
Total rows: 20
[('SUB001091', 'S0074', 'P0025', '2025-08-12 03:44:00', 'Runtime Error', '12'), ('SUB001593', 'S0007', 'P0005', '2025-08-05 20:47:00', 'Accepted', '50'), ('SUB000123', 'S0002', 'P0067', '2025-08-04 15:30:00', 'Accepted', '50'), ('SUB001144', 'S0007', 'P0006', '2025-07-31 02:49:00', 'Compilation Error', '0'), ('SUB000878', 'S0142', 'P0066', '2025-07-31 01:38:00', 'Accepted', '75'), ('SUB002438', 'S0207', 'P0018', '2025-07-30 11:25:00', 'Accepted', '100'), ('SUB000569', 'S0002', 'P0020', '2025-07-27 04:20:00', 'Accepted', '50'), ('SUB000751', 'S0120', 'P0015', '2025-07-27 01:11:00', 'Wrong Answer', '28'), ('SUB001740', 'S0052', 'P0047', '2025-07-24 17:14:00', 'Compilation Error', '0'), ('SUB000500', 'S0283', 'P0028', '2025-07-23 11:17:00', 'Accepted', '75')]

Validation:
The results are correctly ordered from newest submission to older submissions, which matches the ORDER BY DESC condition.

## Query 5 - Unsuccessful Submissions

Purpose:
Find submissions where the execution was not successful.

Result Summary:
Returned 1374 records.

Sample Output:
Total rows: 1374
[('SUB000001', 'S0282', 'P0043', 'Wrong Answer', '46'), ('SUB000002', 'S0289', 'P0028', 'Wrong Answer', '46'), ('SUB000003', 'S0001', 'P0005', 'Wrong Answer', '19'), ('SUB000006', 'S0154', 'P0012', 'Compilation Error', '0'), ('SUB000007', 'S0248', 'P0023', 'Wrong Answer', '6'), ('SUB000008', 'S0196', 'P0011', 'Compilation Error', '0'), ('SUB000013', 'S9999', 'P0066', 'Runtime Error', '61'), ('SUB000014', 'S0293', 'P0026', 'Wrong Answer', '31'), ('SUB000016', 'S0177', 'P0004', 'Wrong Answer', '28'), ('SUB000017', 'S0120', 'P0026', 'Runtime Error', '10')]

Validation:
Since coding platforms usually contain many failed attempts before accepted solutions, a large number of unsuccessful submissions is reasonable.

## Query 6 - Submission Details with Student and Problem Info

Purpose:
Display each submission with student name, problem title, language, status, score, and submission time.

Result Summary:
Query joins submissions, students, and problems tables successfully.

Sample Output:
SUB000001 | Isha Gupta | Dynamic Programming Basics 43 | C | Wrong Answer | 46 | 2025-05-14 13:48:00
SUB000004 | Saanvi Bose | Two Sum 42 | Python | Accepted | 50 | 2025-02-03 22:52:00
SUB000006 | Gaurav Iyer | Queue using Stacks 12 | Go | Compilation Error | 0 | 2025-04-15 12:36:00

Validation:
Student names and problem titles correctly match submission records, so join logic is working.

## Query 7 - Students and Enrollments

Purpose:
Display all students and their enrollments, including students with no course enrollment.

Result Summary:
LEFT JOIN successfully returns students with enrollment data and would also include students without enrollments.

Sample Output:
S0001 | Vivaan Gupta | C001 | active
S0001 | Vivaan Gupta | C006 | active
S0005 | Ayaan Gupta | C003 | dropped

Validation:
LEFT JOIN is correct here because the assignment asks to include all students, even if they are not enrolled.

## Query 8 - Course Enrollment Count

Purpose:
Display all courses with the number of enrolled students.

Result Summary:
Returned 10 courses.

Sample Output:
C002 | Data Structures | 101
C005 | Operating Systems | 99
C007 | Algorithms | 94
C009 | Web Backend Engineering | 0
C010 | Distributed Systems | 0

Validation:
Courses with zero enrollments are still shown because LEFT JOIN includes unmatched course records.

## Query 9 - Test Case Results with Submission Details

Purpose:
Display test-case results for each submission, including problem title and student name.

Result Summary:
Query successfully joined test_results, submissions, students, and problems.

Sample Output:
R0000001 | Isha Gupta | Dynamic Programming Basics 43 | Runtime Error | 0
R0000005 | Isha Gupta | Dynamic Programming Basics 43 | Passed | 8
R0000006 | Kunal Singh | Valid Parentheses 28 | Passed | 12

Validation:
One submission generates multiple test-case results, so repeated student/problem names across multiple rows are expected.

## Query 10 - Enrolled Students Without Course Submissions

Purpose:
Find students who enrolled in a course but never submitted any solution for that course.

Result Summary:
Returned 214 students.

Sample Output:
S0004 | Ananya Bose
S0010 | Rohan Singh
S0013 | Harsh Roy

Validation:
This is reasonable because enrollment does not guarantee active participation or submission activity.

## Query 11 - Submission Count by Status

Purpose:
Count submissions grouped by status.

Result Summary:
Returned 6 status categories.

Sample Output:
Accepted | 1127
Wrong Answer | 729
Runtime Error | 277
Compilation Error | 196
Time Limit Exceeded | 171
OK | 1

Validation:
Accepted submissions are highest, which is expected because students usually retry until they solve the problem.

## Query 12 - Average Score per Problem

Purpose:
Calculate average score for each problem.

Result Summary:
Query returned average scores for all attempted problems.

Sample Output:
P0021 | SQL Joins 21 | 90.72
P0018 | Database Indexing 18 | 79.43
P0017 | Tree Diameter 17 | 71.91

Validation:
Problems with easier logic or higher success rates naturally show higher average scores.

## Query 13 - Students with More Than 10 Submissions

Purpose:
Find students who submitted more than 10 solutions.

Result Summary:
Multiple students crossed the 10 submission mark.

Sample Output:
S0052 | Kabir Mehta | 19
S0126 | Yash Khan | 17
S0133 | Dhruv Patel | 16

Validation:
Active students usually make multiple attempts, so higher submission counts are expected.

## Query 14 - Problems with Success Rate Below 40%

Purpose:
Find problems where acceptance rate is below 40%.

Result Summary:
Several problems have low success rates.

Sample Output:
P0005 | Queue using Stacks 5 | 34.38%
P0008 | LRU Cache 8 | 33.33%
P0010 | Knapsack 10 | 38.24%

Validation:
Harder problems naturally have lower success rates, so this output makes sense.


## Query 15 - Top 10 Most Attempted Problems

Purpose:
Find the most attempted coding problems.

Result Summary:
Top 10 most attempted problems returned.

Sample Output:
P0040 | Graph Traversal 40 | 55
P0001 | Shortest Path 1 | 53
P0019 | Dynamic Programming Basics 19 | 53

Validation:
Popular or course-relevant problems usually attract more attempts.


## Query 16 - Students Above Overall Average Score

Purpose:
Find students whose average score is greater than overall submission average.

Result Summary:
Multiple students scored above platform average.

Sample Output:
S0003 | Ira Pillai | 46.50
S0009 | Meera Gupta | 58.43
S0012 | Ananya Pillai | 62.00

Validation:
Students with consistently better submissions naturally appear here.


## Query 17 - Problems Never Attempted

Purpose:
Find problems with zero submissions.

Result Summary:
Returned 1 problem.

Sample Output:
P0036 | Trie Search 36

Validation:
Some newly added or less visible problems may not have been attempted.


## Query 18 - Enrolled but Never Submitted

Purpose:
Find students who enrolled in courses but never submitted anything.

Result Summary:
Returned 0 records.

Validation:
This means every enrolled student made at least one submission, which is possible in an active dataset.


## Query 19 - Students Using Both Python and Java

Purpose:
Find students who submitted using both Python and Java.

Result Summary:
Many students used multiple languages.

Sample Output:
S0002 | Harsh Das
S0003 | Ira Pillai
S0005 | Ayaan Gupta

Validation:
Coding platforms often allow multiple languages, so this result is expected.


## Query 20 - Second Highest Score for Selected Problem

Purpose:
Find second highest score for selected problem P0001.

Result Summary:
Returned score = 72

Validation:
Distinct sorting with OFFSET correctly finds second highest unique score.