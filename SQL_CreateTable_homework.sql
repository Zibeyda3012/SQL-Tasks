
--TASK 1

USE master

GO

CREATE DATABASE [Teachers]


GO

USE Teachers


GO

CREATE TABLE [POSTS]
([Id] int IDENTITY(1,1) NOT NULL,
 [Name] nvarchar(20) NOT NULL,

 CONSTRAINT PK_POSTS PRIMARY KEY([Id])
 )

 GO

 CREATE TABLE [TEACHERS]
 ([Id] INT IDENTITY(1,1) NOT NULL,
  [Name] NVARCHAR(15) NOT NULL,
  [Code] CHAR(10) NOT NULL,
  [IdPost] INT NOT NULL,
  [Tel] CHAR(7),
  [Salary] INT,
  [Rise] NUMERIC(6,2),
  [HireDate] DATETIME NOT NULL,

  CONSTRAINT PK_TEACHERS PRIMARY KEY([Id]),
  CONSTRAINT UQ_TEACHERS_IdPost UNIQUE([IdPost]),
  CONSTRAINT FK_TEACHERS_POST FOREIGN KEY([IdPost]) REFERENCES POSTS([Id])
                              ON DELETE NO ACTION
							  ON UPDATE CASCADE
							  )




--TASK 2


GO 

ALTER TABLE [TEACHERS]
DROP CONSTRAINT FK_TEACHERS_POST

GO

DROP TABLE [POSTS]




--TASK 3

GO

ALTER TABLE [TEACHERS]
DROP CONSTRAINT UQ_TEACHERS_IdPost


ALTER TABLE [TEACHERS]
DROP COLUMN [IdPost]


--TASK 4

GO

ALTER TABLE [TEACHERS]
ADD CONSTRAINT CK_TEACHERS_HireDate 
CHECK ([HireDate]>= '19900101')


--TASK 5

GO

ALTER TABLE [TEACHERS]
ADD CONSTRAINT UQ_TEACHERS_Code UNIQUE([Code])



--TASK 6

GO

ALTER TABLE [TEACHERS]
ALTER COLUMN [Salary] NUMERIC(6,2)



-- TASK 7

GO

ALTER TABLE [TEACHERS]
ADD CONSTRAINT CK_TEACHERS_Salary 
CHECK([Salary] >= 1000 AND [Salary] <= 5000)




--TASK 8


GO

EXEC sp_rename 'TEACHERS.Tel', 'Phone'



--TASK 9


GO


ALTER TABLE [TEACHERS]
ALTER COLUMN [Phone] CHAR(11)


--TASK 10

GO

CREATE TABLE [POSTS]
([Id] int IDENTITY(1,1) NOT NULL,
 [Name] nvarchar(20) NOT NULL,

 CONSTRAINT PK_POSTS PRIMARY KEY([Id])
 )



 --TASK 11

 GO

 ALTER TABLE [POSTS]
 ADD CONSTRAINT CK_POSTS_Name 
 CHECK([Name] IN('professor','assistant professor','teacher','assistant'))


 --TASK 12
 /*salam muellim, bu sualda surname daxilinde reqem olmaz nezerde tutub amma ayrica surname field-i yoxdur ona gore [Name] field-i ucun
 yazmisam yeni muellimin adinda da reqem ola bilmeyecek,tam olaraq basa duse bilmedim serti ki,belemi yazmagimizi istemisiniz*/

 GO

 ALTER TABLE [TEACHERS]
 ADD CONSTRAINT CK_TEACHERS_Name
 CHECK([Name] NOT LIKE N'%[0-9]%')


 --TASK 13

 GO

 ALTER TABLE [TEACHERS]
 ADD IdPost INT NOT NULL



 --TASK 14

GO

ALTER TABLE [TEACHERS]
ADD CONSTRAINT FK_TEACHERS_POST FOREIGN KEY([IdPost]) REFERENCES POSTS([Id])
                              ON DELETE NO ACTION
							  ON UPDATE CASCADE



-- TASK 15

GO

SET IDENTITY_INSERT [POSTS] ON

INSERT INTO POSTS([Id], [Name]) 
VALUES (1, N'Professor '); 

INSERT INTO POSTS([Id], [Name]) 
VALUES (3, N'Teacher'); 

INSERT INTO POSTS([Id], [Name]) 
VALUES (4, N'Assistant ');

SET IDENTITY_INSERT [POSTS] OFF


--INSERT INTO POSTS([Id], [Name]) 
--VALUES (2, N'Docent '); 
/* muellim bu deyer elave oluna bilmir cunki evvelki tasklarda constraint qoyanda docent nezere alinmayib,burda tek usul constainti silmek ve lazim gelse yeni constraint elave etmekdir*/

SET IDENTITY_INSERT [POSTS] ON

ALTER TABLE [POSTS]
DROP CONSTRAINT CK_POSTS_Name 

 ALTER TABLE [POSTS]
 ADD CONSTRAINT CK_POSTS_Name 
 CHECK([Name] IN('professor','assistant professor','teacher','assistant','docent'))

INSERT INTO POSTS([Id], [Name]) 
VALUES (2, N'Docent '); 


SET IDENTITY_INSERT [POSTS] OFF


GO


SET IDENTITY_INSERT [TEACHERS] ON

INSERT INTO TEACHERS(Id, [Name], Code , Phone, Salary, Rise, HireDate,[IdPost]) 
VALUES (1, N'Sidorov','0123456789', NULL, 1070, 470, '01 .09.1992',1); 
INSERT INTO TEACHERS (Id, [Name], Code , Phone, Salary, Rise, HireDate,[IdPost]) 
VALUES (2, N'Ramishevsky','4567890123','4567890', 1110, 370, '09 .09.1998',2); 
INSERT INTO TEACHERS(Id, [Name], Code , Phone, Salary, Rise, HireDate,[IdPost])  
VALUES (3, N'Horenko','1234567890', NULL, 2000, 230, '10 .10.2001',3); 
INSERT INTO TEACHERS(Id, [Name], Code , Phone, Salary, Rise, HireDate,[IdPost]) 
VALUES (4, N'Vibrovsky','2345678901', NULL, 4000, 170, '01 .09.2003',4); 
INSERT INTO TEACHERS(Id, [Name], Code , Phone, Salary, Rise, HireDate,[IdPost])  
VALUES (5, N'Voropaev', '7568901234', NULL, 1500, 150, '02 .09.2002',4); 
INSERT INTO TEACHERS(Id, [Name], Code , Phone, Salary, Rise, HireDate,[IdPost]) 
VALUES (6, N'Kuzintsev','5678901234','4567890', 3000, 270, '01 .01.1991',3);


SET IDENTITY_INSERT [TEACHERS] OFF


SELECT *
FROM POSTS

SELECT *
FROM TEACHERS


