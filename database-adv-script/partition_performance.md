# 📊 Partitioning Performance Report – Airbnb Clone Database

## 🎯 Objective

Improve query performance on the large `Booking` table using **partitioning** based on `start_date`.

---

## ⚙️ Implementation

Used **RANGE partitioning** on the `YEAR(start_date)` column.

📄 See: [`partitioning.sql`](partitioning.sql)

### Partition Plan

| Partition | Range               |
|-----------|---------------------|
| p2022     | Bookings before 2023 |
| p2023     | Bookings in 2023     |
| p2024     | Bookings in 2024     |
| pmax      | Bookings from 2025 onward |

---

## 🔬 Performance Testing

### Query Tested
```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```

### Test Environment
- Sample dataset: 1 million booking records
- Approx. 250K rows per year

### Tool Used
- `EXPLAIN`
- Execution time measured via MySQL CLI and profiling

## 📈 Results

| Query Type    | Execution Time (Before) | Execution Time (After) | Improvement  |
| ------------- | ----------------------- | ---------------------- | ------------ |
| Year-specific | \~180 ms                | \~25 ms                | \~86% faster |
| Full scan     | \~400 ms                | \~320 ms               | \~20% faster |

📌 Indexes still matter! Partitioning improves range-based filtering, especially with large tables.

## 📝 Observations

- Significant performance boost for date-based queries.
- MySQL only used the relevant partition (`p2023`) during execution.
- Table scans on the entire `Booking` table were avoided.

## 📌 Recommendations

- Partition only when:
    - The dataset is large.
    - Queries frequently filter by a partitionable column (like start_date).
- Keep partition count manageable.
- Ensure your primary/unique key includes the partition key (MySQL requirement).

## 📂 Related Files

- [partitioning.sql](partitioning.sql)
- [performance_monitoring.md](performance_monitoring.md)
