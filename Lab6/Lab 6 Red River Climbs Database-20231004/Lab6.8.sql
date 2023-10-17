-- SELECT crag_name
--     FROM climbs
-- INNER JOIN crags
--         USING (crag_name)
--   WHERE region_name='Miller Fork'

SELECT DISTINCT climber_first_name, climber_last_name
  FROM climbers
        INNER JOIN developed_climbs 
        USING (climber_id)
        INNER JOIN climbs
        USING(climb_id)
        INNER JOIN crags 
        USING (crag_name)
        INNER JOIN regions
        USING (region_name)
        WHERE region_name='Miller Fork';
 