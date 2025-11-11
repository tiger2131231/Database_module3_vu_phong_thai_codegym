USE QuanLySinhVien;

SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

SELECT sub.*
FROM Subject sub
JOIN Mark m ON sub.SubId = m.SubId
WHERE m.Mark = (SELECT MAX(Mark) FROM Mark);

SELECT 
    st.StudentId,
    st.StudentName,
    st.Address,
    st.Phone,
    st.Status,
    c.ClassName,
    ROUND(AVG(m.Mark), 2) AS AverageMark
FROM student st
JOIN class c ON st.ClassId = c.ClassId
JOIN mark m ON st.StudentId = m.StudentId
GROUP BY st.StudentId, st.StudentName, st.Address, st.Phone, st.Status, c.ClassName
ORDER BY AverageMark DESC;



