-- Analytics 14: Constructor Dominance by Decade

WITH decade_points AS
(
    SELECT
        concat(floor(rac.year / 10) * 10, 's') AS decade,
        regexp_replace(c.name, '"', '') AS constructor,
        round(sum(res.points), 2) AS total_points
    FROM formula1.results res
    JOIN formula1.races rac
    ON res.raceId = rac.raceId
    JOIN formula1.constructors c
    ON res.constructorId = c.constructorId
    GROUP BY
        concat(floor(rac.year / 10) * 10, 's'),
        regexp_replace(c.name, '"', '')
),

ranked AS
(
    SELECT
        decade,
        constructor,
        total_points,
        row_number() over (
            partition by decade
            order by total_points DESC
        ) AS rn
    FROM decade_points
)

SELECT
    decade,
    constructor,
    total_points
FROM ranked
WHERE rn = 1
ORDER BY decade;