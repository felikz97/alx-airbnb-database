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


-- 3. Property Table Indexes
-- Index on id (Primary Key, automatically created)
-- Index on name (if searching/filtering by property name is common)
CREATE INDEX idx_property_name ON properties(name);

-- Index on location (if filtering by location is common)
CREATE INDEX idx_property_location ON properties(location);

-- Index on price (for price range filtering)
CREATE INDEX idx_property_price ON properties(price);

-- Index on rating (for sorting/filtering by rating)
CREATE INDEX idx_property_rating ON properties(rating);

-- 4. Composite Index (Booking Table)
-- Composite Index on property_id and user_id (for more efficient JOIN operations)
CREATE INDEX idx_booking_property_user ON bookings(property_id, user_id);

-- 1. Measuring Query Performance (Before Indexing)
EXPLAIN SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_row_number
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    booking_rank;

-- 2. After Adding Indexes:
EXPLAIN ANALYZE
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_row_number
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    booking_rank;

