-- Analytics 04: Most Frequently Used Formula One Circuits

SELECT
    regexp_replace(c.name, '"', '') AS circuit_name,
    regexp_replace(c.country, '"', '') AS country,
    count(*) AS total_races
FROM formula1.races r
JOIN formula1.circuits c
ON r.circuitId = c.circuitId
GROUP BY
    regexp_replace(c.name, '"', ''),
    regexp_replace(c.country, '"', '')
ORDER BY total_races DESC
LIMIT 10;