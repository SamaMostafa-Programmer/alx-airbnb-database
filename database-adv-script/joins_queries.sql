-- INNER JOIN
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date
FROM users u
INNER JOIN bookings b ON u.id = b.user_id;

-- LEFT JOIN
-- LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.id AS property_id, 
    p.name AS property_name, 
    r.rating AS review_rating
FROM properties p
LEFT JOIN reviews r 
    ON p.id = r.property_id;

-- FULL OUTER JOIN (PostgreSQL syntax)
SELECT u.id AS user_id, b.id AS booking_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
