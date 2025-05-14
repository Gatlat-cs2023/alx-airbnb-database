# 🚀 Query Optimization Report – Airbnb Clone

## 🎯 Objective

To analyze and optimize the performance of a multi-join query that retrieves:

- Booking details
- Corresponding user
- Property
- Payment info

---

## ⚙️ Initial Query

The query joins the following tables:
- `Booking`
- `User`
- `Property`
- `Payment`

📄 See: [`perfomance.sql`](./perfomance.sql)

---

## 🔍 Performance Analysis (Using EXPLAIN)

### Sample Command

```sql
EXPLAIN
SELECT 
    B.booking_id, B.start_date, B.end_date, B.total_price, B.status,
    U.user_id, U.first_name, U.last_name, U.email,
    P.property_id, P.name, P.location,
    Pay.payment_id, Pay.amount, Pay.payment_method, Pay.payment_date
FROM Booking B
JOIN User U ON B.user_id = U.user_id
JOIN Property P ON B.property_id = P.property_id
LEFT JOIN Payment Pay ON B.booking_id = Pay.booking_id;
```

## 👀 Observations from EXPLAIN

- The query performs multiple table scans if indexes are missing.
- Joins on `user_id`, `property_id`, and `booking_id`should be indexed to speed up lookup.
- The use of `LEFT JOIN` for `Payment` is reasonable as not all bookings might be paid yet.

### 1. Ensure Indexes Exist
Ensure indexes on these columns: 

```sql
-- For joins
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

### 2. Refactor Query if Necessary
If certain joins aren't needed in some use cases (e.g., `payment`), defer or separate them.
Example: If you're only viewing bookings without needing payment details, omit the `LEFT JOIN`

```sql
SELECT 
    B.booking_id,
    B.start_date,
    B.end_date,
    U.first_name,
    P.name AS property_name
FROM Booking B
JOIN User U ON B.user_id = U.user_id
JOIN Property P ON B.property_id = P.property_id;
```

## 📈 Results After Optimization

- Query execution time reduced significantly (exact ms depends on dataset size).
- EXPLAIN now shows use of indexes (check key column).
- No full table scans observed.
- Overall improvement in query performance and efficiency.

## 📄 Related Files

- [performance.sql](performance.sql): Original query
- [database_index.sql](database_index.sql): Index definitions
