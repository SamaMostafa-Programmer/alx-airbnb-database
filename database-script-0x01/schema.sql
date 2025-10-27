-- Create database
CREATE DATABASE IF NOT EXISTS airbnb;
USE airbnb;

-- =========================
-- 1) User Table
-- =========================
CREATE TABLE User (
    user_id        VARCHAR(36) PRIMARY KEY,
    first_name     VARCHAR(100) NOT NULL,
    last_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(255) NOT NULL UNIQUE,
    password_hash  VARCHAR(255) NOT NULL,
    phone_number   VARCHAR(20),
    role           ENUM('guest', 'host', 'admin') NOT NULL,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- 2) Property Table
-- =========================
CREATE TABLE Property (
    property_id     VARCHAR(36) PRIMARY KEY,
    host_id         VARCHAR(36) NOT NULL,
    name            VARCHAR(255) NOT NULL,
    description     TEXT NOT NULL,
    location        VARCHAR(255) NOT NULL,
    pricepernight   DECIMAL(10,2) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_property_host
        FOREIGN KEY (host_id) REFERENCES User(user_id)
);

CREATE INDEX idx_property_host_id ON Property(host_id);

-- =========================
-- 3) Booking Table
-- =========================
CREATE TABLE Booking (
    booking_id    VARCHAR(36) PRIMARY KEY,
    property_id   VARCHAR(36) NOT NULL,
    user_id       VARCHAR(36) NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE NOT NULL,
    total_price   DECIMAL(10,2) NOT NULL,
    status        ENUM('pending','confirmed','canceled') NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_property
        FOREIGN KEY (property_id) REFERENCES Property(property_id),

    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- =========================
-- 4) Payment Table
-- =========================
CREATE TABLE Payment (
    payment_id     VARCHAR(36) PRIMARY KEY,
    booking_id     VARCHAR(36) NOT NULL,
    amount         DECIMAL(10,2) NOT NULL,
    payment_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card','paypal','stripe') NOT NULL,

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- =========================
-- 5) Review Table
-- =========================
CREATE TABLE Review (
    review_id     VARCHAR(36) PRIMARY KEY,
    property_id   VARCHAR(36) NOT NULL,
    user_id       VARCHAR(36) NOT NULL,
    rating        INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment       TEXT NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_property
        FOREIGN KEY (property_id) REFERENCES Property(property_id),

    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE INDEX idx_review_property_id ON Review(property_id);

-- =========================
-- 6) Message Table
-- =========================
CREATE TABLE Message (
    message_id     VARCHAR(36) PRIMARY KEY,
    sender_id      VARCHAR(36) NOT NULL,
    recipient_id   VARCHAR(36) NOT NULL,
    message_body   TEXT NOT NULL,
    sent_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_message_sender
        FOREIGN KEY (sender_id) REFERENCES User(user_id),

    CONSTRAINT fk_message_recipient
        FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
