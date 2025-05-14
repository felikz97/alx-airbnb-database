-- partitioning.sql

-- Step 1: Rename the existing table (optional backup)
ALTER TABLE bookings RENAME TO bookings_backup;

-- Step 2: Create new partitioned table by RANGE on start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    booking_date TIMESTAMP,
    -- other columns as needed
    CHECK (start_date <= end_date)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (e.g., yearly)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: (Optional) Reinsert data from backup to new partitioned table
-- INSERT INTO bookings SELECT * FROM bookings_backup;

-- Step 5: Create indexes on partitions if needed
CREATE INDEX idx_bookings_2023_user_id ON bookings_2023(user_id);
CREATE INDEX idx_bookings_2024_user_id ON bookings_2024(user_id);
CREATE INDEX idx_bookings_2025_user_id ON bookings_2025(user_id);

