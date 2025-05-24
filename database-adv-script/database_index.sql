-- 1. Index on User Table
-- Index for user_id (to optimize joins and lookups)
CREATE INDEX idx_user_id ON User(user_id);

-- Index for email (to speed up searches based on email)
CREATE INDEX idx_user_email ON User(email);

-- 2. Index on Booking Table
-- Index for user_id (to optimize joins and queries on user-related bookings)
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for property_id (to optimize joins and filtering on property-related bookings)
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index for start_date and end_date (to optimize date range queries)
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);

-- 3. Index on Property Table
-- Index for property_id (to optimize joins and lookups)
CREATE INDEX idx_property_id ON Property(property_id);

-- Index for host_id (to optimize joins and queries related to a host's properties)
CREATE INDEX idx_property_host_id ON Property(host_id);

-- 4. Use EXPLAIN ANALYZE to evaluate a query using the index
EXPLAIN ANALYZE
SELECT 
    B.booking_id,
    B.user_id,
    B.start_date,
    B.end_date
FROM Booking B
WHERE B.user_id = 3;
