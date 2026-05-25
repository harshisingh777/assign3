-- =====================================================================
-- TASK 1: IMPORT VALIDATION AND PROFILE AUDITS
-- =====================================================================

-- 1. Structural Row Counts across Core Tables
SELECT 'students' AS table_name, COUNT(*) AS row_count FROM students
UNION ALL
SELECT 'batches', COUNT(*) FROM batches
UNION ALL
SELECT 'enrollments', COUNT(*) FROM enrollments
UNION ALL
SELECT 'problems', COUNT(*) FROM problems
UNION ALL
SELECT 'submissions', COUNT(*) FROM submissions
UNION ALL
SELECT 'plagiarism_flags', COUNT(*) FROM plagiarism_flags;

-- 2. Primary Key Distinct Count Validation
SELECT 
    (SELECT COUNT(DISTINCT student_id) FROM students) AS distinct_student_pks,
    (SELECT COUNT(DISTINCT batch_id) FROM batches) AS distinct_batch_pks,
    (SELECT COUNT(*) FROM enrollments) AS total_enrollment_rows;

-- 3. Critical Null / Blanks Data Audit
SELECT COUNT(*) AS corrupt_student_records 
FROM students 
WHERE name IS NULL OR name = '' OR email IS NULL OR email = '';
