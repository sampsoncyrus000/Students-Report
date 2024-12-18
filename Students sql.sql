use powerbi;

SELECT * FROM students;

SELECT * FROM students WHERE _id is null;

SELECT *,concat(`Firts Name`," ",`Last Name`) as Full_name FROM students;

SELECT * FROM students
WHERE userscore <> "" and resultstatus = "Absent";

UPDATE students
SET resultstatus = 'Present'
WHERE userscore <> "" and resultstatus = 'Absent';

CREATE TABLE final_data as
SELECT *,concat(`Firts Name`," ",`Last Name`) as Full_name FROM students;

SELECT * FROM final_data;

SELECT *, userscore - (physics + chemistry) as Maths_new FROM final_data;

ALTER TABLE final_data ADD COLUMN maths_new int;

SELECT * FROM final_data;

UPDATE final_data
SET maths_new = userscore - (physics + chemistry);

ALTER TABLE final_data DROP `Last Name`;

WITH CTE as (
SELECT physics + chemistry + maths_new as new_total, userscore FROM final_data)

SELECT * FROM CTE
WHERE new_total <> userscore;

ALTER TABLE final_data ADD COLUMN new_total int;

UPDATE final_data
SET new_total = physics + chemistry + maths_new;

ALTER TABLE final_data DROP userscore;

SELECT * FROM final_data as a
JOIN
parents as b
ON a._id = b._id;

SELECT a.*,b.phone,b.name,b.password 
FROM final_data as a
JOIN parents as b ON a._id = b._id;

CREATE TABLE new_final_data as
SELECT a.*,b.phone,b.name,b.password 
FROM final_data as a
JOIN parents as b ON a._id = b._id;

SELECT * FROM new_final_data;




