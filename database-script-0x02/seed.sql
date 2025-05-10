-- Insert users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('uuid-001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pwd1', '1234567890', 'guest'),
('uuid-002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd2', NULL, 'host'),
('uuid-003', 'Admin', 'User', 'admin@example.com', 'hashed_pwd3', '9876543210', 'admin');

-- Insert properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
('prop-001', 'uuid-002', 'Cozy Apartment', 'A beautiful and cozy apartment in the city.', 'Nairobi', 45.00),
('prop-002', 'uuid-002', 'Modern Loft', 'Spacious loft in downtown.', 'Kisumu', 70.00);

-- Insert bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('book-001', 'prop-001', 'uuid-001', '2025-05-10', '2025-05-12', 90.00, 'confirmed');

-- Insert payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES 
('pay-001', 'book-001', 90.00, 'paypal');

-- Insert reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES 
('rev-001', 'prop-001', 'uuid-001', 5, 'Amazing place to stay!');

-- Insert messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES 
('msg-001', 'uuid-001', 'uuid-002', 'Hi Bob, I have a question about your property.');

