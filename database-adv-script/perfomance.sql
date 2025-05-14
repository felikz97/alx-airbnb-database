EXPLAIN
SELECT 
    u.id,
    u.name,
    b.id AS booking_id,
    b.booking_date
FROM 
    users u
JOIN 
    bookings b ON u.id = b.user_id
WHERE 
    b.status = 'confirmed'
    AND b.booking_date >= '2024-01-01';

