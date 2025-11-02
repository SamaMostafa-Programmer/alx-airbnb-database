-- Create indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_city ON properties(city);

-- Analyze query
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-02-01';
