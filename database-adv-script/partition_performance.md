# 🧱 Partitioning Performance Report

## 🎯 Objective
To enhance query performance on the large **Booking** table by applying **table partitioning** based on the `start_date` column.  
Partitioning helps in splitting data into smaller, more manageable sections that improve query execution time and scalability.

---

## ⚙️ Implementation Steps

### 1️⃣ Create Partitioned Table
The `bookings` table was partitioned by **date range** to separate records by year.

```sql
CREATE TABLE bookings_partitioned (
  id SERIAL PRIMARY KEY,
  user_id INT,
  property_id INT,
  start_date DATE,
  end_date DATE
) PARTITION BY RANGE (start_date);
