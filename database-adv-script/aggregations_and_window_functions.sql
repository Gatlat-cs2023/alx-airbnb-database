-- 1. Total number of bookings made by each user
SELECT 
    U.user_id,
    U.first_name,
    U.last_name,
    COUNT(B.booking_id) AS total_bookings
FROM User U
LEFT JOIN Booking B ON U.user_id = B.user_id
GROUP BY U.user_id, U.first_name, U.last_name;

-- 2. Rank properties based on number of bookings using window function
SELECT 
    P.property_id,
    P.name,
    COUNT(B.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(B.booking_id) DESC) AS booking_rank
FROM Property P
LEFT JOIN Booking B ON P.property_id = B.property_id
GROUP BY P.property_id, P.name;

