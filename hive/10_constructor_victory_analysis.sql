-- Analytics 10: Constructor Victory Analysis

SELECT
    regexp_replace(c.name, '"', '') AS constructor_name,
    count(*) AS total_wins
FROM formula1.results r
JOIN formula1.constructors c
ON r.constructorId = c.constructorId
WHERE r.positionOrder = 1
GROUP BY regexp_replace(c.name, '"', '')
ORDER BY total_wins DESC
LIMIT 10;