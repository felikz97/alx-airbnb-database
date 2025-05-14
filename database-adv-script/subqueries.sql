SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location
FROM 
    properties p
WHERE 
    p.id IN (
        SELECT 
            r.property_id
        FROM 
            reviews r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );

SELECT 
    u.id,
    u.name,
    u.email
FROM 
    users AS u
WHERE 
    (
        SELECT COUNT(*) 
        FROM bookings AS b
        WHERE b.user_id = u.id          -- correlated reference to the outer query
    ) > 3;
-- query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause
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
