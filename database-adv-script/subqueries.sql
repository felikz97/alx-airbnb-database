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

