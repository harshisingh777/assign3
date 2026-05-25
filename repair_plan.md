# CodeJudge Structural Correction & Repair Strategy Plan

### 1. Duplicate Unique Candidate Emails
* **Action:** Merge conflicting entities; re-route dependent keys, then remove duplicates.
* **Example Case:** Student ID `1089` and `1102` share `dev@masai.com`. Retain historical ID `1089` and delete `1102`.

### 2. Orphan Submissions (Missing Student Contexts)
* **Action:** Quarantine orphan rows into `rejected_staging_submissions` for verification.
* **Example Case:** Submission IDs `14502` and `14503` point to missing Student ID `9999`.

### 3. Out of Bounds Baseline Scores
* **Action:** Correct values to conform to system bounds. Update negative values to 0.
* **Example Case:** Problem ID `42` returns `max_score = -50`. Correct to `0`.

### 4. Broken Chronological Timeline Ordering
* **Action:** Update the enrollment date to match the earliest verified code submission timestamp.
* **Example Case:** Student ID `2041` shows an enrollment date of `2026-02-01`, but has a submission record dated `2026-01-15`.

### 5. Invalid Difficulty Class Strings
* **Action:** Set missing or malformed values to a default classification of `Medium`.
* **Example Case:** Problem ID `108` has difficulty string set to `Unknown`.

### 6. Over-Bound Plagiarism Evaluation Indexes
* **Action:** Cap scores exceeding the boundary limit at `100.0`.
* **Example Case:** Flag ID `881` contains a `similarity_score` of `105.5`.

### 7. Duplicate System Enrollments
* **Action:** Apply a deduplication process keeping only the earliest entry record.
* **Example Case:** Multiple duplicate enrollment records found for Student `1021` in Batch `5`.

### 8. Null Columns in Mandatory System Constraints
* **Action:** Set empty values to an anonymous fallback value to prevent systemic query issues.
* **Example Case:** Student ID `3091` features a blank string `''` in the name column.
