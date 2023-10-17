 SELECT grade_str, GROUP_CONCAT(climb_name)
   FROM climbs
        INNER JOIN climb_grades ON (climb_grade=grade_id)
        GROUP BY grade_str
        ORDER BY grade_id ASC;