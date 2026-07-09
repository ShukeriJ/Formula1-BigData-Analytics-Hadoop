-- Analytics 09: Pole Position Conversion Rate

SELECT
    'Pole Converted to Win' AS outcome,
    sum(
        CASE
            WHEN pole_driverId = winner_driverId THEN 1
            ELSE 0
        END
    ) AS races
FROM
(
    SELECT
        raceId,
        max(CASE WHEN grid = 1 THEN driverId END) AS pole_driverId,
        max(CASE WHEN positionOrder = 1 THEN driverId END) AS winner_driverId
    FROM formula1.results
    GROUP BY raceId
) t

UNION ALL

SELECT
    'Pole Not Converted' AS outcome,
    sum(
        CASE
            WHEN pole_driverId <> winner_driverId THEN 1
            ELSE 0
        END
    ) AS races
FROM
(
    SELECT
        raceId,
        max(CASE WHEN grid = 1 THEN driverId END) AS pole_driverId,
        max(CASE WHEN positionOrder = 1 THEN driverId END) AS winner_driverId
    FROM formula1.results
    GROUP BY raceId
) t;