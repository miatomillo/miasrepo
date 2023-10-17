-- SELECT climb_name
--   FROM climbs
--        INNER JOIN sport_climbs
--        ON climbs.climb_id=sport_climbs.climb_bolts
--        INNER JOIN first_ascents
--        ON climbs.climb_id=first_ascents.climber_id
--        INNER JOIN climbers 
--        ON first_ascents.climber_id=climbers.climber_handle;

SELECT climb_name, climb_bolts, GROUP_CONCAT(climber_handle)
  FROM sport_climbs
       INNER JOIN climbs
       USING(climb_id)
       INNER JOIN first_ascents
       USING (climb_id)
       INNER JOIN climbers 
       USING(climber_id)
       GROUP BY climb_id;

