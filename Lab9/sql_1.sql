
CREATE OR REPLACE FUNCTION str_convert(grade_str_param CHAR(5))
RETURNS INT
RETURN (
    SELECT grade_id
    FROM   climb_grades
    WHERE  grade_str = grade_str_param
);

UPDATE climbs
   SET climb_grade = str_convert('5.10a')
 WHERE climb_grade = str_convert('5.10');

