USE red_river_climbs;

CREATE OR REPLACE VIEW INFO_VIEW AS
 SELECT    climb_name, grade_str, climb_len_ft, crag_name, 
              GROUP_CONCAT(climber_first_name,' ',climber_last_name) AS FirstAscentBy, climber_id, climb_id
   FROM    climbs
            LEFT OUTER JOIN climb_grades
            ON (grade_id=climb_grade)
            LEFT OUTER JOIN first_ascents
            USING (climb_id)
            LEFT OUTER JOIN climbers
            USING (climber_id)
            GROUP BY (climb_id);

SELECT  climb_name, grade_str, climb_len_ft, crag_name, 
        FirstAscentBy, GROUP_CONCAT(climber_first_name, ' ', climber_last_name) AS EquippedBy
FROM    INFO_VIEW
        LEFT OUTER JOIN developed_climbs
        USING (climber_id)
        LEFT OUTER JOIN climbers
        USING (climber_id)
        GROUP BY (INFO_VIEW.climb_id);
       
        
              