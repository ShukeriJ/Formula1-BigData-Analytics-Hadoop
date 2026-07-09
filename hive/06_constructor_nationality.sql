-- Analytics 06: Constructor Nationality Performance

SELECT
    regexp_replace(c.nationality, '"', '') AS constructor_nationality,
    round(sum(r.points), 2) AS total_points,
    count(DISTINCT c.constructorId) AS total_constructors
FROM formula1.results r
JOIN formula1.constructors c
ON r.constructorId = c.constructorId
GROUP BY regexp_replace(c.nationality, '"', '')
ORDER BY total_points DESC
LIMIT 10;