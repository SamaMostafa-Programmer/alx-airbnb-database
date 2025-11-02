-- Initial complex query
SELECT b.id, u.name, p.name AS property, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- Refactored version could reduce columns or use pre-indexed joins
