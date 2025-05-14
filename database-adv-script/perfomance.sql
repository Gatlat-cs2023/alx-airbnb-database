-- Initial query with joins to retrieve all booking details
SELECT 
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price,
    B.status,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    P.property_id,
    P.name AS property_name,
    P.location,
    Pay.payment_id,
    Pay.amount,
    Pay.payment_method,
    Pay.payment_date
FROM Booking B
JOIN User U ON B.user_id = U.user_id
JOIN Property P ON B.property_id = P.property_id
LEFT JOIN Payment Pay ON B.booking_id = Pay.booking_id;

