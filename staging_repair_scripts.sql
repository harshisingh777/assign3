-- =====================================================================
-- TASK 6: ISOLATED STAGING STORAGE REPAIR EXECUTIONS
-- =====================================================================

-- Setup: Mirror tables into staging to ensure safety
CREATE TABLE staging_problems AS SELECT * FROM problems;
CREATE TABLE staging_plagiarism_flags AS SELECT * FROM plagiarism_flags;

-- --- REPAIR TASK 1: Clean Invalid Difficulty Classifications ---
-- Before State Check:
SELECT problem_id, difficulty FROM staging_problems WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- Action:
UPDATE staging_problems 
SET difficulty = 'Medium' 
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- After State Check:
SELECT problem_id, difficulty FROM staging_problems WHERE problem_id = 108;


-- --- REPAIR TASK 2: Cap Over-bound Plagiarism Scores ---
-- Before State Check:
SELECT flag_id, similarity_score FROM staging_plagiarism_flags WHERE similarity_score > 100.0;

-- Action:
UPDATE staging_plagiarism_flags 
SET similarity_score = 100.0 
WHERE similarity_score > 100.0;

-- After State Check:
SELECT flag_id, similarity_score FROM staging_plagiarism_flags WHERE flag_id = 881;
