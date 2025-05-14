# 📘 Index Creation and Performance Analysis – Airbnb Clone

This document covers the creation of indexes on high-usage columns in the `User`, `Booking`, and `Property` tables, and performance analysis before and after the index creation.

## 🔑 High-Usage Columns Identified

### User Table:
- **user_id**: Frequently used in joins and `WHERE` conditions.
- **email**: Often queried for user lookups.

### Booking Table:
- **user_id**: Used in joins with `User` table and filtering bookings.
- **property_id**: Used for filtering and joins with `Property` table.
- **start_date**, **end_date**: Often used in filtering for date ranges.

### Property Table:
- **property_id**: Used in joins and filtering.
- **host_id**: Used in filtering and joining with the `User` table.

## 📊 SQL CREATE INDEX Commands

```sql
-- 1. Index on User Table
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);

-- 2. Index on Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);

-- 3. Index on Property Table
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_property_host_id ON Property(host_id);
```
## 🧑‍💻 Query Performance Measurement

**Before Adding Indexes**:

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

**After Adding Indexes**:

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

**EXPLAIN Output Analysis**:

- Look for the key column in the output.
- If key is `NULL` before the index, the query performs a full table scan.
- After adding the index, the key column should show the index name (e.g., `idx_booking_user_id`), indicating the query uses the index, which should improve performance.
