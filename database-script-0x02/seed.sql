-- users
INSERT INTO users (username, email, password, full_name, role)
VALUES
('alice', 'alice@example.com', 'hashed_pwd1', 'Alice Johnson', 'host'),
('bob', 'bob@example.com', 'hashed_pwd2', 'Bob Ahmed', 'guest'),
('carla', 'carla@example.com', 'hashed_pwd3', 'Carla Gomez', 'guest');


-- amenities
INSERT INTO amenities (name) VALUES
('Wifi'), ('Air Conditioning'), ('Kitchen'), ('Washer');


-- properties
INSERT INTO properties (host_id, title, description, address, city, country, price_per_night, max_guests)
VALUES
(1, 'Cozy Cairo Apartment', 'A small cozy apartment in downtown Cairo.', '123 Nile St', 'Cairo', 'Egypt', 25.00, 2),
(1, 'Giza Rooftop', 'Nice view of the pyramids.', '456 Pyramid Rd', 'Giza', 'Egypt', 50.00, 4);


-- property_amenities
INSERT INTO property_amenities (property_id, amenity_id) VALUES
(1, 1), (1, 3), (2, 1), (2, 2);


-- property_images
INSERT INTO property_images (property_id, url, is_primary) VALUES
(1, 'https://example.com/images/apt1.jpg', true),
(2, 'https://example.com/images/apt2.jpg', true);


-- bookings
INSERT INTO bookings (property_id, guest_id, start_date, end_date, total_amount, status)
VALUES
(1, 2, '2025-10-01', '2025-10-05', 100.00, 'completed'),
(2, 3, '2025-11-10', '2025-11-12', 100.00, 'booked');


-- payments
INSERT INTO payments (booking_id, amount, payment_method, paid_at)
VALUES
(1, 100.00, 'card', '2025-10-01 12:00:00');


-- reviews
INSERT INTO reviews (booking_id, property_id, reviewer_id, rating, comment)
VALUES
(1, 1, 2, 5, 'Great stay!');
