-- Analytics 01: Top 10 Drivers by Championship Points

SELECT
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', '') AS driver_name,
    regexp_replace(d.nationality, '"', '') AS nationality,
    round(sum(r.points), 2) AS total_points,
    count(*) AS races
FROM formula1.results r
JOIN formula1.drivers d
ON r.driverId = d.driverId
GROUP BY
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', ''),
    regexp_replace(d.nationality, '"', '')
ORDER BY total_points DESC
LIMIT 10;