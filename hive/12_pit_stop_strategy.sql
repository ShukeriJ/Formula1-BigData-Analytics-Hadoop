-- Analytics 12: Pit Stop Strategy Analysis

SELECT
    regexp_replace(c.name, '"', '') AS circuit_name,
    regexp_replace(c.country, '"', '') AS country,
    count(DISTINCT p.raceId) AS races,
    count(*) AS total_pit_stops,
    round(count(*) / count(DISTINCT p.raceId), 2) AS avg_pit_stops_per_race
FROM formula1.pit_stops p
JOIN formula1.races r
ON p.raceId = r.raceId
JOIN formula1.circuits c
ON r.circuitId = c.circuitId
GROUP BY
    regexp_replace(c.name, '"', ''),
    regexp_replace(c.country, '"', '')
HAVING count(DISTINCT p.raceId) >= 5
ORDER BY avg_pit_stops_per_race DESC
LIMIT 10;