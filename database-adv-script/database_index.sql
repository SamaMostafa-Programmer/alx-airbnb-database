-- Create indexes to improve query performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_city ON properties(city);

-- Measure performance before and after using EXPLAIN
EXPLAIN SELECT * FROM users WHERE email = 'example@email.com';
EXPLAIN SELECT * FROM bookings WHERE start_date > '2025-01-01';
EXPLAIN SELECT * FROM properties WHERE city = 'Cairo';
