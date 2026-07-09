-- Analytics 15: Executive Dashboard KPI Summary

SELECT
    count(DISTINCT raceId) AS total_races,
    count(DISTINCT driverId) AS total_drivers,
    count(DISTINCT constructorId) AS total_constructors,
    round(sum(points), 2) AS total_championship_points
FROM formula1.results;