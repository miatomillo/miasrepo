 SELECT climb_name, grade_str, crag_name, climb_len_ft, region_name
   FROM climbs
        INNER JOIN crags 
        USING(crag_name)
        INNER JOIN climb_grades 
        ON (climb_grade=grade_id)
   WHERE grade_id =(
        SELECT grade_id 
          FROM climb_grades
         WHERE grade_str='5.9'
        );