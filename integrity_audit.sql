-- =====================================================================
-- TASK 2 & 3: CONSTRAINT INTEGRITY AND RELATIONSHIP AUDITING
-- =====================================================================

-- Check 2.1: Candidate Key Duplicate Identifiers
-- Observation: Detects if identical emails are cross-assigned to different unique IDs.
SELECT email, COUNT(*) AS execution_occurrence
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

-- Check 2.2: Composite Key Enrollment Overlaps
SELECT student_id, batch_id, COUNT(*) 
FROM enrollments
GROUP BY student_id, batch_id
HAVING COUNT(*) > 1;

-- Check 3.1: Foreign Key Orphans - Submissions referencing Missing Students
-- Structural Risk: Causes broken data views and null metrics on dashboard metrics.
SELECT s.submission_id, s.student_id 
FROM submissions s
LEFT JOIN students stu ON s.student_id = stu.student_id
WHERE stu.student_id IS NULL;

-- Check 3.2: Plagiarism Flags Missing Submissions
SELECT p.flag_id, p.submission_id 
FROM plagiarism_flags p
LEFT JOIN submissions s ON p.submission_id = s.submission_id
WHERE s.submission_id IS NULL;
