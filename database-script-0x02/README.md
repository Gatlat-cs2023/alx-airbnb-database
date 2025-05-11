# Database Sample Data (`seed.sql`)

## Overview
The `seed.sql` script populates the database with realistic sample data for:
- **Users** (Guests, Hosts, Admins)
- **Properties** (Listings available for booking)
- **Bookings** (Reservations made by guests)
- **Payments** (Transactions linked to bookings)
- **Reviews** (Feedback from guests)
- **Messages** (User communications)

## Instructions
1. Ensure the database schema is created (`schema.sql`).
2. Execute the `seed.sql` script in MySQL:
   ```sh
   mysql -u username -p database_name < seed.sql
