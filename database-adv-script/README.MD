# 🏠 ALX Airbnb Database - Advanced Querying Power

## 📘 Overview
This project focuses on mastering **Advanced SQL concepts** through complex queries, optimization, and performance tuning on the Airbnb database schema.  
It builds upon the foundational work from the previous database projects.

---

## 🧩 Project Objectives
- Write complex SQL queries with `JOIN`s, subqueries, and window functions.  
- Optimize performance using `EXPLAIN`, `ANALYZE`, and `SHOW PROFILE`.  
- Implement indexing and partitioning to handle large-scale datasets.  
- Continuously monitor and refine database performance.

---

## 📂 Repository Structure

## 🧩 Tasks Summary

### 0. Write Complex Queries with Joins
**File:** `joins_queries.sql`

**Objective:**  
Use SQL joins to combine data from multiple tables.

**Queries:**
1. `INNER JOIN` – Retrieve all bookings with the respective users who made them.  
2. `LEFT JOIN` – Retrieve all properties and their reviews, including properties without reviews.  
3. `FULL OUTER JOIN` – Retrieve all users and bookings, even if not linked together.

---

### 1. Practice Subqueries
**File:** `subqueries.sql`

**Objective:**  
Learn both correlated and non-correlated subqueries.

**Queries:**
1. Find all properties with an **average rating > 4.0** (non-correlated subquery).  
2. Find all users who made **more than 3 bookings** (correlated subquery).

---

### 2. Apply Aggregations and Window Functions
**File:** `aggregations_and_window_functions.sql`

**Objective:**  
Use aggregation and window functions to analyze data.

**Queries:**
1. Count total bookings per user using `COUNT()` and `GROUP BY`.  
2. Rank properties by total bookings using `ROW_NUMBER()` or `RANK()` window functions.

---

### 3. Implement Indexes for Optimization
**Files:**  
- `database_index.sql`  
- `index_performance.md`

**Objective:**  
Enhance query speed by creating indexes on high-usage columns.

**Steps:**
1. Identify frequent columns used in `WHERE`, `JOIN`, or `ORDER BY`.  
2. Create indexes using `CREATE INDEX`.  
3. Measure performance before and after indexing with `EXPLAIN` or `ANALYZE`.

---

### 4. Optimize Complex Queries
**Files:**  
- `perfomance.sql`  
- `optimization_report.md`

**Objective:**  
Refactor slow queries to improve performance.

**Steps:**
1. Write an initial query joining bookings, users, properties, and payments.  
2. Analyze performance using `EXPLAIN`.  
3. Refactor to remove redundancies and leverage indexing.

---

### 5. Partitioning Large Tables
**Files:**  
- `partitioning.sql`  
- `partition_performance.md`

**Objective:**  
Improve performance for large datasets using partitioning.

**Steps:**
1. Partition the `Booking` table by the `start_date` column.  
2. Compare performance for date-range queries before and after partitioning.  
3. Document improvements.

---

### 6. Monitor and Refine Database Performance
**File:** `performance_monitoring.md`

**Objective:**  
Continuously analyze and improve database health.

**Steps:**
1. Use `SHOW PROFILE` or `EXPLAIN ANALYZE` to detect bottlenecks.  
2. Suggest and implement schema or index adjustments.  
3. Document the observed improvements.

---

## ⚙️ Tools & Concepts Used
- SQL Joins (`INNER`, `LEFT`, `FULL OUTER`)
- Subqueries (Correlated & Non-Correlated)
- Aggregation & Window Functions
- Indexing & Query Optimization
- Table Partitioning
- Query Performance Analysis (`EXPLAIN`, `ANALYZE`)
- Database Performance Monitoring

---

## 🧾 Author
**Name:** Sama Mostafa  
**Project:** ALX Airbnb Database – Advanced SQL Queries  
**Cohort:** ALX Software Engineering Program

---

## 🏁 Conclusion
This project provided hands-on experience with optimizing real-world SQL queries and schema design.  
It simulates the work of a **Database Administrator (DBA)** focusing on **efficiency, scalability, and performance tuning** for large applications.
