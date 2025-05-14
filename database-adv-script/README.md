# 📘 Advanced SQL Queries (JOINs) – Airbnb Clone Schema

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

