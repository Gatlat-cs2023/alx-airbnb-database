-- ⚠️ Note: MySQL supports partitioning only for certain storage engines like InnoDB and requires the partitioned column to be part of all primary/unique keys.

-- Step 1: Drop and recreate Booking table with partitioning by start_date (RANGE partitioning)
DROP TABLE IF EXISTS Booking;

CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

