-- Inner Joins
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id
ORDER BY Booking.start_date DESC;  -- Added ORDER BY

-- Left Joins
SELECT 
    Property.property_id,
    Property.name,
    Property.description,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id
ORDER BY Review.created_at DESC;  -- Added ORDER BY

-- Simulate FULL OUTER JOIN using UNION of LEFT and RIGHT JOIN
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM Booking
RIGHT JOIN User ON Booking.user_id = User.user_id
ORDER BY user_id ASC;  -- Added ORDER BY to final union
