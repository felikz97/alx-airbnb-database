--query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.id = b.user_id
GROUP BY 
    u.id, u.name
ORDER BY 
    total_bookings DESC;


-- a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
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



