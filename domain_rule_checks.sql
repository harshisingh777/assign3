-- =====================================================================
-- TASK 4: DOMAIN ENFORCEMENT AND TEMPORAL RULE CHECKS
-- =====================================================================

-- Check 4.1: Out of Bounds Metrics & Illegal Problem Difficulty Levels
SELECT problem_id, title, difficulty, max_score 
FROM problems 
WHERE max_score <= 0 
   OR difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- Check 4.2: Illegal Similarity Bound Scores
SELECT flag_id, submission_id, similarity_score 
FROM plagiarism_flags 
WHERE similarity_score < 0.0 OR similarity_score > 100.0;

-- Check 4.3: Temporal Anomaly Checks - Chronological Sequence Breakages
-- Context: Flag situations where submissions occur before a student is enrolled.
SELECT sub.submission_id, sub.student_id, sub.submitted_at, e.enrolled_at
FROM submissions sub
JOIN enrollments e ON sub.student_id = e.student_id
WHERE sub.submitted_at < e.enrolled_at;
