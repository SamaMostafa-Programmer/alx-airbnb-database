--- ====== USERS ======
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role)
VALUES
(UUID(), 'Ahmed', 'Ali', 'ahmed@example.com', 'hashed_password', 'admin'),
(UUID(), 'Sara', 'Hassan', 'sara@example.com', 'hashed_password', 'host'),
(UUID(), 'Omar', 'Khaled', 'omar@example.com', 'hashed_password', 'guest');

-- ====== PROPERTIES ======
-- نفترض إن المضيف (Sara) هو اللي هيملك العقارات
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
SELECT
UUID(), user_id, 'Cairo Apartment', 'Nice place in Cairo center', 'Cairo, Egypt', 500
FROM users WHERE email = 'sara@example.com'
UNION ALL
SELECT
UUID(), user_id, 'Alexandria Sea View', 'Seafront apartment with balcony', 'Alexandria, Egypt', 800
FROM users WHERE email = 'sara@example.com';

-- ====== BOOKINGS ======
-- وليكن الضيف هو Omar
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT
UUID(), p.property_id, u.user_id, '2025-01-10', '2025-01-15', 2500, 'confirmed'
FROM properties p, users u
WHERE p.name = 'Cairo Apartment' AND u.email = 'omar@example.com'
UNION ALL
SELECT
UUID(), p.property_id, u.user_id, '2025-02-01', '2025-02-03', 1600, 'pending'
FROM properties p, users u
WHERE p.name = 'Alexandria Sea View' AND u.email = 'omar@example.com';

-- ====== PAYMENTS ======
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
SELECT
UUID(), booking_id, 2500, 'credit_card'
FROM bookings WHERE total_price = 2500;

-- ====== REVIEWS ======
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
SELECT
UUID(), p.property_id, u.user_id, 5, 'Excellent stay, recommended!'
FROM properties p, users u
WHERE p.name = 'Cairo Apartment' AND u.email = 'omar@example.com';
