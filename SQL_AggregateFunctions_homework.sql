/* Database Employees */
/* 1. Get empid, firstname, lastname, country, region, city of all employees from USA. */
/* 2. Get the number of employees for each specialty. */
/* 3. Count the number of people for each name. */
/* 4. Get the most common name. */
/* 5. Get the least common name. */
/* 6. Get the top 5 cities where the most workers are. */
/* 7. Get the top 5 cities, which have the most unique specialties. */
/* 8. Issue mailing addresses for emailing to all employees who started working on 1/01/2012. */
/* 9. Issue statistics in what year how many employees were employed. */
/* 10. Issue statistics in which year how many workers in which countries were employed. */
/* 11. Refresh the Employees table by adding data from the History table to the EndDate column. */
/* 12. Issue statistics on how many employees in which year they left. */
/* 13. Issue the number of employees who have worked less than a year. */



--Task 1

SELECT [BusinessEntityID] AS empid, [FirstName] AS Firstname,[LastName] AS Lastname, [CountryRegionName] AS  Country, [StateProvinceName] AS Region, [City] AS City
FROM Employees


--Task 2

SELECT COUNT(*) AS NumberOfEmployees,[JobTitle] AS Specialty
FROM Employees
GROUP BY [JobTitle]


--Task 3

SELECT COUNT(*) AS NumberOfNames,[FirstName] AS Firstname
FROM Employees
GROUP BY [FirstName]


--Task 4

SELECT TOP(1) COUNT(*) AS [Count],[FirstName] AS Firstname
FROM Employees
GROUP BY [FirstName]
ORDER BY [Count] DESC


--Task 5

SELECT TOP(1) COUNT(*) AS [Count],[FirstName] AS Firstname
FROM Employees
GROUP BY [FirstName]
ORDER BY [Count] ASC


--Task 6

SELECT TOP(5) COUNT(*) As NumberOfWorkers,[City] AS City
FROM Employees
GROUP BY [City]
ORDER BY [NumberOfWorkers] DESC




--Task 7

SELECT TOP(5) COUNT(*) As NumberOfSpecialty, [JobTitle] AS JobTitle ,[City] AS City
FROM Employees
GROUP BY [City],[JobTitle]
ORDER BY [NumberOfSpecialty]


--Task 8

SELECT *
FROM Employees
WHERE [StartDate]='2012/01/01'


--Task 9

SELECT COUNT(*) AS NumberOfEmployess, YEAR([StartDate]) AS [Year]
FROM Employees
GROUP BY YEAR([StartDate])


--Task 10

SELECT COUNT(*) AS NumberOfEmployess, YEAR([StartDate]) AS [Year],[CountryRegionName] AS Country
FROM Employees
GROUP BY YEAR([StartDate]),[CountryRegionName]



--Task 11

UPDATE Employees
SET EndDate = (
    SELECT TOP (1) EndDate
    FROM History
    WHERE Employees.BusinessEntityID = History.BusinessEntityID
    ORDER BY EndDate DESC
)



--Task 12

SELECT COUNT(*) AS NumberOfEmployess, YEAR([EndDate]) AS [Year]
FROM Employees
GROUP BY YEAR([EndDate])



--Task 13

SELECT COUNT(*) AS NumberOfEmployees
FROM Employees
WHERE DATEDIFF(YEAR,[StartDate],[EndDate])<1


