# ⚡ Index Performance Report

## 🧠 Objective
To identify frequently used columns in the `User`, `Booking`, and `Property` tables and create indexes to improve query performance.

---

## 🧩 Steps Performed

1. **Analyzed frequently queried columns**  
   - `users.email`  
   - `bookings.start_date`  
   - `properties.city`

2. **Created Indexes**
   ```sql
   CREATE INDEX idx_users_email ON users(email);
   CREATE INDEX idx_bookings_start_date ON bookings(start_date);
   CREATE INDEX idx_properties_city ON properties(city);
