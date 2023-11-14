SELECT COUNT(climb_id) AS NumberDeveloped, climb_name, climber_id, climber_first_name
FROM   climbs
       INNER JOIN developed_climbs
       USING (climb_id)
       INNER JOIN climbers
       USING (climber_id)
       GROUP BY climber_id
       ORDER BY NumberDeveloped DESC
       LIMIT 3;
      
