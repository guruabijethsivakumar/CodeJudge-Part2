# SQL Reasoning

## LEFT JOIN vs INNER JOIN
In Query 8, LEFT JOIN is better because all courses should be shown, including courses with zero enrollments.

If INNER JOIN was used, courses C009 and C010 would not appear.

## HAVING vs WHERE
In Query 13, HAVING is needed because filtering happens after grouping.

We are checking students with more than 10 submissions, which depends on COUNT().

WHERE cannot be used directly with aggregate functions.

## Subquery Usage
In Query 16, subquery helps compare each student's average score with overall average score.

Without subquery, overall average would need separate calculation.

## Duplicate Record Issue
In Query 7, duplicate enrollment records can make results misleading.

For example, S0001 appears twice for the same course.

This can increase counts incorrectly if duplicates are not handled.

## Edge Case Considered
In Query 18, result returned zero rows.

This was still valid because every enrolled student had at least one submission in the dataset.