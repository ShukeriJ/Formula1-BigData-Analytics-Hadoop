-- Analytics 11: Driver Consistency Index

SELECT
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', '') AS driver_name,
    regexp_replace(d.nationality, '"', '') AS nationality,
    count(*) AS total_races,
    sum(CASE WHEN r.positionOrder <= 3 THEN 1 ELSE 0 END) AS podium_finishes,
    round(
        100.0 * sum(CASE WHEN r.positionOrder <= 3 THEN 1 ELSE 0 END) / count(*),
        2
    ) AS podium_rate
FROM formula1.results r
JOIN formula1.drivers d
ON r.driverId = d.driverId
GROUP BY
    regexp_replace(concat_ws(' ', d.forename, d.surname), '"', ''),
    regexp_replace(d.nationality, '"', '')
HAVING count(*) >= 50
ORDER BY podium_rate DESC
LIMIT 10;