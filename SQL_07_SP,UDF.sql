--Stored Procedure
--1. Parametr kimi gonderilen ededin faktorialin hesablayan "Factorial" SP yaradin (5! = 1*2*3*4*5 = 120)
--(0! = 1) (nezere alin ki, menfi ededin faktoriali olmur).
--2. "LazyStudents" SP yaradin. SP hech vaxt kitabxanadan kitab goturmeyen
-- telebelerin siyahisini gosterir ve output parametr olaraq bele telebelerin sayini qaytarir


--TASK 1

CREATE PROC Factorial
(
   @num int,
   @result int OUTPUT
)

AS
BEGIN
     IF @num < 0
	           BEGIN
		              SET @result = null;
				      PRINT 'Factorial of negative numbers can not be calculated!!!';
	           END
	 ELSE
	      IF @num = 0
		               SET @result = 1;
     ELSE
	      BEGIN
		         SET @result = 1;
				 WHILE @num > 0
				      BEGIN
					         SET @result *= @num ;
							 SET @num -=1 ;
				      END
		  END

END

GO

DECLARE @Fact_Result int

EXEC Factorial @num = 5, @result = @Fact_Result OUTPUT

PRINT @Fact_Result



--TASK 2

GO 

USE Library

GO

CREATE PROC LazyStudents
(
   @StudentCount int OUTPUT
)
AS
BEGIN
       SELECT S.Id AS [StudentID], S.FirstName,S.LastName,S.Id_Group
	   FROM Students AS S
	   FULL OUTER JOIN S_Cards AS SC ON S.Id = SC.Id_Student
	   WHERE S.Id IS NULL 
	   OR SC.Id_Student IS NULL

	   SET @StudentCount = (
       SELECT COUNT(*)
       FROM Students AS S
       FULL OUTER JOIN S_Cards AS SC ON S.Id = SC.Id_Student
       WHERE S.Id IS NULL 
       OR SC.Id_Student IS NULL
    );

END

GO

DECLARE @count int

EXEC LazyStudents @StudentCount = @count OUTPUT

PRINT @count
		       



--UDF--1. Neshriyatlar ve onlarin minimal sehifeye malik kitablarinin
--siyahisini qaytaran funksiya yazin.
--2. Chap etdiyi kitablarin Sehifelerinin ededi ortasi N-den chox olan 
--neshriyatlarin adini qaytaran funksiya yazin. N funksiyaya parametr kimi gonderilmelidir.


--TASK 1

GO

USE Library

GO

CREATE FUNCTION [MinPagedBooks]()
RETURNS TABLE AS
RETURN
(
   SELECT P.Id,P.[Name],B.[Name] AS [Book name], B.Pages AS [Page Count]
   FROM Press AS P
   INNER JOIN Books AS B ON B.Id_Press = P.Id
   WHERE B.Pages=(
                   SELECT MIN(Pages)
				   FROM Books
				   WHERE Id_Press = P.Id
   )
)

GO

SELECT *
FROM MinPagedBooks()



--TASK 2

GO

USE Library

GO

CREATE FUNCTION [ShowPressNames]
(
   @avg_count decimal
)
RETURNS TABLE AS
RETURN 
(
  SELECT P.[Name] AS [Press name], AVG(B.Pages) AS [Average Page Count]
  FROM Press AS P
  INNER JOIN Books AS B ON B.Id_Press = P.Id
  GROUP BY P.[Name]
  HAVING AVG(B.Pages) > @avg_count
)

GO

SELECT *
FROM ShowPressNames(250)
