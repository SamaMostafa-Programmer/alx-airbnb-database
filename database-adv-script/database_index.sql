-- database_index.sql
-- Create indexes to improve query performance (target columns identified as high-usage)
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);
CREATE INDEX IF NOT EXISTS idx_properties_city ON properties(city);

-- ------------------------------------------------------------------
-- Measure performance BEFORE adding indexes using EXPLAIN ANALYZE
-- (These are example test queries to capture the planner/runtime info)
-- ------------------------------------------------------------------

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'test@example.com';

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

EXPLAIN ANALYZE
SELECT * FROM properties WHERE city = 'Cairo';

-- ------------------------------------------------------------------
-- Note: Index creation above is idempotent due to IF NOT EXISTS.
-- If indexes were not present before, creating them below (again) will be ignored.
-- In some DB engines you may want to DROP INDEX first in order to measure
-- "before" vs "after" on the same dataset, but do that carefully in prod.
-- ------------------------------------------------------------------

-- OPTIONAL: To force re-evaluation, you can run ANALYZE (statistics update)
ANALYZE users;
ANALYZE bookings;
ANALYZE properties;

-- ------------------------------------------------------------------
-- Measure performance AFTER adding indexes using EXPLAIN ANALYZE
-- ------------------------------------------------------------------

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'test@example.com';

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

EXPLAIN ANALYZE
SELECT * FROM properties WHERE city = 'Cairo';
