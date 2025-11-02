# 🚀 Query Optimization Report

## 🎯 Objective
To analyze, refactor, and improve the performance of a **complex SQL query** that joins multiple tables (`bookings`, `users`, `properties`, and `payments`) in the Airbnb database.

This task focuses on:
- Identifying performance bottlenecks.
- Using `EXPLAIN` and `ANALYZE` to understand query execution.
- Applying indexing and query refactoring to reduce execution time.

---

## 🧩 Initial Query
The following query retrieves all bookings with related user, property, and payment details.

```sql
SELECT b.id AS booking_id,
       u.name AS user_name,
       p.name AS property_name,
       pay.amount AS payment_amount,
       b.start_date,
       b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
