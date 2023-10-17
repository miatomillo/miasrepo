 SELECT climb_name, grade_str 
   FROM climbs 
        INNER JOIN trad_climbs 
        USING (climb_id)

        INNER JOIN climb_grades 
        ON (climb_grade=grade_id);