USE red_river_climbs;

SELECT climb_name, grade_str, climb_len_ft, crag_name, 
        first_ascent_id, climb_equipped_by
FROM   climbs
       INNER JOIN climb_grades
       ON (climb_grade=grade_id);