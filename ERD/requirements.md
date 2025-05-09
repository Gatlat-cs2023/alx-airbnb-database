# Entity Relationship Diagram - Airbnb Clone

## Objective
Create an ER diagram that outlines the database structure for the Airbnb clone.

---

## Entities and Attributes

### 1. User
- id (PK)
- name
- email
- password

### 2. Property
- id (PK)
- owner_id (FK to User)
- name
- location
- price

### 3. Booking
- id (PK)
- user_id (FK to User)
- property_id (FK to Property)
- start_date
- end_date

---

## Relationships

- A User can book many Properties → **One-to-Many** (User → Booking)
- A Property can have many Bookings → **One-to-Many** (Property → Booking)
- A User can own many Properties → **One-to-Many** (User → Property)

---

## Diagram

The ER diagram was created using [draw.io](https://draw.io).  
You can find it in this folder: [ER-Diagram](ERD/airbnb_er.drawio.png)
