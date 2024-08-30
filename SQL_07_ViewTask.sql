--Teacher Post cedvelleri yaratdiqimiz tapshiriq ucucn ashaqida gosterilen view-lari yaradin:
--16.1. All job titles.
--16.2. All the names of teachers.


--TASK 1

GO

USE Teachers

GO

CREATE VIEW dbo.JobTitles
  AS
  SELECT [Name] 
  FROM POSTS


GO
  
SELECT *
FROM JobTitles



--TASK 2

GO

CREATE VIEW AllTeacherNames
AS
  SELECT [Name]
  FROM TEACHERS


GO

SELECT *
FROM AllTeacherNames