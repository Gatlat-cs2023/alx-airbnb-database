# Database Schema Overview

## Introduction
This database schema supports a property booking system with the following entities:
- **User**: Stores user information.
- **Property**: Manages property details.
- **Booking**: Handles reservation tracking.
- **Payment**: Records transactions.
- **Review**: Stores user feedback.
- **Message**: Manages communication between users.

## Schema Details
Each table includes appropriate constraints:
- **Primary keys** ensure unique identification of records.
- **Foreign keys** establish relationships between tables.
- **Constraints** enforce data integrity (e.g., valid ratings).
- **Indexes** enhance query performance for frequent searches.

## How to Use
1. Run [schema.sql](schema.sql) to create the database structure.
2. Insert sample data for testing.
3. Query the tables for booking, payments, and reviews.

## Notes
- The schema enforces referential integrity to prevent orphaned records.
- Indexes optimize lookup speeds for key columns.

