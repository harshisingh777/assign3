# CodeJudge Platform Data Integrity Suite — Part 3

This directory contains validation checks, anomaly detection tests, and staging repair scripts for data auditing.

## Operational Order
1. Run `import_validation.sql` to check row counts.
2. Execute `integrity_audit.sql` and `domain_rule_checks.sql` to identify schema violations.
3. Apply `staging_repair_scripts.sql` to test and verify repairs safely within staging tables.
