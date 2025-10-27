CREATE TABLE users (
city VARCHAR(100),
country VARCHAR(100),
price_per_night NUMERIC(10,2) NOT NULL,
max_guests INTEGER DEFAULT 1,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE property_images (
id SERIAL PRIMARY KEY,
property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
url TEXT NOT NULL,
is_primary BOOLEAN DEFAULT FALSE
);


CREATE TABLE amenities (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE property_amenities (
property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
amenity_id INTEGER NOT NULL REFERENCES amenities(id) ON DELETE CASCADE,
PRIMARY KEY (property_id, amenity_id)
);


CREATE TABLE bookings (
id SERIAL PRIMARY KEY,
property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_amount NUMERIC(10,2) NOT NULL,
status VARCHAR(20) DEFAULT 'booked', -- booked, cancelled, completed
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE payments (
id SERIAL PRIMARY KEY,
booking_id INTEGER NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
amount NUMERIC(10,2) NOT NULL,
payment_method VARCHAR(50),
paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE reviews (
id SERIAL PRIMARY KEY,
booking_id INTEGER REFERENCES bookings(id) ON DELETE SET NULL,
property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
reviewer_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
rating SMALLINT CHECK (rating >= 1 AND rating <= 5),
comment TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Indexes for performance
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_bookings_property ON bookings(property_id);
CREATE INDEX idx_bookings_guest ON bookings(guest_id);
