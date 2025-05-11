# Database Normalization Review

## 1. Schema Overview
The database schema consists of six tables:
- **Message**: Stores communications between users.
- **Review**: Stores user reviews of properties.
- **User**: Manages user information.
- **Booking**: Tracks reservations made by users.
- **Property**: Stores details about properties available for booking.
- **Payment**: Logs transactions linked to bookings.

## 2. Normalization Steps

### First Normal Form (1NF)
All tables meet 1NF requirements:
- Each column contains atomic values.
- Each row is uniquely identified by a primary key.
- No repeating groups or arrays.

### Second Normal Form (2NF)
To achieve 2NF:
- All non-key attributes are fully dependent on the primary key.
- Tables with composite keys do not have partial dependencies.

### Third Normal Form (3NF)
To meet 3NF:
- All attributes are functionally dependent **only** on the primary key.
- No transitive dependencies exist (i.e., attributes depending on non-key attributes).
- Example: User email is unique and solely dependent on `user_id`.

## 3. Adjustments (if needed)
No modifications were required, as the schema **already adheres to 3NF**.

## 4. Conclusion
The existing design ensures data integrity and minimizes redundancy. If additional optimizations are needed, consider indexing frequently queried columns for performance improvements.

