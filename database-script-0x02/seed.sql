-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
    ('uuid-1', 'Alice', 'Smith', 'alice@example.com', 'hashed_password_1', '+1234567890', 'guest'),
    ('uuid-2', 'Bob', 'Johnson', 'bob@example.com', 'hashed_password_2', '+0987654321', 'host'),
    ('uuid-3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password_3', '+1122334455', 'admin');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
    ('uuid-10', 'uuid-2', 'Cozy Cabin', 'A quiet retreat in the woods.', 'Seattle, WA', 120.00),
    ('uuid-11', 'uuid-2', 'Downtown Apartment', 'A modern space in the city center.', 'New York, NY', 200.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
    ('uuid-100', 'uuid-10', 'uuid-1', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
    ('uuid-101', 'uuid-11', 'uuid-1', '2025-07-10', '2025-07-12', 400.00, 'pending');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('uuid-200', 'uuid-100', 480.00, '2025-06-01', 'credit_card'),
    ('uuid-201', 'uuid-101', 400.00, '2025-07-10', 'paypal');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
    ('uuid-300', 'uuid-10', 'uuid-1', 5, 'Amazing stay! Highly recommend.'),
    ('uuid-301', 'uuid-11', 'uuid-1', 4, 'Great location, but a bit noisy.');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
    ('uuid-400', 'uuid-1', 'uuid-2', 'Hello! I’m interested in your property.'),
    ('uuid-401', 'uuid-2', 'uuid-1', 'Thanks for reaching out! Let me know how I can help.');
