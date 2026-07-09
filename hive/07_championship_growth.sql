-- Analytics 07: Formula One Championship Growth

SELECT
    year,
    count(raceId) AS total_races
FROM formula1.races
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;