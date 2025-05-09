# 🧩 Entity Relationship Diagram - Airbnb Clone

## 🎯 Objective

Create an ER diagram that outlines the database structure for the Airbnb clone project.

---

## 🧱 Entities and Attributes

### 1. User
- `user_id` (PK)
- `first_name`
- `last_name`
- `email` (Unique)
- `password_hash`
- `phone_number`
- `role` (guest, host, admin)
- `created_at`

### 2. Property
- `property_id` (PK)
- `host_id` (FK → User.user_id)
- `name`
- `description`
- `location`
- `price_per_night`
- `created_at`
- `updated_at`

### 3. Booking
- `booking_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `start_date`
- `end_date`
- `total_price`
- `status` (pending, confirmed, canceled)
- `created_at`

### 4. Payment
- `payment_id` (PK)
- `booking_id` (FK → Booking.booking_id)
- `amount`
- `payment_date`
- `payment_method` (credit_card, paypal, stripe)

### 5. Review
- `review_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `rating` (1 to 5)
- `comment`
- `created_at`

### 6. Message
- `message_id` (PK)
- `sender_id` (FK → User.user_id)
- `recipient_id` (FK → User.user_id)
- `message_body`
- `sent_at`

---

## 🔗 Relationships

- A **User** can own many **Properties** → One-to-Many
- A **Property** can have many **Bookings** → One-to-Many
- A **User** can make many **Bookings** → One-to-Many
- A **Booking** has one **Payment** → One-to-One
- A **User** can write many **Reviews** → One-to-Many
- A **Property** can have many **Reviews** → One-to-Many
- A **User** can send/receive many **Messages** → One-to-Many (twice: as sender and recipient)

---

## 🖼️ Diagram

The ER diagram was created using [draw.io](https://draw.io).  
You can find it in this folder: [ER-Diagram](airbnb_er.drawio.png)
