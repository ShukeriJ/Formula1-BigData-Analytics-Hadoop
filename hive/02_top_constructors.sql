-- Analytics 02: Top Constructors by Championship Points

SELECT
    regexp_replace(c.name, '"', '') AS constructor_name,
    round(sum(r.points), 2) AS total_points
FROM formula1.results r
JOIN formula1.constructors c
ON r.constructorId = c.constructorId
GROUP BY regexp_replace(c.name, '"', '')
ORDER BY total_points DESC
LIMIT 10;