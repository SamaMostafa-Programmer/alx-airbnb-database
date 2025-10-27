# Database Schema — Airbnb Clone (DDL)

This folder contains the database schema for the Airbnb clone project.  
All SQL statements are written in *schema.sql*, and they define the database structure including tables, constraints, and indexing.

---

## ✅ Created Tables

The following tables were created:

### 1) users
Stores all system users (guests, hosts, admins).

### 2) properties
Represents properties listed by hosts.

### 3) bookings
Stores reservation details requested by users on properties.

### 4) reviews
Stores ratings and comments users leave on properties.

### 5) cities
Used to normalize and organize property locations.

### 6) states
Parent entity to cities to provide geographical hierarchy.

---

## ✅ Main Constraints Implemented

- *Primary Keys* using UUID on all tables.
- *Foreign Keys*:
  - properties.host_id → users.user_id
  - bookings.user_id → users.user_id
  - bookings.property_id → properties.property_id
  - reviews.user_id → users.user_id
  - reviews.property_id → properties.property_id
  - cities.state_id → states.state_id

- *Unique constraints* on:
  - users.email

- *Check constraints*:
  - Valid rating range (1–5)
  - Enum values on user roles and booking status

---

## ✅ Indexes

- Automatic indexing on all primary keys (UUID)
- Manual index created on:
  - users.email
  - properties.property_id
  - bookings.booking_id

---

## ✅ Execution

All SQL scripts were executed and the tables were successfully created without errors.

---

## Files

| File Name     | Description |
|---------------|-------------|
| schema.sql  | Contains full DDL queries for all tables |
| README.md   | Documentation for the schema structure |
