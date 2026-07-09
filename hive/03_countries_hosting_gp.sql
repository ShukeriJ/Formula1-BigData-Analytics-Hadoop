-- Analytics 03: Countries Hosting the Most Grand Prix

SELECT
    regexp_replace(c.country, '"', '') AS country,
    count(*) AS total_grand_prix
FROM formula1.races r
JOIN formula1.circuits c
ON r.circuitId = c.circuitId
GROUP BY regexp_replace(c.country, '"', '')
ORDER BY total_grand_prix DESC
LIMIT 10;