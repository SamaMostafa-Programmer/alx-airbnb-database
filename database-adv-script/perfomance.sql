-- Initial complex query to retrieve all bookings with user, property, and payment details
EXPLAIN
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2025-01-01' AND pay.status = 'Completed';

-- The WHERE clause filters bookings starting from 2025 and only completed payments.
-- This allows us to measure the efficiency of indexes on date and status columns.

-- Refactored version could reduce columns or use indexed columns to improve performance
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2025-01-01' AND pay.status = 'Completed';
