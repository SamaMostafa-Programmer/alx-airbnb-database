-- INNER JOIN
SELECT bookings.id AS booking_id, users.id AS user_id, users.name, bookings.start_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
ORDER BY bookings.id;

-- LEFT JOIN
SELECT properties.id AS property_id, properties.name, reviews.rating
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;

-- FULL OUTER JOIN
SELECT users.id AS user_id, bookings.id AS booking_id
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id
ORDER BY users.id NULLS LAST;
