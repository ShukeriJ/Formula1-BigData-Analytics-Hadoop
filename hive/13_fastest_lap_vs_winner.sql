-- Analytics 13: Fastest Lap vs Race Winner

SELECT
    'Fastest Lap Winner' AS outcome,
    sum(
        CASE
            WHEN winner_driverId = fastest_driverId THEN 1
            ELSE 0
        END
    ) AS races
FROM
(
    SELECT
        raceId,
        max(CASE WHEN positionOrder = 1 THEN driverId END) AS winner_driverId,
        max(CASE WHEN ranking = 1 THEN driverId END) AS fastest_driverId
    FROM formula1.results
    WHERE ranking IS NOT NULL
    GROUP BY raceId
) t

UNION ALL

SELECT
    'Fastest Lap Non-Winner' AS outcome,
    sum(
        CASE
            WHEN winner_driverId <> fastest_driverId THEN 1
            ELSE 0
        END
    ) AS races
FROM
(
    SELECT
        raceId,
        max(CASE WHEN positionOrder = 1 THEN driverId END) AS winner_driverId,
        max(CASE WHEN ranking = 1 THEN driverId END) AS fastest_driverId
    FROM formula1.results
    WHERE ranking IS NOT NULL
    GROUP BY raceId
) t;