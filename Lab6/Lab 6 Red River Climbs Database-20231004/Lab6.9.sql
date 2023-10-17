SELECT grade_str, COUNT(climb_id)
    FROM climb_grades
        LEFT OUTER JOIN climbs ON (climb_grade=grade_id)
        -- WHERE climb_grades.grade_str >= 0
        GROUP BY grade_id
        ORDER BY grade_id ASC;
        --If 0?