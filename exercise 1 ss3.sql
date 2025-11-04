USE QuanLySinhVien;

SELECT *
FROM Student
WHERE StudentName LIKE 'h%';

SELECT * 
FROM Class
WHERE MONTH(StartDate) = 12;

UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';

SELECT s.StudentName, sub.SubName, m.Mark
FROM Mark m
JOIN Student s ON m.StudentId = s.StudentId
JOIN Subject sub ON m.SubId = sub.SubId
ORDER BY m.Mark DESC, s.StudentName ASC;


 