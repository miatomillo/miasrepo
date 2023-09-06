/*
    Lab 02: MariaDB
    CSC 362 Database Systems
    Mia Tomillo
    Using Dr. Bailey's "Lab02a.sql" as reference
*/

--Creating the database, dropping previous veresion if needed.

DROP DATABASE IF EXISTS school;
CREATE DATABASE school;

--Establishing the database I will be working in
USE school;

--Creating the Instructors table
/* This table will include four columns. One for the instructor ID,
    which will automatically increment, and then one column each for 
    the instructor's first name, last name, and campus phone number.
    These will all be characters, besides the ID, which is an integer.
*/
CREATE TABLE instructors (
    PRIMARY KEY (instructor_id),
    instructor_id       INT AUTO_INCREMENT,
    inst_first_name     VARCHAR(20),
    inst_last_name      VARCHAR(20),
    campus_phone        VARCHAR(20)
);

/* Here, I am inserting the values for each instructor- First name, 
    last name, and campus phone number. These come from Figure 7.22
    of the Database Design textbook. The instructor ID will automatically
    increment, per line 24 of the code above.
*/
INSERT INTO instructors (inst_first_name, inst_last_name, campus_phone)
VALUES  ('Kira',    'Bently',  '363-9948'),
        ('Timothy', 'Ennis',   '527-4992'),
        ('Shannon', 'Black',   '336-5992'),
        ('Estela',  'Rosales', '322-6992');

--SELECT will allow all of the fields to be shown when the script is run.
SELECT * FROM instructors;
    


