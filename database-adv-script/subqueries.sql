-- 1. Properties with an average rating greater than 4.0
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- 2. Users who have made more than 3 bookings (correlated subquery)
SELECT *
FROM User U
WHERE (
    SELECT COUNT(*)
    FROM Booking B
    WHERE B.user_id = U.user_id
) > 3;



