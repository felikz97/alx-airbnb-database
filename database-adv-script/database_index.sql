-- 1. User Table Indexes
-- Index on id (Primary Key, automatically created)
-- Index on email (if frequently queried)
CREATE UNIQUE INDEX idx_user_email ON users(email);

-- Index on status (if filtering by user status is common)
CREATE INDEX idx_user_status ON users(status);


-- 2. Booking Table Indexes
-- Index on id (Primary Key, automatically created)
-- Index on user_id (to join with the User table)
CREATE INDEX idx_booking_user_id ON bookings(user_id);

-- Index on property_id (to join with the Property table)
CREATE INDEX idx_booking_property_id ON bookings(property_id);

-- Index on booking_date (for date range filtering)
CREATE INDEX idx_booking_date ON bookings(booking_date);

-- Index on status (if filtering by booking status is common)
CREATE INDEX idx_booking_status ON bookings(status);
