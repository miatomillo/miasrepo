USE red_river_climbs;

SELECT climb_id, developed_date
FROM   climbs
       INNER JOIN developed_climbs
       USING (climb_id);

DELETE FROM developed_climbs
WHERE       developed_date = CURRENT_TIMESTAMP() - INTERVAL 1 YEAR;
