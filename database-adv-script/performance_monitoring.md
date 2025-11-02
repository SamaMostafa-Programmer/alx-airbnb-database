EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.name;
