/*Database "Library"   
 
1. Display books with the minimum number 
of pages issued by a particular publishing house.
1. Hər Publisherin ən az səhifəli 
kitabını ekrana çıxarın 

2. Display the names of publishers who have issued books with an average number of pages larger than 100.	
2. Publisherin ümumi çap etdiyi kitabların orta səhifəsi 100dən yuxarıdırsa, o Publisherləri ekrana çıxarın.

3. Output the total amount of pages of all the books in the library issued by the publishing houses BHV and BINOM.
3. BHV və BİNOM Publisherlərinin kitabların bütün cəmi səhifəsini ekrana çıxarın

4. Select the names of all students who took books between January 1, 2001 and the current date.
Yanvarın 1-i 2001ci il və bu gün arasında kitabxanadan kitab götürən bütün tələbələrin adlarını ekrana çıxarın

5. Find all students who are currently working with the book "Windows 2000 Registry" by Olga Kokoreva.
5. Olga Kokorevanın  "Windows 2000 Registry" kitabı üzərində işləyən tələbələri tapın

6. Display information about authors whose average volume of books (in pages) is more than 600 pages.
6. Yazdığı bütün kitabları nəzərə aldıqda, orta səhifə sayı 600dən çox olan Yazıçılar haqqında məlumat çıxarın.

7. Display information about publishers, whose total number of pages of books published by them is more than 700.
7. Çap etdiyi bütün kitabların cəmi səhifə sayı 700dən çox olan Publisherlər haqqında ekrana məlumat çıxarın
*/




--TASK 1

SELECT P.[Name],MIN(PAGES) AS [Page Count]
FROM Books AS B
INNER JOIN Press AS P ON B.Id_Press = P.Id
GROUP BY P.[Name]



--TASK 2


SELECT P.[Name] AS [Press Name] ,AVG(Pages) AS [Average Page Count]
FROM Books AS B
INNER JOIN Press AS P ON B.Id_Press = P.Id
GROUP BY P.[Name]
HAVING AVG(Pages) > 100




--TASK 3

SELECT P.[Name] AS [Press Name] ,SUM(Pages) AS [Total Page]
FROM Books AS B
INNER JOIN Press AS P ON B.Id_Press = P.Id
WHERE P.[Name] IN ('BHV','Binom')
GROUP BY P.[Name]


--TASK 4

SELECT S.Id AS Id ,S.[FirstName] + ' ' + S.[LastName] AS Fullname
FROM Students AS S
INNER JOIN S_Cards AS SC ON S.Id = SC.Id_Student
WHERE SC.DateIn >= '20010101' AND SC.DateOut <= SYSDATETIME()


--TASK 5

SELECT S.Id AS Id ,S.[FirstName] + ' ' + S.[LastName] AS Fullname
FROM S_Cards AS SC
INNER JOIN Students AS S ON SC.Id_Student = S.Id
INNER JOIN Books AS B ON B.Id = SC.Id_Book
WHERE B.[Name] = N'Windows 2000 registry' AND SC.DateOut <= SYSDATETIME()



--TASK 6

SELECT A.Id,A.FirstName, A.LastName, AVG(Pages) AS [Average Page Count]
FROM Authors AS A
INNER JOIN Books AS B ON A.Id = B.Id_Author
GROUP BY A.Id, A.FirstName, A.LastName
HAVING AVG(Pages) > 600


--TASK 7

SELECT A.Id,A.FirstName, A.LastName, SUM(Pages) AS [Total Page Count]
FROM Authors AS A
INNER JOIN Books AS B ON A.Id = B.Id_Author
GROUP BY A.Id, A.FirstName, A.LastName
HAVING SUM(Pages) > 700




