-- Analytics 05: Top Winning Drivers

SELECT
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', '') AS driver_name,
    regexp_replace(d.nationality, '"', '') AS nationality,
    count(*) AS total_wins
FROM formula1.results r
JOIN formula1.drivers d
ON r.driverId = d.driverId
WHERE r.positionOrder = 1
GROUP BY
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', ''),
    regexp_replace(d.nationality, '"', '')
ORDER BY total_wins DESC
LIMIT 10;