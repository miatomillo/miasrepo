-- SELECT MAX(grade_str), MAX(grade_id)
-- FROM climbs
-- INNER JOIN developed_climbs
--        ON climbers.climber_first_name
--        ON climbers.climber_last_name;
       

SELECT grade_str, climber_first_name, climber_last_name
  FROM climb_grades
       INNER JOIN
       (SELECT climber_first_name, climber_last_name, MAX(grade_id) AS climb_grade
              FROM climbers
              INNER JOIN developed_climbs
              USING(climber_id)
              INNER JOIN climbs
              USING(climb_id)
              INNER JOIN climb_grades
              ON climbs.climb_grade=climb_grades.grade_id
              GROUP BY (climber_id)) AS max_dev_grade
       ON climb_grades.grade_id=max_dev_grade.climb_grade;

