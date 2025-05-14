# 📘 Advanced SQL Queries – Airbnb Clone Schema

This document contains advanced SQL queries using different types of JOINs to retrieve meaningful insights from the Airbnb Clone database schema.

## 🗃️ Database: MySQL

### ✅ Prerequisites

Before running these queries, ensure the following:
- The schema from `schema.sql` has been created.
- The database is populated with sample or production data.

---

## 🔄 JOIN Queries

### 1. 🧾 Bookings and the Users Who Made Them (INNER JOIN)

**Objective**: Retrieve all bookings along with user details who made those bookings.

```sql
SELECT 
    B.booking_id,
    B.property_id,
    B.start_date,
    B.end_date,
    B.total_price,
    B.status,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email
FROM Booking B
INNER JOIN User U ON B.user_id = U.user_id;

```
### 2. 🏡 Properties and Their Reviews (LEFT JOIN)

**Objective**: List all properties and any reviews they may have. Properties without reviews should still appear.

```sql
SELECT 
    P.property_id,
    P.name,
    P.location,
    R.review_id,
    R.rating,
    R.comment,
    R.created_at
FROM Property P
LEFT JOIN Review R ON P.property_id = R.property_id;

```
### 3. 👥 All Users and All Bookings (FULL OUTER JOIN Simulation)

**Objective**: Show all users and bookings, including users who have not made any bookings and bookings not linked to any users.

⚠️ MySQL does not support FULL OUTER JOIN, so we simulate it using `UNION` of `LEFT JOIN` and `RIGHT JOIN.`

```sql
-- Simulating FULL OUTER JOIN
SELECT 
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.property_id,
    B.start_date,
    B.end_date
FROM User U
LEFT JOIN Booking B ON U.user_id = B.user_id

UNION

SELECT 
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.property_id,
    B.start_date,
    B.end_date
FROM Booking B
RIGHT JOIN User U ON B.user_id = U.user_id;
```

## 📌 Notes

**INNER JOIN**: Returns only matching records in both tables.
**LEFT JOIN**: Returns all records from the left table, and matched records from the right table.
**FULL OUTER JOIN**: Not directly supported in MySQL – must use `UNION` of `LEFT JOIN` and `RIGHT JOIN`.
**Indexes**: Improve performance when joining on foreign keys (e.g., `user_id`, `property_id`).

## 📁 Related Files

**`schema.sql`**: Contains table definitions and constraints for the database.
![schema.sql](../database-script-0x01/schema.sql)




