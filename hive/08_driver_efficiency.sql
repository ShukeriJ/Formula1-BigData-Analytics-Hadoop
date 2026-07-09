-- Analytics 08: Driver Efficiency by Points per Race

SELECT
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', '') AS driver_name,
    regexp_replace(d.nationality, '"', '') AS nationality,
    round(sum(r.points), 1) AS total_points,
    count(*) AS races,
    round(sum(r.points) / count(*), 2) AS points_per_race
FROM formula1.results r
JOIN formula1.drivers d
ON r.driverId = d.driverId
GROUP BY
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', ''),
    regexp_replace(d.nationality, '"', '')
HAVING count(*) >= 100
ORDER BY points_per_race DESC
LIMIT 10;